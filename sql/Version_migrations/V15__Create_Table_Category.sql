IF NOT EXISTS (
    SELECT 1
    FROM sys.tables t
    JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE t.name = 'Categories'
      AND s.name = 'dbo'
)
BEGIN
    CREATE TABLE dbo.Categories (
        CategoryId INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(50) NOT NULL
    );
END;
