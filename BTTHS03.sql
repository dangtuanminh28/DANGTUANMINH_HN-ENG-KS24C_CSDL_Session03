drop database if exists btth03;
create database btth03;
use btth03;

create table students (
    student_id int primary key auto_increment,
    full_name varchar(150) not null,
    date_of_birth date not null,
    email varchar(255) not null,
    gender enum('nam','nữ','other') default 'other',
    class_name varchar(150) not null
);

create table subjects (
    subject_id int primary key auto_increment,
    subject_name varchar(150) not null,
    credit_hours int not null check (credit_hours > 0)
);

create table enrollments (
    student_id int,
    subject_id int,
    semester varchar(20),
    regist_date datetime,
    primary key (subject_id, student_id),
    foreign key (student_id) references students(student_id),
    foreign key (subject_id) references subjects(subject_id)
);

-- 1. Thêm sinh viên
insert into students (full_name, date_of_birth, email, gender, class_name) values
('Nguyễn Văn A', '2021-05-12', 'nguyena@gmail.com', 'nam', '10A1'),
('Đặng Tuấn Minh', '2021-06-15', 'minh@gmail.com', 'nữ', '10A2'),
('Phạm Duy Anh', '2021-07-20', 'duy@gmail.com', 'nam', '10A1'),
('Nguyễn Khoa Nem', '2021-08-10', 'nem@gmail.com', 'nữ', '10A3'),
('Phan Hữu Nue', '2021-09-05', 'nue@gmail.com', 'nam', '10A2');

-- 1. Thêm môn học
insert into subjects (subject_name, credit_hours) values
('Toán cao cấp', 4),
('Lập trình C', 3),
('Hóa học', 2),
('Tiếng Anh', 3),
('Cơ sở dữ liệu', 3);

-- 1. Thêm đăng ký
insert into enrollments (student_id, subject_id, semester, regist_date) values
(1, 1, '20251', '2025-09-01 08:00:00'),
(2, 2, '20251', '2025-09-01 09:00:00'),
(3, 1, '2025-09-02 10:00:00', '2025-09-02 10:00:00'),
(4, 5, '20251', '2025-09-02 11:00:00'),
(5, 5, '20251', '2025-09-03 14:00:00'),  -- sửa subject_id 6 → 5 vì chỉ có 5 môn
(1, 2, '20251', '2025-09-03 15:00:00');

-- 2. Sửa tên thêm "giỏi" vào sau tên (SỬA LỖI Ở ĐÂY)
update students set full_name = 'Nguyễn Văn A giỏi' where student_id = 1;
update students set full_name = 'Phạm Duy Anh giỏi' where student_id = 3;

-- 3. Sửa tên môn
update subjects set subject_name = 'Môn học lập trình' where subject_name = 'Lập trình C';

-- 4. Xóa môn học mã 2 và 3
delete from enrollments where subject_id = 2;
delete from enrollments where subject_id = 3;

delete from subjects where subject_id = 2;
delete from subjects where subject_id = 3;

-- 5. Đăng ký môn 1 cho sinh viên 2
insert into enrollments (student_id, subject_id, semester, regist_date)
values (2, 1, '20251', current_timestamp());

-- 6. Hủy đăng ký của sinh viên 2
delete from enrollments 
where student_id = 2;

delete from enrollments 
where subject_id = 1;

-- Hiển thị kết quả
select
    s.full_name as 'Họ và tên sinh viên',
    sub.subject_name as 'Tên môn học',
    e.semester as 'Học kỳ',
    e.regist_date as 'Ngày đăng ký'
from enrollments e
join students s on e.student_id = s.student_id
join subjects sub on e.subject_id = sub.subject_id
order by e.regist_date;