CREATE OR REPLACE PROCEDURE Create_Cart_For_NewUser(
    newUserID IN NUMBER
) AS
    newCartID NUMBER;
BEGIN
    -- Generate a new unique cart ID, e.g., using a sequence or any desired method
    SELECT cart_id_seq.NEXTVAL INTO newCartID FROM dual;  -- Replace 'cart_id_seq' with your sequence name

    -- Insert the newly generated cart ID for the new user into the CART table
    INSERT INTO CART (Cart_ID, User_ID, CreationTime, ModificationTime)
    VALUES (newCartID, newUserID, SYSDATE, SYSDATE);

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Cart ID ' || newCartID || ' created for User ID ' || newUserID);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found.');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate value found on an index.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error creating cart for User ID ' || newUserID);
END;
/


--3.--ADD_TO_CART_ITEMS
--This procedure takes input from customer like : Name, Product Name, Quantity, MOde_of_payment, whether he/she wants to check out their cart items or not 
--First it checks if there is any active cart againts a user , if found then insert data in that one 
-- if not found then creates a new entry 

CREATE OR REPLACE PROCEDURE ADD_TO_CART_ITEMS(
    PI_USER_NAME VARCHAR2,
    PI_PRODUCT_NAME VARCHAR2,
    PI_QUANTITY NUMBER,
    PI_MODE_OF_PAYMENT VARCHAR2,
    PI_IS_CHECKED_OUT CHAR
)
AS
    V_Cart_ID CART.CART_ID%TYPE;
    V_User_ID USERS.User_id%TYPE;
    V_Product_ID PRODUCT.PRODUCT_ID%TYPE;
    V_Price_ID PRICES.PRICE_ID%TYPE;
    V_Existing_Quantity CART_ITEMS.Quantity%TYPE;
    V_IsCheckedOut CART_ITEMS.isCheckedOut%TYPE;
    E_USER_NOT_FOUND EXCEPTION;
BEGIN
    -- Check if there's an active cart for the user
    BEGIN
        SELECT Cart_ID, User_id
        INTO V_Cart_ID, V_User_ID
        FROM USER_CART_VIEW
        WHERE User_NAME = PI_USER_NAME;
        
        IF V_User_ID IS NULL THEN
            RAISE E_USER_NOT_FOUND;
        END IF;
        
        --DBMS_OUTPUT.PUT_LINE('USER_ID: ' || V_User_ID);
        
    EXCEPTION
        WHEN E_USER_NOT_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No active user_ID found for the user.'); 
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No active cart found for the user.'); 
            RETURN;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred while searching for the cart.');
            RETURN;
    END;
    
    -- Get the current checked out status for the cart
    BEGIN
        
        IF PI_IS_CHECKED_OUT = 'Y' THEN
            DBMS_OUTPUT.PUT_LINE('Unable to proceed with checkout; shopping is currently in progress');
            -- Throw an error or handle this scenario as required.
            RETURN;
        END IF;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- No items checked out yet, proceed with adding items to the cart
            NULL;
    END;


    -- Get the Product_ID and Price_ID based on the Product_Name
    BEGIN
        SELECT Product_ID, Price_ID
        INTO V_Product_ID, V_Price_ID
        FROM (
            SELECT Product_ID, Price_ID
            FROM PRODUCT_PRICE_VIEW
            WHERE Product_NAME = PI_PRODUCT_NAME
            AND ROWNUM = 1 -- Limit to one record
        );
        
        --DBMS_OUTPUT.PUT_LINE('PRODUCT ID: ' || V_Product_ID);
        --DBMS_OUTPUT.PUT_LINE('PRICE ID: ' || V_Price_ID);
        
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Product not found.');
            -- Handle if the product doesn't exist.
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
            -- Handle other exceptions as needed.
            ROLLBACK; -- Rollback changes made within the procedure due to exception.
    END;

END ADD_TO_CART_ITEMS;
/
-------------------------------------------------------------------------------------------------------------
------CART TOTAL PROCEDURE TO DISPLAY THE FINAL AMOUNT AFTER ADDING ITEMS TO THE CART

CREATE OR REPLACE PROCEDURE CalculateCartTotalByUserName(
    p_User_name IN VARCHAR2
) AS
    v_Cart_ID CART.CART_ID%TYPE;
    v_User_ID USERS.USER_ID%TYPE; -- Changed variable name to avoid conflict
    v_NewCartTotal NUMBER;
BEGIN
    -- Retrieve the Cart_ID for the specified Username
    SELECT USER_ID , Cart_ID
    INTO v_User_ID ,v_Cart_ID
    FROM USER_CART_VIEW
    WHERE User_name = p_User_name;


    -- Calculate the new CartTotal based on the sum of item quantities in the cart
    SELECT NVL(SUM(Quantity * Price), 0)
    INTO v_NewCartTotal
    FROM CART_ITEMS CI
    JOIN PRICES P ON CI.Price_ID = P.Price_ID
    WHERE CI.Cart_ID = v_Cart_ID;

    -- Update the CartTotal in the CART table
    UPDATE CART
    SET CartTotal = v_NewCartTotal
    WHERE Cart_ID = v_Cart_ID;

    DBMS_OUTPUT.PUT_LINE('CartTotal for Username ' || P_USER_NAME || ' updated successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Cart not found for Username ' || P_USER_NAME);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error calculating CartTotal: ' || SQLERRM);
END CalculateCartTotalByUserName;
/

--- Function

CREATE OR REPLACE FUNCTION GetCartTotalByUsername(p_Username VARCHAR2) RETURN NUMBER AS
    v_CartTotal NUMBER := 0;
  BEGIN
    -- Fetch the CartTotal for the given Username
    SELECT c.CartTotal
    INTO v_CartTotal
    FROM Cart c
    JOIN Cart_items ci ON c.Cart_ID = ci.Cart_ID
    JOIN Users u ON u.User_ID = c.User_ID
    WHERE u.User_Name = p_Username;

    RETURN v_CartTotal;
  END GetCartTotalByUsername;
/


--- Procedure to call function
CREATE OR REPLACE PROCEDURE GETCARTTOTAL(P_USER_NAME IN VARCHAR2) AS
  V_CARTTOTAL CART.CARTTOTAL%TYPE; 
BEGIN
  -- Call the AddTwoNumbers function
  V_CARTTOTAL := GetCartTotalByUsername(P_USER_NAME);

  -- Print the result or use it as needed
  DBMS_OUTPUT.PUT_LINE('Cart Total for the Username: ' || V_CARTTOTAL);
END GETCARTTOTAL;
/


-----------------------------------------------------------------------------------------------------


-- Update Product Price by Store Manager
CREATE OR REPLACE PROCEDURE Update_Product_Price(
    p_Store_ID           IN VARCHAR2,
    p_Product_Name       IN VARCHAR2,
    p_Discount           IN NUMBER
) IS
    v_Product_ID         Prices.Product_ID%TYPE;
    v_New_Price          NUMBER(10 ,2);
BEGIN
    -- Retrieve the Product_ID for the specified product name and store ID
    SELECT Product_ID INTO v_Product_ID
    FROM Prices
    WHERE Product_ID = (SELECT Product_ID FROM Product WHERE Product_Name = p_Product_Name)
      AND Store_ID = p_Store_ID;
      
      -- Update the date_last_update  
    UPDATE PRICES 
    SET DATELASTUPDATED = SYSDATE
    WHERE Product_ID = v_Product_ID
    AND Store_ID = p_Store_ID;
    
    COMMIT;

  
END Update_Product_Price;
/


--Retrieves product information (product name, price, and store name) based on a provided product name.
CREATE OR REPLACE FUNCTION GetProductPriceAndName(
    productName IN VARCHAR2
) RETURN SYS_REFCURSOR AS
    priceCursor SYS_REFCURSOR;
BEGIN
    OPEN priceCursor FOR
    SELECT p.Product_Name, pr.Price, s.store_name
    FROM Prices pr
    JOIN Product p ON p.Product_ID = pr.Product_ID
    JOIN Store s ON s.store_ID = pr.Store_ID
    WHERE p.Product_Name = productName;

    RETURN priceCursor;
END;
/
CREATE OR REPLACE PROCEDURE DisplayProductPriceWithName (
    productName IN VARCHAR2
) AS
    priceCursor SYS_REFCURSOR;
    productNameVar VARCHAR2(100);
    sellingPrice NUMBER;
    StoreName varchar2(50);
BEGIN
    priceCursor := GetProductPriceAndName(productName);

    LOOP
        FETCH priceCursor INTO productNameVar, sellingPrice, StoreName ;
        EXIT WHEN priceCursor%NOTFOUND;

        -- Display the retrieved data
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || productNameVar || ',  Selling Price: ' || sellingPrice || ',  Store Name:' || StoreName);
    END LOOP;

    CLOSE priceCursor;
END;
/

---------------------------------------------------------------------------------------------------------------------------------


--Update or Insert User before adding to cart PROCEDURE:

CREATE OR REPLACE PROCEDURE UPDATE_INSERT_USER (
    p_user_name VARCHAR2,
    p_user_address VARCHAR2,
    p_user_phone VARCHAR2
)
AS
    v_count NUMBER;
BEGIN
    -- Check if user name already exists
    SELECT COUNT(*) INTO v_count FROM USERS WHERE User_Name = p_user_name;

    IF v_count = 0 THEN
        -- Insert if user name doesn't exist
        INSERT INTO USERS(User_ID, User_Name, User_Address, User_Phone)
        VALUES (USER_ID_SEQ.NEXTVAL, p_user_name, p_user_address, p_user_phone);
        DBMS_OUTPUT.PUT_LINE('User details added.');
    ELSE 
    SELECT COUNT(*) INTO v_count 
        FROM USERS 
        WHERE User_Name = p_user_name
        AND (User_Address <> p_user_address OR User_Phone <> p_user_phone);
-- Check if user address and phone are different
        SELECT COUNT(*) INTO v_count 
        FROM USERS 
        WHERE User_Name = p_user_name
        AND (User_Address <> p_user_address OR User_Phone <> p_user_phone);

        IF v_count > 0 THEN
            -- Update if user details are different
            UPDATE USERS 
            SET User_Address = p_user_address, 
                User_Phone = p_user_phone 
            WHERE User_Name = p_user_name;
            DBMS_OUTPUT.PUT_LINE('User details updated.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('No changes made. User details already exist.');
        END IF;
    END IF;
    
    COMMIT;
EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/