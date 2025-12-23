IF NOT EXISTS (
    SELECT 1
    FROM sys.tables t
    JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE t.name = 'Comments'
      AND s.name = 'dbo'
)
BEGIN
    CREATE TABLE dbo.Comments (
        CommentId INT IDENTITY(1,1) PRIMARY KEY,
        PostId INT NOT NULL,
        UserId INT NOT NULL,
        CommentText NVARCHAR(MAX) NOT NULL,

        CONSTRAINT FK_Comments_Posts
            FOREIGN KEY (PostId)
            REFERENCES dbo.Posts(PostId),

        CONSTRAINT FK_Comments_Users
            FOREIGN KEY (UserId)
            REFERENCES dbo.Users(UserId)
    );
END;
