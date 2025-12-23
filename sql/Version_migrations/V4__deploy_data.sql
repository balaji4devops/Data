-- V4__deploy_data.sql
-- Purpose: Create FlywayDeployData table and insert initial records

-- Create table if not exists
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables t
    JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE t.name = 'FlywayDeployData'
      AND s.name = 'dbo'
)
BEGIN
    CREATE TABLE dbo.FlywayDeployData (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        EnvironmentName NVARCHAR(50) NOT NULL,
        DeployedBy NVARCHAR(100) NOT NULL,
        DeployedOn DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

-- Insert initial data (runs only once)
INSERT INTO dbo.FlywayDeployData (EnvironmentName, DeployedBy)
VALUES
    ('DEV', 'balaji'),
    ('QA', 'surya'),
    ('UAT', 'satya'),
    ('PROD', 'Dave');
GO
