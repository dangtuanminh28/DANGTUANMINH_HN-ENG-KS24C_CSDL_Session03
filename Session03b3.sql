drop database if exists session03;
create database session03;
use session03;
-- Bài 3
create table student (
    student_id int primary key auto_increment,
    full_name varchar(150) not null,
    date_of_birth date not null,
    email varchar(255) not null unique
);

insert into student (full_name, date_of_birth, email) values
('Nguyễn Văn A', '2006-05-15', 'nguyenvana@gmail.com'),
('Đặng Tuấn Minh', '2006-12-28', 'minh@gmail.com'),
('Phạm Duy Anh', '2005-03-10', 'duy@gmail.com'),
('Nguyễn Khoa Nam', '2021-12-01', 'nam@gmail.com'),
('Phạm Hữu Nue', '2025-07-18', 'nue@gmail.com');

update student 
set email = 'phamDuy@gmail.com' 
where student_id = 3;

update student 
set date_of_birth = '2006-11-28' 
where student_id = 2;

delete from student 
where student_id = 5;

select student_id, full_name, date_of_birth, email from student;