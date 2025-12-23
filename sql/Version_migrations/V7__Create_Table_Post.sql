IF NOT EXISTS (
    SELECT 1
    FROM sys.tables t
    JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE t.name = 'Posts'
      AND s.name = 'dbo'
)
BEGIN
    CREATE TABLE dbo.Posts (
        PostId INT IDENTITY(1,1) PRIMARY KEY,
        UserId INT NOT NULL,
        Title NVARCHAR(100) NOT NULL,
        Content NVARCHAR(MAX) NULL,

        CONSTRAINT FK_Posts_Users
            FOREIGN KEY (UserId)
            REFERENCES dbo.Users(UserId)
    );
END;
