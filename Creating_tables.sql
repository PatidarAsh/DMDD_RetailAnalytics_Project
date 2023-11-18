SET SERVEROUTPUT ON
/
DECLARE
CURSOR C_FK IS SELECT TABLE_NAME,CONSTRAINT_NAME FROM USER_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'R'; --CURSOR TO STORE TABLE NAME AND CONSTRAINT NAME
CURSOR C_SK IS SELECT SEQUENCE_NAME FROM USER_SEQUENCES;
CURSOR C_TBL IS SELECT TABLE_NAME FROM USER_TABLES;

I NUMBER:=0;                                                                                        --DECLARE AND INITALIZE VARIABLE I
V_COUNT  NUMBER :=0;
V_COUNT1 NUMBER:=0;--DECLARE COUNTER 
V_COUNT2 NUMBER:=0;

BEGIN
WHILE I<5                                                                                           --WHILE LOOP TO ITERATE I VARIABLE UNTIL I VALUE IS LESS THAN 3
	LOOP
		I:=I+1;                                                                                     --INCREMENT I VALUE
		SELECT COUNT(*) INTO V_COUNT FROM USER_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'R';				--SELECT QUERY TO INSERT NUMBER OF REFRENTIAL KEYS INTO VARIABLE V_COUNT
		SELECT COUNT(*) INTO V_COUNT1 FROM USER_SEQUENCES;	
		SELECT COUNT(*) INTO V_COUNT2 FROM USER_TABLES;
        
            IF I=1 AND V_COUNT>0 THEN                                                               --IF CLAUSE TO CHECK I VALUE AND NUMBER OF VALUES IN V_COUNT VARIABLE
					FOR FK IN C_FK LOOP 
                    DBMS_OUTPUT.PUT_LINE('DROPPING FOREIGN KEY CONSTRAINTS FOR TABLE '||FK.TABLE_NAME);--FOR LOOP TO ITERATE CURSOR C_FK
					EXECUTE IMMEDIATE 'ALTER TABLE ' || FK.TABLE_NAME || ' DROP CONSTRAINT ' || FK.CONSTRAINT_NAME; --DROP ALL FOREIGN KEY CONSTRAINTS IN DATABASE             --DISPLAY DROPPING MESSAGE TO CONSOLE
					END LOOP;
            ELSE IF I=2 AND V_COUNT1>0 THEN
                    FOR SK IN C_SK LOOP
                    DBMS_OUTPUT.PUT_LINE('DROPPING SEQUENCES '||SK.SEQUENCE_NAME);
                    EXECUTE IMMEDIATE 'DROP SEQUENCE '||SK.SEQUENCE_NAME;
                    END LOOP;
            ELSE IF I=3 AND V_COUNT2>0 THEN
					FOR TBL IN C_TBL LOOP
                    DBMS_OUTPUT.PUT_LINE('DROPPING TABLES '||TBL.TABLE_NAME);
					EXECUTE IMMEDIATE 'DROP TABLE '||TBL.TABLE_NAME;
					END LOOP;
			
			ELSE IF i=4 AND V_COUNT=0 AND V_COUNT1=0 AND V_COUNT2=0  THEN
					DBMS_OUTPUT.PUT_LINE('NO OBJECTS EXISTS IN DATABASE');
			END IF;
            END IF;
            END IF;
            END IF;
           
END LOOP;
DBMS_OUTPUT.PUT_LINE('DATABASE CLEANUP DONE SUCCESSFULLY');
END;
/
CREATE SEQUENCE USER_ID_SEQ
START WITH 101
INCREMENT BY 1
NOCYCLE;
/
CREATE TABLE USERS (
        User_ID NUMBER,
        User_Name VARCHAR2(50) UNIQUE NOT NULL,
        User_Address VARCHAR2(200) NOT NULL,
        User_Phone VARCHAR(20) NOT NULL,
        CONSTRAINT User_ID_PK PRIMARY KEY(User_ID)
    )
/
-- Insert into the table using the sequence
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone)
    VALUES (user_id_seq.NEXTVAL, 'John Doe', '123 Main Street', '123-456-7890');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone)
    VALUES (user_id_seq.NEXTVAL, 'Jane Smith', '456 Elm Street', '987-654-3210');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'MikeJohnson', '789 Elm Lane,', '111-222-3333');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'EmilyBrown', '567 Pine Road,', '444-555-6666');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'ChrisWilliams', '890 Cedar Drive', '777-888-9999');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'SarahWilson', '234 Birch Street', '333-222-1111');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'AlexClark', '901 Spruce Avenue', '666-777-8888');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'AvaMartinez', '345 Walnut Lane', '999-888-7777');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'DanielTaylor', '678 Maple Road', '222-333-4444');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'OliviaAnderson', '123 Oak Street', '555-444-3333');
    

/
COMMIT;
/
SELECT *FROM USERS;
/
CREATE SEQUENCE CART_ID_SEQ
START WITH 101
INCREMENT BY 1
NOCYCLE;
/
CREATE TABLE CART (
        Cart_ID NUMBER ,
        User_ID NUMBER,
        CreationTime DATE NOT NULL,
        ModificationTime DATE,
        CONSTRAINT Cart_ID_PK PRIMARY KEY(Cart_ID)
    )
/
 -- Insert into the table using the sequence
    INSERT INTO CART (Cart_ID, User_ID,  CreationTime, ModificationTime)
    VALUES (CART_ID_SEQ.NEXTVAL, 101  , SYSDATE - 1, SYSDATE);
    
    INSERT INTO CART (Cart_ID, User_ID,  CreationTime, ModificationTime)
    VALUES (CART_ID_SEQ.NEXTVAL, 102 ,  SYSDATE - 1, SYSDATE);
    
    INSERT INTO CART (Cart_ID, User_ID, CreationTime, ModificationTime)
    VALUES (CART_ID_SEQ.NEXTVAL, 103 ,  SYSDATE - 1, SYSDATE);
    
    INSERT INTO CART (Cart_ID, User_ID, CreationTime, ModificationTime)
    VALUES (CART_ID_SEQ.NEXTVAL, 104 ,  SYSDATE - 1, SYSDATE);
    
    INSERT INTO CART (Cart_ID, User_ID,  CreationTime, ModificationTime)
    VALUES (CART_ID_SEQ.NEXTVAL, 105 , SYSDATE - 1, SYSDATE);
    
    INSERT INTO CART (Cart_ID, User_ID,  CreationTime, ModificationTime)
    VALUES (CART_ID_SEQ.NEXTVAL, 106 , SYSDATE - 1, SYSDATE);
    
    INSERT INTO CART (Cart_ID, User_ID,  CreationTime, ModificationTime)
    VALUES (CART_ID_SEQ.NEXTVAL, 107 ,  SYSDATE - 1, SYSDATE);
    
    INSERT INTO CART (Cart_ID, User_ID,  CreationTime, ModificationTime)
    VALUES (CART_ID_SEQ.NEXTVAL, 108 ,  SYSDATE - 1, SYSDATE);
/
COMMIT;
/
SELECT *FROM CART;
/    
CREATE SEQUENCE STORE_ID_SEQ
START WITH 101
INCREMENT BY 1
NOCYCLE;
/
CREATE TABLE STORE (
    Store_ID NUMBER ,
    Store_Name VARCHAR2(30) NOT NULL,
    Store_Location VARCHAR2(30) NOT NULL,
    Discount FLOAT DEFAULT 0.00,
    CONSTRAINT STORE_ID_PK PRIMARY KEY(STORE_ID)
    )
/
-- Insert into the table using the sequence
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Costco', '123 Warehouse Ave', 10.0);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Target', '456 Retail Street', 8.8);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Walmart', '789 Supercenter Lane', 15.5);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Kroger', '567 Grocery Blvd', 12.7);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Sams Club', '890 Bulk Goods Road', 7.2);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'WholeFoods', '234 Organic Lane', 9.5);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Publix', '876 Fresh Market Drive', 6.8);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Dollar General', '210 Discount Ave', 5.0);
/
COMMIT;
/
SELECT *FROM STORE;
/ 
CREATE SEQUENCE PRICE_ID_SEQ
START WITH 101
INCREMENT BY 1
NOCYCLE;
/
CREATE TABLE PRICES (
    Price_ID NUMBER ,
    Product_ID NUMBER,
    Store_ID NUMBER,
    Price FLOAT NOT NULL,
    DateLastUpdated DATE NOT NULL,
    CONSTRAINT PRICE_ID_PK PRIMARY KEY(Price_ID)
    )
/
-- Insert into the table using the sequence
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 101, 101, 110.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 101, 102, 90.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 101, 103, 100.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 102, 102, 85.0, SYSDATE); 
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 103, 103, 50.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 104, 104, 90.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 105, 105, 40.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 106, 106, 100.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 107, 107, 65.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 108, 108, 80.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 101, 102, 90.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 101, 103, 100.0, SYSDATE);
/
COMMIT;
/
SELECT *FROM PRICES;
/
CREATE SEQUENCE CART_ITEMS_SEQ
START WITH 101
INCREMENT BY 1
NOCYCLE;
/
CREATE TABLE CART_ITEMS (
        CartItem_ID NUMBER ,
        Cart_ID NUMBER,
        Product_ID NUMBER,
        Quantity INTEGER NOT NULL,
        Price_ID NUMBER,
        isCheckedOut CHAR(1) CHECK (isCheckedOut IN ('Y', 'N')),
        ModeOfPayment VARCHAR2(20) CHECK (ModeOfPayment IN ('Cash', 'Debit', 'Credit')),
        CONSTRAINT CartItem_ID_PK PRIMARY KEY(CartItem_ID)
    )
/
 -- Insert into the table using the sequence
    INSERT INTO CART_ITEMS (CartItem_ID, Cart_ID,  Product_ID, Quantity, Price_ID, isCheckedOut, ModeOfPayment)
    VALUES (CART_ITEMS_SEQ.NEXTVAL, 101, 101, 2, 101, 'Y', 'Cash');
    
    INSERT INTO CART_ITEMS (CartItem_ID, Cart_ID,  Product_ID, Quantity, Price_ID, isCheckedOut, ModeOfPayment)
    VALUES (CART_ITEMS_SEQ.NEXTVAL, 102, 102, 5, 102, 'N', 'Debit');
    
    INSERT INTO CART_ITEMS (CartItem_ID, Cart_ID,  Product_ID, Quantity, Price_ID, isCheckedOut, ModeOfPayment)
    VALUES (CART_ITEMS_SEQ.NEXTVAL, 103, 103, 1, 103, 'Y', 'Credit');

    INSERT INTO CART_ITEMS (CartItem_ID, Cart_ID,  Product_ID, Quantity, Price_ID, isCheckedOut, ModeOfPayment)
    VALUES (CART_ITEMS_SEQ.NEXTVAL, 104, 104, 3, 104, 'Y', 'Cash');
    
    INSERT INTO CART_ITEMS (CartItem_ID, Cart_ID,  Product_ID, Quantity, Price_ID, isCheckedOut, ModeOfPayment)
    VALUES (CART_ITEMS_SEQ.NEXTVAL, 105, 105, 4, 105, 'Y', 'Credit');
    
    INSERT INTO CART_ITEMS (CartItem_ID, Cart_ID,  Product_ID, Quantity, Price_ID, isCheckedOut, ModeOfPayment)
    VALUES (CART_ITEMS_SEQ.NEXTVAL, 106, 106, 6, 106, 'Y', 'Cash');
    
    INSERT INTO CART_ITEMS (CartItem_ID, Cart_ID,  Product_ID, Quantity, Price_ID, isCheckedOut, ModeOfPayment)
    VALUES (CART_ITEMS_SEQ.NEXTVAL, 107, 107, 8, 107, 'Y', 'Debit');
    
    INSERT INTO CART_ITEMS (CartItem_ID, Cart_ID,  Product_ID, Quantity, Price_ID, isCheckedOut, ModeOfPayment)
    VALUES (CART_ITEMS_SEQ.NEXTVAL, 108, 108, 7, 108, 'Y', 'Cash');

/
COMMIT
/
SELECT * FROM CART_ITEMS;
/
CREATE SEQUENCE PRODUCT_SEQ
START WITH 101
INCREMENT BY 1
NOCYCLE;
/
CREATE TABLE PRODUCT (
        Product_ID NUMBER ,
        Product_Name VARCHAR2(25)UNIQUE NOT NULL,
        Description VARCHAR2(40) NOT NULL,
        Manufacturer VARCHAR2(20) NOT NULL,
        CartItem_ID NUMBER,
        Category VARCHAR2(20) NOT NULL,
        CONSTRAINT Product_ID_PK PRIMARY KEY(Product_ID)
    )
/
-- Insert into the table using the sequence
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, CartItem_ID, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Rice', 'White rice', 'Brand A', 101 , 'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, CartItem_ID, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Milk', 'Whole milk', 'Brand B', 102 , 'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, CartItem_ID, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Laptop', 'High-performance laptop', 'Brand C', 103 , 'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, CartItem_ID, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Bread', 'Whole wheat bread', 'Brand D', 104 , 'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, CartItem_ID, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Smartphone', 'Latest smartphone model', 'Brand E', 105 , 'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, CartItem_ID, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Television', '4K Smart TV', 'Brand Z', 106 , 'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, CartItem_ID, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Pasta', 'Spaghetti rice', 'Brand H', 107 , 'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, CartItem_ID, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Cereal', 'Healthy cereal mix', 'NutriGood', 108 , 'Grocery');
/
COMMIT;
/
SELECT * FROM PRODUCT;
/
CREATE SEQUENCE STORE_MANAGER_SEQ
START WITH 101
INCREMENT BY 1
NOCYCLE;
/
CREATE TABLE STORE_MANAGER (
    Manager_ID NUMBER ,
    Store_ID NUMBER,
    SM_Name VARCHAR2(20) NOT NULL,
    SM_Address VARCHAR2(30) NOT NULL,
    SM_PHONE VARCHAR(20) NOT NULL,
     CONSTRAINT Manager_ID_PK PRIMARY KEY(Manager_ID)
    )
/
-- Insert into the table using the sequence
    INSERT INTO STORE_MANAGER (Manager_ID, Store_ID, SM_Name, SM_Address, SM_PHONE)
    VALUES (STORE_MANAGER_SEQ.NEXTVAL, 101, 'Alex', '675 Main Street', '123-456-7890');
    
    INSERT INTO STORE_MANAGER (Manager_ID, Store_ID, SM_Name, SM_Address, SM_PHONE)
    VALUES (STORE_MANAGER_SEQ.NEXTVAL, 102, 'Scott', '78 Harrison Ave', '987-654-3210');
    
    INSERT INTO STORE_MANAGER (Manager_ID, Store_ID, SM_Name, SM_Address, SM_PHONE)
    VALUES (STORE_MANAGER_SEQ.NEXTVAL, 103, 'Mary', '178 Oak Street', '123-987-7890');
    
    INSERT INTO STORE_MANAGER (Manager_ID, Store_ID, SM_Name, SM_Address, SM_PHONE)
    VALUES (STORE_MANAGER_SEQ.NEXTVAL, 104, 'Glory', '678 Dudley Street', '123-456-3498');
    
    INSERT INTO STORE_MANAGER (Manager_ID, Store_ID, SM_Name, SM_Address, SM_PHONE)
    VALUES (STORE_MANAGER_SEQ.NEXTVAL, 105, 'John', '875 Pine Road', '783-456-7890');
    
    INSERT INTO STORE_MANAGER (Manager_ID, Store_ID, SM_Name, SM_Address, SM_PHONE)
    VALUES (STORE_MANAGER_SEQ.NEXTVAL, 106, 'Emma', ' 45 Business Ave', '123-456-2854');
    
    INSERT INTO STORE_MANAGER (Manager_ID, Store_ID, SM_Name, SM_Address, SM_PHONE)
    VALUES (STORE_MANAGER_SEQ.NEXTVAL, 107, 'Ethan', ' 763 Retail street', '123-105-2854');
    
    INSERT INTO STORE_MANAGER (Manager_ID, Store_ID, SM_Name, SM_Address, SM_PHONE)
    VALUES (STORE_MANAGER_SEQ.NEXTVAL, 108, 'Sophie', '23 Harrison Ave', '123-456-9265');
/
COMMIT;
/
SELECT * FROM STORE_MANAGER;
/
ALTER TABLE CART ADD CONSTRAINT fk_user FOREIGN KEY (User_ID) REFERENCES USERS(User_ID);
/
ALTER TABLE CART_ITEMS ADD CONSTRAINT fk_cart FOREIGN KEY (Cart_ID) REFERENCES CART(Cart_ID);
/
ALTER TABLE CART_ITEMS ADD CONSTRAINT fk_price FOREIGN KEY (Price_ID) REFERENCES PRICES(Price_ID);
/
ALTER TABLE CART_ITEMS ADD CONSTRAINT fk_product FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID);
/
ALTER TABLE PRODUCT ADD CONSTRAINT fk_cart_item FOREIGN KEY (CartItem_ID) REFERENCES CART_ITEMS(CartItem_ID);
/
ALTER TABLE PRICES ADD CONSTRAINT fk_store FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID);
/
ALTER TABLE PRICES ADD CONSTRAINT fk_prices_product FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID);
/
ALTER TABLE STORE_MANAGER ADD CONSTRAINT fk_store_manager_store FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID);
/
