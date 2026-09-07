# Data Catalog & Dictionary

---

## Gold Layer: Star Schema

### 1. `gold.dim_customers`
Consolidates customer master data across CRM and ERP sources.

| Column Name | Data Type | Source Mapping | Description |
| :--- | :--- | :--- | :--- |
| `customer_key` | INT | Derived (`ROW_NUMBER`) | Surrogate primary key for dimension |
| `customer_id` | INT | `silver.crm_cust_info.cst_id` | Original CRM integer ID |
| `customer_number` | VARCHAR | `silver.crm_cust_info.cst_key` | Natural business key |
| `first_name` | VARCHAR | `silver.crm_cust_info.cst_firstname` | Customer given name |
| `last_name` | VARCHAR | `silver.crm_cust_info.cst_lastname` | Customer family name |
| `country` | VARCHAR | `silver.erp_loc_a101.cntry` | Standardized country name |
| `marital_status`| VARCHAR | `silver.crm_cust_info.cst_marital_status` | Standardized: Single, Married, n/a |
| `gender` | VARCHAR | CRM / ERP Coalesced | Standardized: Male, Female, n/a |
| `birthdate` | DATE | `silver.erp_cust_az12.bdate` | Validated customer birth date |
| `create_date` | DATE | `silver.crm_cust_info.cst_create_date` | Date profile was registered |

---

### 2. `gold.dim_products`
Contains active product offerings joined with category classification data.

| Column Name | Data Type | Source Mapping | Description |
| :--- | :--- | :--- | :--- |
| `product_key` | INT | Derived (`ROW_NUMBER`) | Surrogate primary key for dimension |
| `product_id` | INT | `silver.crm_prd_info.prd_id` | Original CRM integer ID |
| `product_number`| VARCHAR | `silver.crm_prd_info.prd_key` | Cleaned product identifier |
| `product_name` | VARCHAR | `silver.crm_prd_info.prd_nm` | Product title |
| `category_id` | VARCHAR | `silver.crm_prd_info.cat_id` | Foreign category mapping code |
| `category` | VARCHAR | `silver.erp_px_cat_g1v2.cat` | Product major category |
| `subcategory` | VARCHAR | `silver.erp_px_cat_g1v2.subcat` | Product subcategory |
| `maintenance` | VARCHAR | `silver.erp_px_cat_g1v2.maintenance` | Maintenance policy |
| `cost` | INT | `silver.crm_prd_info.prd_cost` | Unit production/purchase cost |
| `product_line` | VARCHAR | `silver.crm_prd_info.prd_line` | Standardized product line name |
| `start_date` | DATE | `silver.crm_prd_info.prd_start_dt` | Record validity start date |

---

### 3. `gold.fact_sales`
Captures historical transactional sales records linked to analytical dimensions.

| Column Name | Data Type | Source Mapping | Description |
| :--- | :--- | :--- | :--- |
| `order_number` | VARCHAR | `silver.crm_sales_details.sls_ord_num` | Sales transaction identifier |
| `product_key` | INT | `gold.dim_products.product_key` | Foreign key referencing Product dimension |
| `customer_key` | INT | `gold.dim_customers.customer_key` | Foreign key referencing Customer dimension |
| `order_date` | DATE | `silver.crm_sales_details.sls_order_dt` | Transaction placement date |
| `shipping_date`| DATE | `silver.crm_sales_details.sls_ship_dt` | Order fulfillment/dispatch date |
| `due_date` | DATE | `silver.crm_sales_details.sls_due_dt` | Payment or expected arrival date |
| `sales_amount` | INT | `silver.crm_sales_details.sls_sales` | Total monetary sales value ($Qty \times Price$) |
| `quantity` | INT | `silver.crm_sales_details.sls_quantity` | Units sold |
| `price` | INT | `silver.crm_sales_details.sls_price` | Unit sales price |
