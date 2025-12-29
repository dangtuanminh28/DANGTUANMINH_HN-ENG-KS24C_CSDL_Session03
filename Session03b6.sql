drop database if exists session03;
create database session03;
use session03;
-- Bài 6
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

create table score (
    student_id int,
    subject_id int,
    mid_score int not null check (mid_score >= 0 and mid_score <= 10),
    final_score int not null check (final_score >= 0 and final_score <= 10),
    primary key (student_id, subject_id),
    foreign key (student_id) references students(student_id),
    foreign key (subject_id) references subjects(subject_id)
);

-- Thêm sinh viên trước
insert into students (full_name, date_of_birth, email) values
('Nguyễn Văn A', '2006-05-15', 'nguyenvana@gmail.com'),
('Đặng Tuấn Minh', '2006-12-28', 'minh@gmail.com'),
('Phạm Duy Anh', '2005-03-10', 'duy@gmail.com');

-- Thêm môn học trước
insert into subjects (subject_name, credit) values
('Cơ sở dữ liệu', 3),
('Lập trình Java', 5),
('Lập trình Web', 4);

-- Thêm điểm
insert into score (student_id, subject_id, mid_score, final_score) values
(1, 1, 7, 8),
(1, 3, 8, 9),
(2, 1, 6, 7),
(3, 2, 9, 9);

-- Cập nhật điểm
update score set final_score = 8.5 where student_id = 1 and subject_id = 1;

-- Hiển thị điểm
select
    s.full_name as 'Sinh viên',
    sub.subject_name as 'Môn học',
    sc.mid_score as 'Điểm giữa kỳ',
    sc.final_score as 'Điểm cuối kỳ'
from score sc
join students s on sc.student_id = s.student_id
join subjects sub on sc.subject_id = sub.subject_id;