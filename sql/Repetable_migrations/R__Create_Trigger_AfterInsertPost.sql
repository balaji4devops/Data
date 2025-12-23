CREATE OR ALTER TRIGGER dbo.trg_AfterInsert_Posts
ON dbo.Posts
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.PostAudit (PostId, CreatedOn)
    SELECT PostId, SYSUTCDATETIME()
    FROM inserted;
END;
