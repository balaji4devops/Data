IF NOT EXISTS (
    SELECT 1
    FROM sys.tables t
    JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE t.name = 'Likes'
      AND s.name = 'dbo'
)
BEGIN
    CREATE TABLE dbo.Likes (
        LikeId INT IDENTITY(1,1) PRIMARY KEY,
        PostId INT NOT NULL,
        UserId INT NOT NULL,

        CONSTRAINT FK_Likes_Posts
            FOREIGN KEY (PostId)
            REFERENCES dbo.Posts(PostId),

        CONSTRAINT FK_Likes_Users
            FOREIGN KEY (UserId)
            REFERENCES dbo.Users(UserId),

        CONSTRAINT UQ_Likes_Post_User
            UNIQUE (PostId, UserId)
    );
END;
