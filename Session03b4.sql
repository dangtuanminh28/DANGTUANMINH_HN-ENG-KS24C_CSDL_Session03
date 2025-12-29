drop database if exists session03;
create database session03;
use session03;
-- Bài 4
create table subjects (
    subject_id int primary key auto_increment,
    subject_name varchar(150) not null,
    credit int not null check (credit > 0)
);

insert into subjects (subject_name, credit) values ('Cơ sở dữ liệu', 3), ('Lập trình Java', 4), ('Tiếng Anh', 2);

update subjects
set credit = 5 
where subject_name = 'Lập trình Java';

update subjects
set subject_name = 'Tin học' 
where subject_name = 'Tiếng Anh';

select * from subjects;