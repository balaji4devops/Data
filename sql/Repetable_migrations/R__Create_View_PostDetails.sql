CREATE OR ALTER VIEW dbo.post_details AS
SELECT
    p.PostId,
    p.Title,
    u.Username AS Author,
    c.CommentText AS LatestComment
FROM dbo.Posts p
JOIN dbo.Users u
    ON p.UserId = u.UserId
LEFT JOIN dbo.Comments c
    ON p.PostId = c.PostId;
