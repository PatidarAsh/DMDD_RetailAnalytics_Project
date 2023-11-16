
  -- Create the USER table
DECLARE
    table_exists VARCHAR(1) := 'N';
    V_DDL VARCHAR(3000) ;
BEGIN
    -- Check if the table exists
    SELECT 'Y'
    INTO table_exists
    FROM user_tables
    WHERE table_name = 'USERS';

EXCEPTION
    WHEN NO_DATA_FOUND  THEN
    V_DDL := '
    CREATE TABLE USERS (
        User_ID NUMBER CONSTRAINT PK_User_ID PRIMARY KEY,
        User_Name VARCHAR2(50) UNIQUE NOT NULL,
        User_Address VARCHAR2(200) NOT NULL,
        User_Phone VARCHAR(20) NOT NULL
    )';
    EXECUTE IMMEDIATE V_DDL;
    
END;
/


  -- Create the STORE table
DECLARE
    table_exists VARCHAR(1) := 'N';
    V_DDL VARCHAR(3000) ;
BEGIN
    -- Check if the table exists
    SELECT 'Y'
    INTO table_exists
    FROM user_tables
    WHERE table_name = 'STORE';

EXCEPTION
    WHEN NO_DATA_FOUND  THEN
    V_DDL := '
    CREATE TABLE STORE (
    Store_ID VARCHAR2(12) PRIMARY KEY,
    Store_Name VARCHAR2(30) NOT NULL,
    Store_Location VARCHAR2(30) NOT NULL,
    Discount FLOAT DEFAULT 0.00
    )';
    EXECUTE IMMEDIATE V_DDL;
    
END;
/
 
 
 
 -- Create the CART table
 DECLARE
    table_exists VARCHAR(1) := 'N';
    V_DDL VARCHAR(3000) ;
BEGIN
    -- Check if the table exists
    SELECT 'Y'
    INTO table_exists
    FROM user_tables
    WHERE table_name = 'CART';

EXCEPTION
    WHEN NO_DATA_FOUND  THEN
    V_DDL := '
    CREATE TABLE CART (
    Cart_ID NUMBER PRIMARY KEY,
    User_ID NUMBER,
    CartTotal FLOAT NOT NULL,
    CreationTime DATE NOT NULL,
    ModificationTime DATE,
    CONSTRAINT fk_user FOREIGN KEY (User_ID) REFERENCES USERS(User_ID)
    )';
    EXECUTE IMMEDIATE V_DDL;
    
END;
/  




 -- Create the PRICES table

DECLARE
    table_exists VARCHAR(1) := 'N';
    V_DDL VARCHAR(3000) ;
BEGIN
    -- Check if the table exists
    SELECT 'Y'
    INTO table_exists
    FROM user_tables
    WHERE table_name = 'PRICES';

EXCEPTION
    WHEN NO_DATA_FOUND  THEN
    V_DDL := '
    CREATE TABLE PRICES (
    Price_ID NUMBER PRIMARY KEY,
    Product_ID NUMBER,
    Store_ID VARCHAR2(50),
    Price FLOAT NOT NULL,
    DateLastUpdated DATE NOT NULL,
    CONSTRAINT fk_store FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID)
    )';
    EXECUTE IMMEDIATE V_DDL;
    
END;
/


 -- Create the CART_ITEMS table
DECLARE
    table_exists VARCHAR(1) := 'N';
    V_DDL VARCHAR(3000) ;
BEGIN
    -- Check if the table exists
    SELECT 'Y'
    INTO table_exists
    FROM user_tables
    WHERE table_name = 'CART_ITEMS';

EXCEPTION
    WHEN NO_DATA_FOUND  THEN
    V_DDL := '
    CREATE TABLE CART_ITEMS (
    CartItem_ID NUMBER PRIMARY KEY,
    Cart_ID NUMBER,
    Product_ID NUMBER,
    Quantity INTEGER NOT NULL,
    Price_ID FLOAT,
    isCheckedOut CHAR(1) CHECK (isCheckedOut IN (''Y'', ''N'')),
    ModeOfPayment VARCHAR2(20) CHECK (ModeOfPayment IN (''Cash'', ''Debit'', ''Credit'')),
    CONSTRAINT fk_cart FOREIGN KEY (Cart_ID) REFERENCES Cart(Cart_ID),
    CONSTRAINT fk_price FOREIGN KEY (Price_ID) REFERENCES Prices(Price_ID)
    )';
    EXECUTE IMMEDIATE V_DDL;
    
END;
/


  -- Create the PRODUCT table

DECLARE
    table_exists VARCHAR(1) := 'N';
    V_DDL VARCHAR(3000) ;
BEGIN
    -- Check if the table exists
    SELECT 'Y'
    INTO table_exists
    FROM user_tables
    WHERE table_name = 'PRODUCT';

EXCEPTION
    WHEN NO_DATA_FOUND  THEN
    V_DDL := '
    CREATE TABLE PRODUCT (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(25)UNIQUE NOT NULL,
    Description VARCHAR2(40) NOT NULL,
    Manufacturer VARCHAR2(20) NOT NULL,
    CartItem_ID NUMBER,
    Category VARCHAR2(20) NOT NULL,
    
    CONSTRAINT fk_cart_item FOREIGN KEY (CartItem_ID) REFERENCES CART_ITEMS(CartItem_ID)
    )';
    EXECUTE IMMEDIATE V_DDL;
    
END;
/


-- Create the STORE_MANAGER table
DECLARE
    table_exists VARCHAR(1) := 'N';
    V_DDL VARCHAR(3000) ;
BEGIN
    -- Check if the table exists
    SELECT 'Y'
    INTO table_exists
    FROM user_tables
    WHERE table_name = 'STORE_MANAGER';

EXCEPTION
    WHEN NO_DATA_FOUND  THEN
    V_DDL := '
    CREATE TABLE STORE_MANAGER (
    Manager_ID NUMBER PRIMARY KEY,
    Store_ID VARCHAR2(12),
    SM_Name VARCHAR2(20) NOT NULL,
    SM_Address VARCHAR2(30) NOT NULL,
    SM_PHONE NUMBER NOT NULL,
    CONSTRAINT fk_store_manager_store FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID)
    )';
    EXECUTE IMMEDIATE V_DDL;
    
END;
/






DECLARE
    constraint_exists NUMBER := 0;
BEGIN
    -- Check if the constraint exists
    SELECT COUNT(*)
    INTO constraint_exists
    FROM user_constraints
    WHERE table_name = 'PRICES'
    AND constraint_name = 'FK_PRICES_PRODUCT';

    -- Drop the constraint if it exists
    IF constraint_exists > 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE PRICES DROP CONSTRAINT FK_PRICES_PRODUCT';
        DBMS_OUTPUT.PUT_LINE('Foreign key constraint FK_PRICES_PRODUCT dropped from PRICES table.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Foreign key constraint FK_PRICES_PRODUCT does not exist in PRICES table.');
    END IF;

    -- Add the constraint again
    EXECUTE IMMEDIATE 'ALTER TABLE PRICES ADD CONSTRAINT FK_PRICES_PRODUCT FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID)';
    DBMS_OUTPUT.PUT_LINE('Foreign key constraint FK_PRICES_PRODUCT added to PRICES table.');
END;
/





DECLARE
    constraint_exists NUMBER := 0;
BEGIN
    -- Check if the constraint exists
    SELECT COUNT(*)
    INTO constraint_exists
    FROM user_constraints
    WHERE table_name = 'CART_ITEMS'
    AND constraint_name = 'FK_PRODUCT';

    -- Drop the constraint if it exists
    IF constraint_exists > 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE CART_ITEMS DROP CONSTRAINT FK_PRODUCT';
        DBMS_OUTPUT.PUT_LINE('Foreign key constraint FK_PRODUCT dropped from CART_ITEMS table.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Foreign key constraint FK_PRODUCT does not exist in CART_ITEMS table.');
    END IF;

    -- Add the constraint again
    EXECUTE IMMEDIATE 'ALTER TABLE CART_ITEMS ADD CONSTRAINT FK_PRODUCT FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID)';
    DBMS_OUTPUT.PUT_LINE('Foreign key constraint FK_PRODUCT added to CART_ITEMS table.');
END;
/




