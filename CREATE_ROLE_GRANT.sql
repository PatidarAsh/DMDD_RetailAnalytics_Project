

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




---FOR CUSTOMER USER (VIEWS)

-- Product_Details_View
GRANT SELECT ON Art.Product_Details_View TO Customer;

-- Price_Comparison_View
GRANT SELECT ON Art.Price_Comparison_View TO Customer;

-- Shopping_Cart_View
GRANT SELECT ON Art.Shopping_Cart_View TO Customer;

--FOR CUSTOMER USER (PROCEDURE)

GRANT EXECUTE ON art.ADD_TO_CART_ITEMS TO Customer;

GRANT EXECUTE ON 



----------------------------------------------------------------------

--FOR STORE_MANAGER USER (BASE TABLE)

GRANT SELECT ON ART.STORE TO Store_Manager;

-- FOR STORE_MANAGER USER (VIEWS)
-- Product_Details_View
GRANT SELECT ON art.Product_Details_View TO Store_Manager;

-- Price_Comparison_View
GRANT SELECT ON art.Price_Comparison_View TO Store_Manager;


-- Store_Inventory_View
GRANT SELECT ON art.Store_Inventory_View TO Store_Manager;

-- Price_Update_View
GRANT SELECT ON art.Price_Update_View TO Store_Manager;


-- FOR STORE MANAGER USER (PROCEDURES)
GRANT EXECUTE ON art.Update_Product_Price TO Store_Manager;








