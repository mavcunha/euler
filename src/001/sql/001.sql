create table constant (target number);
insert into constant values (999);

create table results (i number, result number);

insert into results
  select 3, 3*(p*(p+1)) / 2  from
    (select target / 3 as p from constant);

insert into results
  select 5, 5*(p*(p+1)) / 2  from
    (select target / 5  as p from constant);

insert into results
  select 15, -(15*(p*(p+1)) / 2)  from
    (select target / 15 as p from constant);

select sum(result) from results;
