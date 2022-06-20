CREATE PROCEDURE babel_2328_proc_varchar(
    @nvcwl nvarchar(32),
    @nvcwol nvarchar,
    @vcwl varchar(32),
    @vcwol varchar
    ) as
    select @nvcwl, @nvcwol, @vcwl, @vcwol;
;
go

exec babel_2328_proc_varchar
    N'nvarchar with length',
    N'nvarchar without length',
    N'varchar with length',
    N'varchar without length'
;
go

exec babel_2328_proc_varchar
     'nvarchar with length',
     'nvarchar without length',
     'varchar with length',
     'varchar without length'
;
go

drop procedure babel_2328_proc_varchar;
go


CREATE PROCEDURE babel_2328_proc_char(
    @ncwl nchar(32),
    @ncwol nchar,
    @cwl char(32),
    @cwol char
) as
select @ncwl, @ncwol, @cwl, @cwol;
    ;
go

exec babel_2328_proc_char
     N'nchar with length',
     N'nchar without length',
     N'char with length',
     N'char without length'
;
go

exec babel_2328_proc_char
     'nchar with length',
     'nchar without length',
     'char with length',
     'char without length'
;
go

drop procedure babel_2328_proc_char;
go