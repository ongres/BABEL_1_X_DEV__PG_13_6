-- Tests that ANSI_PADDING can be set to ON
SET ANSI_PADDING ON;
GO

DECLARE @v VARCHAR(20);
SET ANSI_PADDING ON;
SET @v = 'SHOULD BE SHOWN';
SELECT @v;
GO