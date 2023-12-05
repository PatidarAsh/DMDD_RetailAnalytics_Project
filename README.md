# DMDD_RetailAnalytics_Project

# DMDD-Retail Analytics-project

This project aims to provide a comprehensive price comparison platform across stores for groceries and electronics providing a valuable solution to the customers to make informed purchasing decisions.

Members
```
`Ashvini Patidar      002747763`

`Ritwik Giri          002873045`

`Tanuja Mahajan       002221239` 

```


Workflow 
- user will first add himself into system using `update_or_insert_users` using users table 
- customer will add items to cart, tracked under `Cart_items` table,making use of details from making use of `cart, prices, products`
- Users will adjust the quantity of items in their cart by utilizing procedures that enable them to modify quantities based on the product name within the system.

### Code execution
1. Create_Database_Script
    * Existing objects,tables,constraints are dropped.
    * Tables are created and data is inserted.
    * Constraints are applied to tables.
   * Creates 4 roles :
        - CUSTOMER
        - STORE_MANAGER

2. Create_Views
    * Creates 5 views to generate detailed insights for recorded data.
        - Product_Details_View
        - Price_Comparison_View
        - Shopping_Cart_View
        - Store_Inventory_View

3. Create_Procedures_Functions_Script
    * Creates 8 Procedures 
        - Create_cart_for_new_user
        - Update_or_insert_user
        - Add_to_cart_items 
        - Calculate_cart_total_by_UserName
        -Update _product_ price
        -Update_discount
        -DisplayProductPriceWithName
        -GetCartTotal
    * Creates function 
        - GetCartTotalByUserName
        -GetProductPriceAndName
    * Creates Cursor 
        - Cursor_Price_Log       

4. ` Create_Package_Triggers`
     * Creates Triggers 
        - ViewUserName



5.Create Users
    * Create Users and given permissions


6. CREATE_ROLE_GRANT
    * Role creation script has to be uncommented before execution for first time user.
    * Grants CRUD access database objects to roles. 


	
7. PROCEDURE EXECUTE
*Contains Execute statement for all the procedures.