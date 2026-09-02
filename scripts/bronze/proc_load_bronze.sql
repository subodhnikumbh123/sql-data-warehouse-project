/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the 'COPY' command to load data from CSV files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    CALL bronze.load_bronze();
===============================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    batch_start_time TIMESTAMP;
    batch_end_time   TIMESTAMP;

BEGIN

    batch_start_time := clock_timestamp();
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '================================================';

    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '------------------------------------------------';

    -- 1. Customer Info
    TRUNCATE TABLE bronze.crm_cust_info;
    COPY bronze.crm_cust_info
    FROM '/Users/subodhnikumbh/Downloads/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    -- 2. Product Info
    TRUNCATE TABLE bronze.crm_prd_info;
    COPY bronze.crm_prd_info
    FROM '/Users/subodhnikumbh/Downloads/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    -- 3. Sales Details
    TRUNCATE TABLE bronze.crm_sales_details;
    COPY bronze.crm_sales_details
    FROM '/Users/subodhnikumbh/Downloads/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading ERP Tables';
    RAISE NOTICE '------------------------------------------------';

    -- 4. ERP Tables
    TRUNCATE TABLE bronze.erp_cust_az12;
    COPY bronze.erp_cust_az12
    FROM '/Users/subodhnikumbh/Downloads/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    TRUNCATE TABLE bronze.erp_loc_a101;
    COPY bronze.erp_loc_a101
    FROM '/Users/subodhnikumbh/Downloads/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    COPY bronze.erp_px_cat_g1v2
    FROM '/Users/subodhnikumbh/Downloads/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
    WITH (FORMAT csv, HEADER true, DELIMITER ',');

    RAISE NOTICE '================================================';
    RAISE NOTICE 'Bronze Layer Loaded Successfully';
    RAISE NOTICE '================================================';
    batch_end_time := clock_timestamp();
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer Completed';
    RAISE NOTICE '   - Total Load Duration: % seconds', ROUND(EXTRACT(EPOCH FROM (batch_end_time - batch_start_time))::numeric, 2);
    RAISE NOTICE '================================================';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '================================================';
        RAISE NOTICE 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        RAISE NOTICE 'Error Message: %', SQLERRM;
        RAISE NOTICE 'Error State  : %', SQLSTATE;
        RAISE NOTICE '================================================';
END;
$$;
