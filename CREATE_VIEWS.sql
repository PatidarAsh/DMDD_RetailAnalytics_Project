
---1. Product Details View
CREATE OR REPLACE VIEW Product_Details_View AS
SELECT
    p.Product_Name,
    p.Category AS Product_Category,
    p.Description AS Product_Description,
    pr.Price AS Product_Price,
    s.Store_Name AS Store_Name
FROM
    Product p
JOIN
    Prices pr ON p.Product_ID = pr.Product_ID
JOIN
    Store s ON pr.Store_ID = s.Store_ID ;
    
    Commit;
--- 1. To Show the view details:    
    SELECT * from Product_Details_View;

---- 2.   Price Comparison View
    CREATE OR REPLACE VIEW Price_Comparison_View AS
SELECT
    p.Product_Name,
    p.Category AS Product_Category,
    pr.Price AS Product_Price,
    s.Store_Name AS Store_Name,
    s.Store_Location AS Store_Location,
    pr.DateLastUpdated AS Price_Last_Updated
FROM
    Product p
JOIN
    Prices pr ON p.Product_ID = pr.Product_ID
JOIN
    Store s ON pr.Store_ID = s.Store_ID
    order by p.product_name;
  
  Commit;  
--- 2. To Show the view details:    
    SELECT * from Price_Comparison_View;
    
----3. Shopping Cart View
CREATE OR REPLACE VIEW Shopping_Cart_View AS
SELECT

    p.Product_Name,
    p.Category AS Product_Category,
    ci.Quantity AS CartItem_Quantity,
    pr.Price AS CartItem_Price,
    (ci.Quantity * pr.Price) AS CartItem_Total

FROM
    Cart c
JOIN
    Cart_Items ci ON c.Cart_ID = ci.Cart_ID
JOIN
    Product p ON ci.Product_ID = p.Product_ID
JOIN
    Prices pr ON ci.Price_ID = pr.Price_ID;
    
 Commit;       
--- 3. To Show the view details:    
    SELECT * from Shopping_Cart_View;
  
    
--- 4. Store Inventory View
CREATE or replace VIEW Store_Inventory_View AS
SELECT
    s.Store_ID,
    s.store_Name AS Store_Name,
    s.store_Location AS Store_Location,
    p.Product_ID,
    p.Product_Name,
    pr.Price AS Product_Price
FROM
    Store s
JOIN
    Prices pr ON s.Store_ID = pr.Store_ID
JOIN
    Product p ON pr.Product_ID = p.Product_ID;
Commit;
----4. To show the view
select * from Store_Inventory_View;
    
----5. Price Update View

CREATE OR REPLACE VIEW Price_Update_View AS
SELECT
    p.Product_ID,
    p.Product_Name,
    p.Category AS Product_Category,
    pr.Price AS Product_Price,
    s.Store_ID,
    s.store_Name AS Store_Name,
    pr.DateLastUpdated AS Price_Last_Updated
FROM
    Product p
JOIN
    Prices pr ON p.Product_ID = pr.Product_ID
JOIN
    Store s ON pr.Store_ID = s.Store_ID;

Commit;
---5. To show the view
select * from Price_Update_View;


---6. USER_CART_VIEW
CREATE OR REPLACE VIEW USER_CART_VIEW AS
SELECT U.User_ID,  C.Cart_ID, U.USER_NAME
FROM USERS U
INNER JOIN CART C ON U.User_ID = C.User_ID;

---6. To show the view
select * from USER_CART_VIEW;

--7. PRODUCT_PRICE_VIEW
CREATE OR REPLACE VIEW PRODUCT_PRICE_VIEW AS
SELECT PR.Product_ID, PR.Price_ID, p.product_Name
FROM PRODUCT P
JOIN PRICES PR ON PR.Product_ID = P.Product_ID;

---7. To show the view
select * from PRODUCT_PRICE_VIEW;
    