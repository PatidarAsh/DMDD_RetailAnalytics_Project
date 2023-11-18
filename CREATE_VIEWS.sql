--- 1. Product Details View
CREATE VIEW Product_Details_View AS
SELECT
    p.Product_ID,
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
    Store s ON pr.Store_ID = s.Store_ID;
    
    
    
 ---- 1 . To show the details   
   select * from Product_Details_View;



---- 2. Price Comparison View
CREATE OR REPLACE VIEW Price_Comparison_View AS
SELECT
    p.Product_ID,
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
    Store s ON pr.Store_ID = s.Store_ID;


---- 2. To show the details

select * from Price_Comparison_View;


----- 3. Shopping Cart View
CREATE OR REPLACE VIEW Shopping_Cart_View AS
SELECT
    c.Cart_ID,
    ci.CartItem_ID,
    p.Product_ID,
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

----- 4. Store Inventory View
CREATE VIEW Store_Inventory_View AS
SELECT
    s.Store_ID,
    s.Name AS Store_Name,
    s.Location AS Store_Location,
    p.Product_ID,
    p.Product_Name,
    pr.Price AS Product_Price
FROM
    Store s
JOIN
    Prices pr ON s.Store_ID = pr.Store_ID
JOIN
    Product p ON pr.Product_ID = p.Product_ID;

---- 5. Price Update View

CREATE OR REPLACE VIEW Price_Update_View AS
SELECT
    p.Product_ID,
    p.Product_Name,
    p.Category AS Product_Category,
    pr.Price AS Product_Price,
    s.Store_ID,
    s.Name AS Store_Name,
    pr.DateLastUpdated AS Price_Last_Updated
FROM
    Product p
JOIN
    Prices pr ON p.Product_ID = pr.Product_ID
JOIN
    Store s ON pr.Store_ID = s.Store_ID;

select * from users;




