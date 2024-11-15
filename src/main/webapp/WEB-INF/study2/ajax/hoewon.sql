show tables;

desc hoewon2;


-- 테이블 복사(hoewon -> hoewon3)
create table if not exists hoewon3 select * from hoewon;

desc hoewon3;
select * from hoewon3;

alter table hoewon3 add column mid varchar(30) not null;
