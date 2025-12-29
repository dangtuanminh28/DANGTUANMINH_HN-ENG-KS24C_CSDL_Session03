drop database if exists session03;
create database session03;
use session03;
-- Bài 5
create table students (
    student_id int primary key auto_increment,
    full_name varchar(150) not null,
    date_of_birth date not null,
    email varchar(255) not null unique
);

create table subjects (
    subject_id int primary key auto_increment,
    subject_name varchar(150) not null,
    credit int not null check (credit > 0)
);

create table enrollment (
    student_id int,
    subject_id int,
    enroll_date date not null,
    primary key (student_id, subject_id),
    foreign key (student_id) references students(student_id),
    foreign key (subject_id) references subjects(subject_id)
);

insert into students (full_name, date_of_birth, email) values
('Nguyễn Văn A', '2006-05-15', 'nguyenvana@gmail.com'),
('Đặng Tuấn Minh', '2006-12-28', 'minh@gmail.com'),
('Phạm Duy Anh', '2005-03-10', 'duy@gmail.com');

insert into subjects (subject_name, credit) values
('Cơ sở dữ liệu', 3),
('Lập trình Java', 5),
('Lập trình Web', 4);

insert into enrollment (student_id, subject_id, enroll_date) values
(1, 1, '2025-09-01'), -- có sv 1, môn 1 tồn tại
(2, 1, '2025-09-04'), -- 4, 2 (sv 4 ko tồn tại, môn 2 có --> lỗi)
(3, 2, '2025-09-05'),
(1, 3, '2025-09-06');

select * from enrollment;

select * from enrollment
where student_id = 1;

-- SELECT (cột cần hiển thị)
select  s.full_name as 'Student', 
		sub.subject_name as 'Subject',
		e.enroll_date as 'Date'
-- FROM (bảng chính)
from enrollment e
-- JOIN (bảng phụ để lấy tên) + JOIN (bảng phụ thứ hai)
join students s on e.student_id = s.student_id
join subjects sub on e.subject_id = sub.subject_id