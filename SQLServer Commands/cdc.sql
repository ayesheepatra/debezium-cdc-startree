#enable at database level
USE YourDatabase;
GO

EXEC sys.sp_cdc_enable_db;
GO

#enable at table level
USE YourDatabase;
GO

EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name   = N'YourTableName',
    @role_name     = NULL,          -- Or specify a database role for CDC admin
    @capture_instance = N'dbo_YourTableName',  -- Custom name (optional)
    @supports_net_changes = 1;      -- Enable net changes (optional)
GO

#verify cdc is enabled
#at database level

SELECT name, is_cdc_enabled
FROM sys.databases
WHERE name = 'YourDatabase';


#at table level

SELECT c.name AS capture_instance,
       s.name AS source_schema,
       t.name AS source_table
FROM sys.change_capture_tables c
JOIN sys.tables t ON c.source_object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
ORDER BY capture_instance;
