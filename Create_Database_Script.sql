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
    VALUES (user_id_seq.NEXTVAL, 'Mike Johnson', '789 Elm Lane,', '111-222-3333');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'Emily Brown', '567 Pine Road,', '444-555-6666');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'Chris Williams', '890 Cedar Drive', '777-888-9999');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'Sarah Wilson', '234 Birch Street', '333-222-1111');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'Alex Clark', '901 Spruce Avenue', '666-777-8888');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'Ava Martinez', '345 Walnut Lane', '999-888-7777');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'Daniel Taylor', '678 Maple Road', '222-333-4444');
    
    INSERT INTO USERS (User_ID, User_Name, User_Address, User_Phone) 
    VALUES (user_id_seq.NEXTVAL, 'Olivia Anderson', '123 Oak Street', '555-444-3333');
    

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
        CartTotal NUMBER(10, 2) DEFAULT 0.00,
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
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Costco', '78 Bargain Blvd', 2.0);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Target', '22 Harrison Avenue', 2.5);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Walmart', '301 Falls Blvd', 3.5);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Kroger', '22 Saugus Street', 2.0);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Sams Club', '260 Shawmut Ave', 2.0);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'WholeFoods', '15 Westland Ave', 6.5);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Publix', '100 Hanover Street', 2.5);
    
    INSERT INTO STORE (store_id, store_name, store_location, discount)
    VALUES (STORE_ID_SEQ.NEXTVAL, 'Dollar General', '1030 Cambridge street', 2.5);
    
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
    VALUES (PRICE_ID_SEQ.NEXTVAL, 101, 103, 2.5, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 102, 106, 4.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 103, 101, 499.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 104, 106, 3.5, SYSDATE); 
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 105, 105, 1499.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 106, 101, 399.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 107, 108, 2.5, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 108, 106, 3.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 109, 105, 70.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 110, 102, 399.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 111, 106, 49.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 112, 101, 419.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 113, 103, 20.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 114, 102, 15.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 115, 106, 6.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 116, 108, 10.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 117, 104, 5.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 118, 105, 99.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 119, 102, 99.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 120, 101, 70.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 101, 102, 3.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 101, 108, 3.5, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 102, 107, 3.5, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 103, 101, 449.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 104, 102, 4.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 107, 103, 3.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 108, 102, 3.5, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 109, 102, 65.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 110, 103, 449.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 114, 107, 12.0, SYSDATE);
    
    INSERT INTO PRICES (Price_ID, Product_ID,  Store_ID, Price, DateLastUpdated)
    VALUES (PRICE_ID_SEQ.NEXTVAL, 118, 101, 89.0, SYSDATE);
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
SELECT * FROM CART_ITEMS;
/
CREATE SEQUENCE PRODUCT_SEQ
START WITH 101
INCREMENT BY 1
NOCYCLE;
/
CREATE TABLE PRODUCT (
        Product_ID NUMBER ,
        Product_Name VARCHAR2(100)UNIQUE NOT NULL,
        Description VARCHAR2(100) NOT NULL,
        Manufacturer VARCHAR2(100) NOT NULL,
        Category VARCHAR2(100) NOT NULL,
        CONSTRAINT Product_ID_PK PRIMARY KEY(Product_ID)
    )
/
-- Insert into the table using the sequence
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Quinoa Rice', 'Organic Rice with Flaxseed Mix Microwavable Pouch-8.5 oz', 'Seeds of Change', 'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer, Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Whole milk', 'Hood Whole Milk - 1gal', 'Hood',  'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'HP Laptop', 'HP 14" Chromebook Laptop - Intel Processor - 4GB RAM Memory - 64GB Flash Storage - Silver', 'HP', 'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Bread', 'Whole wheat bread', 'Sara Lee', 'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Iphone 15 pro', 'iPhone 15 Pro Max with AppleCare+ (Unlocked, 512GB, Black Titanium)', 'Apple',  'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'LED TV', 'Philips 32" Class 1080p FHD Roku Smart LED TV', 'Philips', 'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Spaghetti', 'Canned Pasta', 'SpaghettiOs Original Canned Pasta',  'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Granola', 'French Vanilla Almond Granola', 'Good AND Gather',  'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Airpods', 'Apple AirPods (3rd Generation) with MagSafe Charging Case', 'Apple',  'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Apple Smart Watch', 'Apple Watch Series 8 (GPS)', 'Apple',  'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Whole Bean Coffee', 'Organic Whole Bean Coffee', 'Starbucks',  'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Tab', 'Samsung Galaxy Tab S9', 'Samsung',  'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Chicken Nuggets', 'Natural Chicken Nuggets', 'AppleGate',  'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Tomato Ketchup', 'Heinz, Tomato Ketchup, 44 oz, 3-Count', 'Heinz',  'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Ranch Dressing', 'Gluten free', 'Hidden Valley',  'Grocery');
    
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Oats', 'Hot oatmeal cereal', 'Quaker',  'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Milk Chocolate', 'Roasted Almonds Covered In Milk Chocolate', 'Kirkland',  'Grocery');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Gaming Monitor', 'Curved Gaming Monitor', 'Kirkland',  'Electronics');
    
    INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'Headphones', 'Noise Cancelling Over-the-Ear Headphones', 'Bose',  'Electronics');
    
      INSERT INTO PRODUCT (Product_ID, Product_Name, Description, Manufacturer,  Category)
    VALUES (PRODUCT_SEQ.NEXTVAL, 'SD Card', 'Extreme 400GB microSD Card with Adapter', 'SanDisk',  'Electronics');
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
ALTER TABLE PRICES ADD CONSTRAINT fk_store FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID);
/
ALTER TABLE PRICES ADD CONSTRAINT fk_prices_product FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID);
/
ALTER TABLE STORE_MANAGER ADD CONSTRAINT fk_store_manager_store FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID);
/


