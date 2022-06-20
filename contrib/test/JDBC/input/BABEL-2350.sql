CREATE TABLE t1 (c1 int)
GO
INSERT INTO t1(c1) VALUES(1), (3), (4), (257)
GO

CREATE TABLE t2 (c1 int)
GO

CREATE PROC p1
@limit int
AS
    SELECT * FROM t1 WHERE c1 <= @limit
GO

INSERT INTO t2(c1)
EXEC('EXEC p1 1000000')
GO

SELECT * FROM t2;
GO

-- Test more than one level of nested EXEC
CREATE PROC p2
@limit int
AS
	EXEC p1 @limit
GO

INSERT INTO t2(c1)
EXEC('EXEC p2 1000000')
GO

SELECT * from t2;
GO

-- Cleanup
DROP TABLE t1
GO
DROP TABLE t2
GO
DROP PROC p1
GO
DROP PROC p2
GO
