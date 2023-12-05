

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

--FOR CUSTOMER USER (Procedure)

--new customer can be added and exsiting customers data can be updated
GRANT EXECUTE ON Art.UPDATE_OR_INSERT_USER TO Customer;

--Customer will get cart total 
GRANT EXECUTE ON Art.GETCARTTOTAL TO Customer;

--this procedure will display name of product and price on passing product as an input 
GRANT EXECUTE ON Art.DISPLAYPRODUCTPRICEWITHNAME TO Customer;

--Using this procedure customer will be able to add item in cart
GRANT EXECUTE ON Art.ADD_TO_CART_ITEMS TO Customer;

--User will get cart Total by passing his name as input parameter
GRANT EXECUTE ON Art.CALCULATE_CARTTOTAL_BY_USERNAME TO Customer;


--FOR CUSTOMER USER (FUNCTIONS)




----------------------------------------------------------------------

--FOR STORE_MANAGER USER (BASE TABLE)



-- FOR STORE_MANAGER USER (VIEWS)
-- Product_Details_View
GRANT SELECT ON art.Product_Details_View TO Store_Manager;

-- Price_Comparison_View
GRANT SELECT ON art.Price_Comparison_View TO Store_Manager;


-- Store_Inventory_View
GRANT SELECT ON art.Store_Inventory_View TO Store_Manager;

-- Price_Update_View
GRANT SELECT ON art.Price_Update_View TO Store_Manager;


--FOR STORE_MANAGER USER (PROCEDURES)

--this procedure will display name of product and price on passing product as an input 
GRANT EXECUTE ON Art.DISPLAYPRODUCTPRICEWITHNAME TO Store_Manager;

--THIS PROCEDURE WILL ALLOW STORE_MANAGER TO UPDATE DISCOUNT ON PARTICULAR STORE
GRANT EXECUTE ON Art.UPDATE_DISCOUNT TO Store_Manager;

--THIS PROCEDURE WILL ALLOW STORE_MANAGER TO UPDATE PRICE OF PARTICULAR PRODUCT IN STORE
GRANT EXECUTE ON Art.UPDATE_PRODUCT_PRICE TO Store_Manager;


-- FOR STORE_MANAGER ROLE

