use master;
go

create table t2145(c1 int);
go

-- PG backend error
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY c1) OVER (PARTITION BY c1) as pc FROM t2145;
go

-- antlr error
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY c1) OVER (ORDER BY c1) as pc FROM t2145;
go

-- antlr error
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY c1) OVER (ORDER BY c1 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as pc FROM t2145;
go

-- PG backend error
SELECT PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY c1) OVER (PARTITION BY c1) as pc FROM t2145;
go

-- antlr error
SELECT PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY c1) OVER (ORDER BY c1) as pc FROM t2145;
go

-- antlr error
SELECT PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY c1) OVER (ORDER BY c1 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as pc FROM t2145;
go

drop table t2145;
go
