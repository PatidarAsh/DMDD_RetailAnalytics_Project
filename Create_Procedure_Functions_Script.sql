


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
BEGIN
    -- Check if there's an active cart for the user
    BEGIN
        SELECT Cart_ID, User_id
        INTO V_Cart_ID, V_User_ID
        FROM USER_CART_VIEW
        WHERE User_NAME = PI_USER_NAME;
        
       
        
        DBMS_OUTPUT.PUT_LINE('USER_ID: ' || V_User_ID);

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
        
    
    END;
END ADD_TO_CART_ITEMS;
/




