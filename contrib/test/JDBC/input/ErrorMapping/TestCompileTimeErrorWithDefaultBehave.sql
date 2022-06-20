USE master;
GO

-- This file contains test cases to test un-mapped compile time error against Babelfish server.
GO

CREATE SCHEMA error_mapping;
GO

-- Example 1
GO

DECLARE @xml XML
SET @xml = CONVERT(XML, '<root></root>')
SELECT @xml.value('()[1]', 'VARCHAR')

GO
GO


begin transaction
GO
GO

DECLARE @xml XML
SET @xml = CONVERT(XML, '<root></root>')
SELECT @xml.value('()[1]', 'VARCHAR')

GO

-- Below output is only applicable if query is special case. for example, CREATE/ALTER TRIGGER, CREATE/ALTER FUNCTION, CREATE/ALTER PROC, CREATE/ALTER VIEW etc

if (@@trancount > 0) select cast('txn is not rolledback' as text) else select cast('txn is rolledback' as text)
GO

if (@@trancount > 0) rollback tran
GO

GO

begin transaction
GO
-- Executing test error_mapping.ErrorHandling1
create procedure error_mapping.ErrorHandling1 as
begin
DECLARE @xml XML
SET @xml = CONVERT(XML, '<root></root>')
SELECT @xml.value('()[1]', 'VARCHAR')

if @@error > 0 select cast('STATEMENT TERMINATING ERROR' as text);
end

GO

declare @err int = @@error; if (@err > 0 and @@trancount > 0) select cast('BATCH ONLY TERMINATING' as text) else if @err > 0 select cast('BATCH TERMINATING\ txn rolledback' as text);
if @@trancount > 0 rollback transaction;
drop procedure error_mapping.ErrorHandling1;
set xact_abort OFF;
set implicit_transactions OFF;
GO

GO
GO



-- Checking xact_abort_flag for compile time error --
set xact_abort ON;
GO
GO

begin transaction
GO
-- Executing test error_mapping.ErrorHandling1
create procedure error_mapping.ErrorHandling1 as
begin
DECLARE @xml XML
SET @xml = CONVERT(XML, '<root></root>')
SELECT @xml.value('()[1]', 'VARCHAR')

if @@error > 0 select cast('STATEMENT TERMINATING ERROR' as text);
end

GO

declare @err int = @@error; if (@err > 0 and @@trancount > 0) select cast('BATCH ONLY TERMINATING' as text) else if @err > 0 select cast('BATCH TERMINATING\ txn rolledback' as text);
if @@trancount > 0 rollback transaction;
drop procedure error_mapping.ErrorHandling1;
set xact_abort OFF;
set implicit_transactions OFF;
GO

GO
GO

set xact_abort OFF;
GO

-- Example 2
GO

DECLARE @xml XML
SET @xml = CONVERT(XML, '<root></root>')
SELECT @xml.value('(*:)[1]', 'VARCHAR')

GO
GO


begin transaction
GO
GO

DECLARE @xml XML
SET @xml = CONVERT(XML, '<root></root>')
SELECT @xml.value('(*:)[1]', 'VARCHAR')

GO


if (@@trancount > 0) select cast('txn is not rolledback' as text) else select cast('txn is rolledback' as text)
GO

if (@@trancount > 0) rollback tran
GO

GO

begin transaction
GO
-- Executing test error_mapping.ErrorHandling1
create procedure error_mapping.ErrorHandling1 as
begin
DECLARE @xml XML
SET @xml = CONVERT(XML, '<root></root>')
SELECT @xml.value('(*:)[1]', 'VARCHAR')

if @@error > 0 select cast('STATEMENT TERMINATING ERROR' as text);
end

GO

declare @err int = @@error; if (@err > 0 and @@trancount > 0) select cast('BATCH ONLY TERMINATING' as text) else if @err > 0 select cast('BATCH TERMINATING\ txn rolledback' as text);
if @@trancount > 0 rollback transaction;
drop procedure error_mapping.ErrorHandling1;
set xact_abort OFF;
set implicit_transactions OFF;
GO

GO
GO



-- Checking xact_abort_flag for compile time error --
set xact_abort ON;
GO
GO

begin transaction
GO
-- Executing test error_mapping.ErrorHandling1
create procedure error_mapping.ErrorHandling1 as
begin
DECLARE @xml XML
SET @xml = CONVERT(XML, '<root></root>')
SELECT @xml.value('(*:)[1]', 'VARCHAR')

if @@error > 0 select cast('STATEMENT TERMINATING ERROR' as text);
end

GO

declare @err int = @@error; if (@err > 0 and @@trancount > 0) select cast('BATCH ONLY TERMINATING' as text) else if @err > 0 select cast('BATCH TERMINATING\ txn rolledback' as text);
if @@trancount > 0 rollback transaction;
drop procedure error_mapping.ErrorHandling1;
set xact_abort OFF;
set implicit_transactions OFF;
GO

GO
GO

set xact_abort OFF;
GO


DROP SCHEMA error_mapping;
GO

