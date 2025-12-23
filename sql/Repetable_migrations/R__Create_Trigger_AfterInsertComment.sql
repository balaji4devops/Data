CREATE OR ALTER TRIGGER dbo.trg_AfterInsert_Comments
ON dbo.Comments
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.CommentAudit (CommentId, UserId, CreatedOn)
    SELECT CommentId, UserId, SYSUTCDATETIME()
    FROM inserted;
END;
