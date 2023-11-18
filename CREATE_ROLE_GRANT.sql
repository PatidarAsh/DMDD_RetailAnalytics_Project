

--CREATES ROLES 
CREATE ROLE STORE_MANAGER;
CREATE ROLE CUSTOMER;


----------------------------------------------------
GRANT STORE_MANAGER TO Costco_SMGR101;
/
GRANT STORE_MANAGER TO Target_SMGR102;
/
GRANT STORE_MANAGER TO Walmart_SMGR103;
/
GRANT STORE_MANAGER TO SamsClub_SMGR104;
/
GRANT STORE_MANAGER TO Kroger_SMGR106;
/
GRANT STORE_MANAGER TO Publix_SMGR107;
/
GRANT STORE_MANAGER TO DollarGeneral_SMGR108;



------------------------------

GRANT CUSTOMER TO C101;
/
GRANT CUSTOMER TO C102;
/
GRANT CUSTOMER TO C103;
/
GRANT CUSTOMER TO C104;
/
GRANT CUSTOMER TO C105;
/
GRANT CUSTOMER TO C106;
/

--------------------------------------
--FOR CUSTOMER USER (BASE TABLE)

-- User Table
GRANT SELECT ON Art.Users TO CUSTOMER;



-- Cart Table
GRANT SELECT, INSERT, UPDATE, DELETE ON Art.Cart TO Customer;

-- Cart_Items Table
GRANT SELECT, INSERT, UPDATE, DELETE ON Art.Cart_Items TO Customer;

-- Product Table
GRANT SELECT ON Art.Product TO Customer;

-- Prices Table
GRANT SELECT ON Art.Prices TO Customer;

-- Store Table
GRANT SELECT ON Art.Store TO Customer;


---FOR CUSTOMER USER (VIEWS)

-- Product_Details_View
GRANT SELECT ON Art.Product_Details_View TO Customer;

-- Price_Comparison_View
GRANT SELECT ON Art.Price_Comparison_View TO Customer;

-- Shopping_Cart_View
GRANT SELECT ON Art.Shopping_Cart_View TO Customer;

-- Store_Inventory_View
GRANT SELECT ON Art.Store_Inventory_View TO Customer;

-- Price_Update_View
GRANT SELECT ON Art.Price_Update_View TO Customer;



----------------------------------------------------------------------

--FOR STORE_MANAGER USER (BASE TABLE)

-- User Table
GRANT SELECT ON art.Users TO Store_Manager;

-- Cart Table
GRANT SELECT ON art.Cart TO Store_Manager;

-- Cart_Items Table
GRANT SELECT ON art.Cart_Items TO Store_Manager;

-- Product Table
GRANT SELECT ON art.Product TO Store_Manager;

-- Prices Table
GRANT SELECT, UPDATE ON art.Prices TO Store_Manager;

-- Store Table
GRANT SELECT ON art.Store TO Store_Manager;

-- Store_Manager Table
GRANT SELECT ON art.Store_Manager TO Store_Manager;


-- FOR STORE_MANAGER USER (VIEWS)
-- Product_Details_View
GRANT SELECT ON art.Product_Details_View TO Store_Manager;

-- Price_Comparison_View
GRANT SELECT ON art.Price_Comparison_View TO Store_Manager;

-- Shopping_Cart_View
GRANT SELECT ON art.Shopping_Cart_View TO Store_Manager;

-- Store_Inventory_View
GRANT SELECT ON art.Store_Inventory_View TO Store_Manager;

-- Price_Update_View
GRANT SELECT ON art.Price_Update_View TO Store_Manager;





