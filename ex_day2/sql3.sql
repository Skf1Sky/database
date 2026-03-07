CREATE DATABASE school_abc;
USE school_abc;

CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    teacher_id INT,
    CONSTRAINT fk_student_teacher FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

INSERT INTO teachers (name) VALUES ('Nguyễn Văn A'), ('Lê Thị B');
INSERT INTO students (name, teacher_id) VALUES ('Trần Nhất Thiên', 1), ('Nguyễn Văn C', 1), ('Lê Văn D', 2);

SELECT t.name AS 'Giáo viên', s.name AS 'Học sinh'
FROM teachers t
JOIN students s ON t.id = s.teacher_id;