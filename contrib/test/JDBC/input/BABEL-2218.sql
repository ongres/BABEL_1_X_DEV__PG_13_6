use master;
go

CREATE TABLE t2218(c1 INT)
INSERT INTO t2218 VALUES (2218);
GO

-- should throw an error
CREATE FUNCTION f2218()
RETURNS INT AS
BEGIN
  DECLARE @return INT
  SET @return = 0
  SELECT * from t2218
  RETURN @return
END
GO

-- if select statement has a destination, no error
CREATE FUNCTION f2218()
RETURNS INT AS
BEGIN
  DECLARE @return INT
  SET @return = 0
  SELECT @return=c1 from t2218
  RETURN @return
END
GO

-- we have an issue. see BABEL-2655
--SELECT f2218();
--GO

DECLARE @ret INT;
SET @ret = f2218();
SELECT @ret;

DROP FUNCTION f2218;
DROP TABLE t2218;
GO
