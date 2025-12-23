ALTER FUNCTION dbo.get_post_count()
RETURNS INT
AS
BEGIN
    DECLARE @post_count INT;

    SELECT @post_count = COUNT(*)
    FROM dbo.Posts;

    RETURN @post_count;
END;
