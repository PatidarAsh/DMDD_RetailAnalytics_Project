EXECUTE UPDATE_OR_INSERT_USER('John Doe', '123 Main Street', '123-456-7890');

EXECUTE UPDATE_OR_INSERT_USER('Jane Smith', '456 Elm Street', '987-654-3210');

EXECUTE UPDATE_OR_INSERT_USER('Mike Johnson', '789 Elm Lane', '111-222-3333');

EXECUTE UPDATE_OR_INSERT_USER('Emily Brown', '567 Pine Road', '444-555-6666');

EXECUTE UPDATE_OR_INSERT_USER('Chris Williams', '890 Cedar Drive', '777-888-9999');

EXECUTE UPDATE_OR_INSERT_USER('Sarah Wilson', '235 Birch Street', '333-222-1111');

EXECUTE UPDATE_OR_INSERT_USER('Alex Clark', '902 Spruce Avenue', '666-777-8888');

EXECUTE UPDATE_OR_INSERT_USER('Ava Martinez', '345 Walnut Lane', '999-888-7777');

EXECUTE UPDATE_OR_INSERT_USER('Daniel Taylor', '678 Maple Road', '222-333-4444');

EXECUTE UPDATE_OR_INSERT_USER('Olivia Anderson', '123 Oak Street', '555-444-3333');

EXECUTE UPDATE_OR_INSERT_USER('Alice Johnson', '456 Oak Avenue', '987-654-3210');

EXECUTE UPDATE_OR_INSERT_USER('Bob Smith', '789 Pine Lane', '456-789-0123');

EXECUTE UPDATE_OR_INSERT_USER('Emily White', '321 Cedar Road', '789-012-3456');

EXECUTE UPDATE_OR_INSERT_USER('David Brown', '567 Elm Street', '012-345-6789');

EXECUTE UPDATE_OR_INSERT_USER('Grace Miller', '234 Birch Lane', '345-678-9012');

EXECUTE UPDATE_OR_INSERT_USER('Thomas Wilson', '890 Maple Road', '678-901-2345');

EXECUTE UPDATE_OR_INSERT_USER('Sophia Davis', '432 Pine Avenue', '901-234-5678');

EXECUTE UPDATE_OR_INSERT_USER('Michael Johnson', '876 Cedar Lane', '234-567-8901');

EXECUTE UPDATE_OR_INSERT_USER('Olivia Taylor', '109 Birch Road', '567-890-1234');

EXECUTE UPDATE_OR_INSERT_USER('Henry Thomas', '543 Oak Street', '890-123-4567');

EXECUTE UPDATE_OR_INSERT_USER('Emma Martinez', '876 Maple Avenue', '123-456-7890');

EXECUTE UPDATE_OR_INSERT_USER('Christopher Hall', '210 Pine Lane', '456-789-0123');

EXECUTE UPDATE_OR_INSERT_USER('Ava Jackson', '654 Cedar Road', '789-012-3456');

EXECUTE UPDATE_OR_INSERT_USER('Daniel White', '987 Elm Street', '012-345-6789');

EXECUTE UPDATE_OR_INSERT_USER('Lily Brown', '321 Birch Lane', '345-678-9012');

EXECUTE UPDATE_OR_INSERT_USER('Andrew Miller', '765 Maple Road', '678-901-2345');

EXECUTE UPDATE_OR_INSERT_USER('Mia Wilson', '098 Pine Avenue', '901-234-5678');

EXECUTE UPDATE_OR_INSERT_USER('Ethan Davis', '543 Cedar Lane', '234-567-8901');

EXECUTE UPDATE_OR_INSERT_USER('Grace Johnson', '876 Birch Road', '567-890-1234');

EXECUTE UPDATE_OR_INSERT_USER('Ryan Taylor', '109 Oak Street', '890-123-4567');

EXECUTE UPDATE_OR_INSERT_USER('Ashvini', 'forest Hills', '987-654-3218');


---adding statements for executing cart items 
EXECUTE ADD_TO_CART_ITEMS('John Doe','Quinoa Rice',2, 'Cash', 'N'); 

EXECUTE ADD_TO_CART_ITEMS('Jane Smith','Whole milk',2,'Debit', 'Y');

EXECUTE ADD_TO_CART_ITEMS('Mike Johnson ','HP Laptop',1,'Debit', 'N');

EXECUTE ADD_TO_CART_ITEMS('Emily Brown ','Bread',2,'Credit', 'Y');

EXECUTE ADD_TO_CART_ITEMS('Chris Williams ','Iphone 15 pro',1,'Credit', 'N');

EXECUTE ADD_TO_CART_ITEMS('SarahWilson','LED TV',1,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Alex Clark','Spaghetti',3,'Debit', 'N');

EXECUTE ADD_TO_CART_ITEMS('Ava Martinez ','Granola',2,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Daniel Taylor','Airpods',1,'Credit', 'N');

EXECUTE ADD_TO_CART_ITEMS('Olivia Anderson','Apple Smart Watch',1,'Debit', 'N');

EXECUTE ADD_TO_CART_ITEMS('Alice Johnson','Whole Bean Coffee',2,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Bob Smith ','Tab',1,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Emily White','Chicken Nuggets',2,'Debit', 'N');

EXECUTE ADD_TO_CART_ITEMS('David Brown','Tomato Ketchup',3,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Grace Miller','Ranch Dressing',2,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Thomas Wilson','Milk Chocolate',5,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Sophia Davis','Gaming Monitor',1,'Credit', 'N');

EXECUTE ADD_TO_CART_ITEMS('Michael Johnson','Headphones',1,'Debit', 'N');

EXECUTE ADD_TO_CART_ITEMS('Olivia Taylor','SD Card',1,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Henry Thomas','Quinoa Rice',2,'Credit', 'N');

EXECUTE ADD_TO_CART_ITEMS('Emma Martinez','Whole milk',1,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Christopher Hall','HP Laptop',1,'Debit', 'N');

EXECUTE ADD_TO_CART_ITEMS('Ava Jackson','Bread',2,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Daniel White','Iphone 15 pro',1,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Lily Brown','LED TV',1,'Credit', 'N');

EXECUTE ADD_TO_CART_ITEMS('Andrew Miller','Spaghetti',1,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Mia Wilson','Granola',1,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Ethan Davis','Oats',2,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Grace Johnson','Spaghetti',2,'Cash', 'N');

EXECUTE ADD_TO_CART_ITEMS('Ryan Taylor','Bread',1,'Cash', 'N');


--addinmg execute statement for procedure Calculate_CartTotal_By_UserName
execute Calculate_CartTotal_By_UserName('John Doe');

execute Calculate_CartTotal_By_UserName('Jane Smith');

execute Calculate_CartTotal_By_UserName('Mike Johnson ');

execute Calculate_CartTotal_By_UserName('Emily Brown');

execute Calculate_CartTotal_By_UserName('Chris Williams');

execute Calculate_CartTotal_By_UserName('SarahWilson');

execute Calculate_CartTotal_By_UserName('Alex Clark');

execute Calculate_CartTotal_By_UserName('Ava Martinez ');

execute Calculate_CartTotal_By_UserName('Daniel Taylor');

execute Calculate_CartTotal_By_UserName('Olivia Anderson');

execute Calculate_CartTotal_By_UserName('Alice Johnson');

execute Calculate_CartTotal_By_UserName('Bob Smith');

execute Calculate_CartTotal_By_UserName('Emily White');

execute Calculate_CartTotal_By_UserName('David Brown');

execute Calculate_CartTotal_By_UserName('Grace Miller');

execute Calculate_CartTotal_By_UserName('Thomas Wilson');

execute Calculate_CartTotal_By_UserName('Sophia Davis');

execute Calculate_CartTotal_By_UserName('Michael Johnson');

execute Calculate_CartTotal_By_UserName('Olivia Taylor');

execute Calculate_CartTotal_By_UserName('Henry Thomas');

execute Calculate_CartTotal_By_UserName('Emma Martinez');

execute Calculate_CartTotal_By_UserName('Christopher Hall');

execute Calculate_CartTotal_By_UserName('Ava Jackson');

execute Calculate_CartTotal_By_UserName('Daniel White');

execute Calculate_CartTotal_By_UserName('Lily Brown');

execute Calculate_CartTotal_By_UserName('Andrew Miller');

execute Calculate_CartTotal_By_UserName('Mia Wilson');

execute Calculate_CartTotal_By_UserName('Ethan Davis');

execute Calculate_CartTotal_By_UserName('Grace Johnson');

execute Calculate_CartTotal_By_UserName('Ryan Taylor');

--adding execute statement for procedure 'Update_Product_Price'
EXECUTE Update_Product_Price(106, 'Whole milk', 20);

EXECUTE Update_Product_Price(113, 'Quinoa Rice', 10);

EXECUTE Update_Product_Price(103, 'HP Laptop', 15);

EXECUTE Update_Product_Price(104, 'Bread', 5);

EXECUTE Update_Product_Price(101, 'Iphone 15 pro', 6);

EXECUTE Update_Product_Price(102, 'LED TV', 10);

EXECUTE Update_Product_Price(109, 'Spaghetti', 2);

EXECUTE Update_Product_Price(107, 'Granola', 5);

EXECUTE Update_Product_Price(111, 'Airpods', 20);

EXECUTE Update_Product_Price(110, 'Apple Smart Watch', 10);

EXECUTE Update_Product_Price(116, 'Whole Bean Coffee', 5);

EXECUTE Update_Product_Price(102, 'Tab', 10);

EXECUTE Update_Product_Price(113, 'Chicken Nuggets', 5);

EXECUTE Update_Product_Price(114, 'Tomato Ketchup', 4);

EXECUTE Update_Product_Price(105, 'Ranch Dressing', 5);

EXECUTE Update_Product_Price(104, 'Oats', 3);

EXECUTE Update_Product_Price(116, 'Milk Chocolate', 4);

EXECUTE Update_Product_Price(102, 'Gaming Monitor', 15);

EXECUTE Update_Product_Price(111, 'Headphones', 15);

EXECUTE Update_Product_Price(103, 'SD Card', 8); 


--add store id and discount value(number)
EXECUTE UPDATE_DISCOUNT(102,20);

EXECUTE UPDATE_DISCOUNT(101,10);

EXECUTE UPDATE_DISCOUNT(103,5);

EXECUTE UPDATE_DISCOUNT(104,8);

EXECUTE UPDATE_DISCOUNT(105,15);

EXECUTE UPDATE_DISCOUNT(106,5);

EXECUTE UPDATE_DISCOUNT(107,12);

EXECUTE UPDATE_DISCOUNT(108,15);



--adding execute statement for procedure 'GETCARTTOTAL'
EXECUTE GETCARTTOTAL('John Doe');

EXECUTE GETCARTTOTAL('Jane Smith');

EXECUTE GETCARTTOTAL('Mike Johnson');

EXECUTE GETCARTTOTAL('Emily Brown');

EXECUTE GETCARTTOTAL('Chris Williams');

EXECUTE GETCARTTOTAL('Sarah Wilson');

EXECUTE GETCARTTOTAL('Alex Clark');

EXECUTE GETCARTTOTAL('Ava Martinez');

EXECUTE GETCARTTOTAL('Daniel Taylor');

EXECUTE GETCARTTOTAL('Olivia Anderson');

EXECUTE GETCARTTOTAL('Alice Johnson');

EXECUTE GETCARTTOTAL('Bob Smith');

EXECUTE GETCARTTOTAL('Emily White');

EXECUTE GETCARTTOTAL('David Brown');

EXECUTE GETCARTTOTAL('Grace Miller');

EXECUTE GETCARTTOTAL('Thomas Wilson');

EXECUTE GETCARTTOTAL('Sophia Davis');

EXECUTE GETCARTTOTAL('Michael Johnson');

EXECUTE GETCARTTOTAL('Olivia Taylor');

EXECUTE GETCARTTOTAL('Henry Thomas');

EXECUTE GETCARTTOTAL('Emma Martinez');

EXECUTE GETCARTTOTAL('Christopher Hall');

EXECUTE GETCARTTOTAL('Ava Jackson');

EXECUTE GETCARTTOTAL('Daniel White');

EXECUTE GETCARTTOTAL('Lily Brown');

EXECUTE GETCARTTOTAL('Andrew Miller');

EXECUTE GETCARTTOTAL('Mia Wilson');

EXECUTE GETCARTTOTAL('Ethan Davis');

EXECUTE GETCARTTOTAL('Grace Johnson');

EXECUTE GETCARTTOTAL('Ryan Taylor');



--adding execute statement for procedure 'DisplayProductPriceWithName'

EXECUTE DisplayProductPriceWithName('Quinoa Rice');

EXECUTE DisplayProductPriceWithName('Whole milk');

EXECUTE DisplayProductPriceWithName('HP Laptop');

EXECUTE DisplayProductPriceWithName('Bread');

EXECUTE DisplayProductPriceWithName('Iphone 15 pro');

EXECUTE DisplayProductPriceWithName('LED TV');

EXECUTE DisplayProductPriceWithName('Spaghetti');

EXECUTE DisplayProductPriceWithName('Granola');

EXECUTE DisplayProductPriceWithName('Airpods');

EXECUTE DisplayProductPriceWithName('Apple Smart Watch');

EXECUTE DisplayProductPriceWithName('Whole Bean Coffee');

EXECUTE DisplayProductPriceWithName('Tab');

EXECUTE DisplayProductPriceWithName('Chicken Nuggets');

EXECUTE DisplayProductPriceWithName('Tomato Ketchup');

EXECUTE DisplayProductPriceWithName('Ranch Dressing');

EXECUTE DisplayProductPriceWithName('Oats');

EXECUTE DisplayProductPriceWithName('Milk Chocolate');

EXECUTE DisplayProductPriceWithName('Gaming Monitor');

EXECUTE DisplayProductPriceWithName('Headphones');

EXECUTE DisplayProductPriceWithName('SD Card');





