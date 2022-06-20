create schema error_mapping;
GO

CREATE TABLE t3616(id int);
GO
CREATE TRIGGER t3616Trigger
ON              t3616
AFTER           INSERT  
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
        INSERT INTO t3616 VALUES (2)
        COMMIT TRAN
    END TRY
    BEGIN CATCH
    END CATCH
END
GO

create procedure error_mapping.ErrorHandling1 as
begin
INSERT INTO t3616 values (1)
if @@error > 0 select cast('STATEMENT TERMINATING ERROR' as text);
end
GO

SET NOCOUNT ON
GO

exec error_mapping.ErrorHandling1;
GO

select * from t3616;
GO

drop table t3616;
GO

drop procedure error_mapping.ErrorHandling1;
GO

drop schema error_mapping;
GO
