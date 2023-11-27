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

END ADD_TO_CART_ITEMS;
/

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


