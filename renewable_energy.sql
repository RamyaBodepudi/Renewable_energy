create database project_db;
use project_db;

-- Understanding the Data
-- 1. What are the data types for each column in your dataset?
describe roadaccidents_2022;

-- 2. 4. How many duplicate records are present in your dataset?
select accident_index, accident_reference, lsoa_of_casualty, count(*) from roadaccidents_2022
group by accident_index, accident_reference, lsoa_of_casualty
having count(*)>1;

alter table roadaccidents_2022
add column id int not null auto_increment first,
add primary key(id);

select accident_reference, count(*) from roadaccidents_2022
group by accident_reference
having count(*)>1;

select * from roadaccidents_2022
where accident_reference = 161137961;

delete from roadaccidents_2022 where id = 6;




select * from roadaccidents_2022;