CREATE OR ALTER PROCEDURE Bronze.Load_Bronze 
AS
BEGIN
	BEGIN TRY
		DECLARE @start_time DATETIME, @end_time DATETIME,@batch_start_time DATETIME,@batch_end_time DATETIME;
		SET @batch_start_time=GETDATE();
		PRINT'========================================';
		PRINT'Loading Bronze_Layer';
		PRINT'========================================';

		SET @start_time = GETDATE();
		PRINT'Truncate the crm_cust_info  data';
		TRUNCATE TABLE Bronze.crm_cust_info;

		PRINT'insert data into crm_cust_info  data: ';
		BULK INSERT Bronze.crm_cust_info
		FROM 'F:\SF+SQL+GIT+DBT\SQL\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duretion Time : ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + 'seconds';
		PRINT '>>--------------';

		SET @start_time = GETDATE();
		PRINT'Truncate the crm_prd_info  data';
		TRUNCATE TABLE Bronze.crm_prd_info;
		PRINT'insert data into crm_prd_info data: ';
		BULK INSERT Bronze.crm_prd_info
		FROM 'F:\SF+SQL+GIT+DBT\SQL\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duretion Time : ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + 'seconds';
		PRINT '>>--------------';

		SET @start_time = GETDATE();
		PRINT'Truncate the crm_sales_details data';
		TRUNCATE TABLE Bronze.crm_sales_details;

		PRINT'insert data into crm_sales_details  data: ';
		BULK INSERT Bronze.crm_sales_details
		FROM 'F:\SF+SQL+GIT+DBT\SQL\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duretion Time : ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + 'seconds';
		PRINT '>>--------------';

		SET @start_time = GETDATE();
		PRINT'Truncate the erp_loc_a101   data';
		TRUNCATE TABLE Bronze.erp_loc_a101;

		PRINT'insert data into erp_loc_a101  data: ';
		BULK INSERT Bronze.erp_loc_a101
		FROM 'F:\SF+SQL+GIT+DBT\SQL\sql-data-warehouse-project-main\datasets\source_erp\loc_a101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duretion Time : ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + 'seconds';
		PRINT '>>--------------';

		SET @start_time = GETDATE();
		PRINT'Truncate the erp_cust_az12 data';
		TRUNCATE TABLE Bronze.erp_cust_az12;

		PRINT'insert data into erp_cust_az12 data: ';
		BULK INSERT Bronze.erp_cust_az12
		FROM 'F:\SF+SQL+GIT+DBT\SQL\sql-data-warehouse-project-main\datasets\source_erp\cust_az12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duretion Time : ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + 'seconds';
		PRINT '>>--------------';

		SET @start_time = GETDATE();
		PRINT'Truncate the erp_px_cat_g1v2 data';
		TRUNCATE TABLE Bronze.erp_px_cat_g1v2;

		PRINT'insert data into erp_px_cat_g1v2  data: ';
		BULK INSERT Bronze.erp_px_cat_g1v2
		FROM 'F:\SF+SQL+GIT+DBT\SQL\sql-data-warehouse-project-main\datasets\source_erp\px_cat_g1v2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duretion Time : ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + 'seconds';
		PRINT '>>--------------';
	END TRY
	BEGIN CATCH
		PRINT'=======================================';
		PRINT'ERROR OCCURED DURING THE BRONZE LAYER LOADING';
		PRINT'ERROR MESSAGE:' + ERROR_MESSAGE();
		PRINT'ERROR NUMBER:' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT'ERROR STATE:'+ CAST(ERROR_STATE() AS NVARCHAR);
		PRINT'=======================================';
	END CATCH
	SET @batch_end_time = GETDATE();
	PRINT '>> Total loading duration time :' + CAST(DATEDIFF(second,@batch_end_time,@batch_start_time) AS NVARCHAR)+ 'seconds';
END;
