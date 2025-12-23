CREATE OR ALTER FUNCTION dbo.get_user_count()
RETURNS INT
AS
BEGIN
    DECLARE @user_count INT;

    SELECT @user_count = COUNT(*)
    FROM dbo.Users;

    RETURN @user_count;
END;
