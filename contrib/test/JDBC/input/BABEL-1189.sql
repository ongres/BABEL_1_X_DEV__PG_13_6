create table babel_1189_t1(a int);
go

create table babel_1189_t2(a int);
go

create trigger babel_1189_trig on babel_1189_t2
for insert as
update babel_1189_t1 set a = 2
go

insert babel_1189_t1 values(1);
go

insert babel_1189_t2 values(1);
go

select * from babel_1189_t1;
select * from babel_1189_t2;
go

drop trigger babel_1189_trig;
drop table babel_1189_t1;
drop table babel_1189_t2;
go


