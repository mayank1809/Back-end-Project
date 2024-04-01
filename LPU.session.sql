-- CREATE TABLE instructors (
--     id INT PRIMARY KEY,
--     name VARCHAR(255) NOT NULL,
--     email VARCHAR(255) NOT NULL UNIQUE
-- );

-- CREATE TABLE course_registrations (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(255) NOT NULL,
--     email VARCHAR(255) NOT NULL,
--     phone VARCHAR(20) NOT NULL,
--     linkedin VARCHAR(255) NOT NULL
-- );

-- select * from instructors;
-- select * from courses;    
select * from leads;
-- select * from course_registrations;

-- select * from comments;
-- SHOW CREATE TABLE comments;
 
--  DELETE FROM instructors;
--  DELETE FROM courses;
-- ALTER TABLE courses DROP COLUMN id;
-- ALTER TABLE courses ADD id INT IDENTITY(1,1) PRIMARY KEY;

-- SELECT CONSTRAINT_NAME
-- FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
-- WHERE TABLE_NAME = 'leads' AND COLUMN_NAME = 'id';

-- SELECT CONSTRAINT_NAME
-- FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
-- WHERE CONSTRAINT_TYPE = 'FOREIGN KEY' AND TABLE_NAME = 'leads';


-- ALTER TABLE leads DROP FOREIGN KEY `leads_ibfk1`;
-- ALTER TABLE leads DROP FOREIGN KEY leads_ibfk2;

-- SELECT CONSTRAINT_NAME
-- FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
-- WHERE TABLE_NAME = 'leads' AND CONSTRAINT_NAME LIKE 'leads_ibfk_%';

-- ALTER TABLE leads DROP FOREIGN KEY leads_ibfk_2;



-- SELECT CONSTRAINT_NAME, TABLE_NAME
-- FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
-- WHERE CONSTRAINT_NAME = 'leads_ibfk_1';


-- ALTER TABLE leads DROP FOREIGN KEY leads_ibfk_1;

-- SELECT CONSTRAINT_NAME, TABLE_NAME
-- FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
-- WHERE CONSTRAINT_NAME = 'leads_ibfk_1' AND TABLE_NAME = 'leads';

-- ALTER TABLE leads DROP FOREIGN KEY leads_ibfk_1;

-- ALTER TABLE courses DROP COLUMN id;
-- ALTER TABLE courses ADD id INT IDENTITY(1,1) PRIMARY KEY;

-- ALTER TABLE courses
-- ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

-- ALTER TABLE courses
-- DROP COLUMN id;

-- ALTER TABLE courses
-- ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;


-- ALTER TABLE comments DROP PRIMARY KEY, MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;


-- ALTER TABLE comments MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;


-- ALTER TABLE comments DROP PRIMARY KEY;
-- ALTER TABLE comments MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;



-- SELECT id FROM leads;

-- INSERT INTO comments (lead_id, comment)
-- VALUES (5, 'This lead seems very interested in the course.');

-- INSERT INTO comments (lead_id, comment) VALUES (4, 'This is a new comment.');

-- select * from comments;


-- INSERT INTO course_registrations (name, email, phone, linkedin)
-- VALUES ('John Doe', 'john@example.com', '1234567890', 'https://www.linkedin.com/in/johndoe');







-- INSERT INTO courses (id, instructor_id, name, max_seats, start_date) VALUES
-- (3, 5, 'Web Development Bootcamp', 50, '2024-03-15'),
-- (4, 6, 'Data Science Fundamentals', 40, '2024-04-01'),
-- (5, 7, 'Mobile App Development Course', 30, '2024-04-15'),
-- (6, 8, 'Machine Learning Workshop', 25, '2024-05-01'),
-- (7, 9, 'Digital Marketing Masterclass', 35, '2024-05-15'),
-- (8, 10, 'UI/UX Design Course', 30, '2024-06-01'),
-- (9, 11, 'Python Programming Bootcamp', 40, '2024-06-15'),
-- (10, 12, 'Java Development Course', 35, '2024-07-01'),
-- (11, 13, 'Cybersecurity Essentials', 30, '2024-07-15'),
-- (12, 14, 'Cloud Computing Fundamentals', 25, '2024-08-01'),
-- (13, 15, 'Artificial Intelligence Training', 20, '2024-08-15'),
-- (14, 16, 'Full Stack Web Development Course', 30, '2024-09-01'),
-- (15, 17, 'React Native App Development', 25, '2024-09-15'),
-- (16, 18, 'Data Analytics Certification', 30, '2024-10-01'),
-- (17, 19, 'Blockchain Fundamentals', 25, '2024-10-15'),
-- (18, 20, 'Game Development Workshop', 20, '2024-11-01'),
-- (19, 21, 'SQL Mastery Course', 25, '2024-11-15'),
-- (20, 22, 'Ethical Hacking Training', 20, '2024-12-01'),
-- (21, 23, 'Digital Art and Illustration', 25, '2024-12-15'),
-- (22, 24, 'DevOps Essentials', 20, '2025-01-01'),
-- (23, 25, 'Deep Learning Bootcamp', 15, '2025-01-15'),
-- (24, 26, 'Flutter App Development Course', 20, '2025-02-01'),
-- (25, 27, 'Network Security Fundamentals', 15, '2025-02-15'),
-- (26, 28, 'Data Visualization Workshop', 20, '2025-03-01'),
-- (27, 29, 'iOS App Development Course', 15, '2025-03-15'),
-- (28, 30, 'Angular Web Development', 20, '2025-04-01'),
-- (29, 31, 'C++ Programming Course', 15, '2025-04-15'),
-- (30, 32, 'Digital Photography Masterclass', 20, '2025-05-01'),
-- (31, 33, 'Linux Administration Training', 15, '2025-05-15'),
-- (32, 34, 'Frontend Web Development Bootcamp', 20, '2025-06-01'),
-- (33, 35, 'Software Testing Fundamentals', 15, '2025-06-15'),
-- (34, 36, 'WordPress Website Development', 20, '2025-07-01'),
-- (35, 37, 'R Programming Course', 15, '2025-07-15'),
-- (36, 38, 'Digital Marketing Analytics', 20, '2025-08-01'),
-- (37, 39, 'UI Design Fundamentals', 15, '2025-08-15'),
-- (38, 40, 'Data Engineering Bootcamp', 20, '2025-09-01'),
-- (39, 41, 'Java Spring Framework Course', 15, '2025-09-15'),
-- (40, 42, 'Android App Development Training', 20, '2025-10-01'),
-- (41, 43, 'Data Warehousing Fundamentals', 15, '2025-10-15'),
-- (42, 44, 'Motion Graphics Design Course', 20, '2025-11-01'),
-- (43, 45, 'Penetration Testing Workshop', 15, '2025-11-15'),
-- (44, 46, 'Node.js Development Course', 20, '2025-12-01'),
-- (45, 47, 'Unity Game Development Training', 15, '2025-12-15'),
-- (46, 48, 'Vue.js Web Development Bootcamp', 20, '2026-01-01'),
-- (47, 49, 'Ruby on Rails Course', 15, '2026-01-15'),
-- (48, 50, 'AWS Cloud Practitioner Training', 20, '2026-02-01'),
-- (49, 51, 'Cybersecurity Awareness Workshop', 15, '2026-02-15'),
-- (50, 52, 'React.js Frontend Course', 20, '2026-03-01'),
-- (51, 53, 'Python Django Framework Course', 15, '2026-03-15'),
-- (52, 54, 'Artificial Neural Networks Workshop', 20, '2026-04-01'),
-- (53, 55, 'Advanced JavaScript Concepts', 15, '2026-04-15'),
-- (54, 56, 'Natural Language Processing Training', 20, '2026-05-01'),
-- (55, 57, 'Cloud Security Fundamentals', 15, '2026-05-15'),
-- (56, 58, 'Vue.js State Management Course', 20, '2026-06-01'),
-- (57, 59, 'Cybersecurity Incident Response Training', 15, '2026-06-15');






-- INSERT INTO instructors (id, name, email) VALUES
-- (5, 'Aadrika Joshi', 'aadrika.joshi@example.com'),
-- (6, 'Aarav Gupta', 'aarav.gupta@example.com'),
-- (7, 'Aaradhana Singh', 'aaradhana.singh@example.com'),
-- (8, 'Aarav Reddy', 'aarav.reddy@example.com'),
-- (9, 'Aarohi Patel', 'aarohi.patel@example.com'),
-- (10, 'Abhinav Sharma', 'abhinav.sharma@example.com'),
-- (11, 'Advaita Kumar', 'advaita.kumar@example.com'),
-- (12, 'Advika Yadav', 'advika.yadav@example.com'),
-- (13, 'Ahaan Shah', 'ahaan.shah@example.com'),
-- (14, 'Aishani Verma', 'aishani.verma@example.com'),
-- (15, 'Aishwarya Das', 'aishwarya.das@example.com'),
-- (16, 'Akhil Patel', 'akhil.patel@example.com'),
-- (17, 'Akshay Singh', 'akshay.singh@example.com'),
-- (18, 'Akshara Mishra', 'akshara.mishra@example.com'),
-- (19, 'Amaira Gupta', 'amaira.gupta@example.com'),
-- (20, 'Amay Agarwal', 'amay.agarwal@example.com'),
-- (21, 'Amit Sharma', 'amit.sharma@example.com'),
-- (22, 'Amita Choudhary', 'amita.choudhary@example.com'),
-- (23, 'Ananya Jain', 'ananya.jain@example.com'),
-- (24, 'Anika Singh', 'anika.singh@example.com'),
-- (25, 'Anirudh Reddy', 'anirudh.reddy@example.com'),
-- (26, 'Anjali Sharma', 'anjali.sharma@example.com'),
-- (27, 'Anshika Yadav', 'anshika.yadav@example.com'),
-- (28, 'Anshuman Patel', 'anshuman.patel@example.com'),
-- (29, 'Aradhya Singh', 'aradhya.singh@example.com'),
-- (30, 'Arya Das', 'arya.das@example.com'),
-- (31, 'Arya Patel', 'arya.patel@example.com'),
-- (32, 'Atharv Kumar', 'atharv.kumar@example.com'),
-- (33, 'Avinash Singh', 'avinash.singh@example.com'),
-- (34, 'Ayush Das', 'ayush.das@example.com'),
-- (35, 'Bhavya Choudhary', 'bhavya.choudhary@example.com'),
-- (36, 'Chaitanya Agarwal', 'chaitanya.agarwal@example.com'),
-- (37, 'Daksh Yadav', 'daksh.yadav@example.com'),
-- (38, 'Darsh Agarwal', 'darsh.agarwal@example.com'),
-- (39, 'Dev Patel', 'dev.patel@example.com'),
-- (40, 'Dhruv Choudhary', 'dhruv.choudhary@example.com'),
-- (41, 'Divit Sharma', 'divit.sharma@example.com'),
-- (42, 'Gauri Gupta', 'gauri.gupta@example.com'),
-- (43, 'Harsh Patel', 'harsh.patel@example.com'),
-- (44, 'Ishaan Singh', 'ishaan.singh@example.com'),
-- (45, 'Jasleen Kaur', 'jasleen.kaur@example.com'),
-- (46, 'Kabir Singh', 'kabir.singh@example.com'),
-- (47, 'Karan Sharma', 'karan.sharma@example.com'),
-- (48, 'Kartik Kumar', 'kartik.kumar@example.com'),
-- (49, 'Khushi Jain', 'khushi.jain@example.com'),
-- (50, 'Krishna Reddy', 'krishna.reddy@example.com'),
-- (51, 'Mahi Patel', 'mahi.patel@example.com'),
-- (52, 'Manav Gupta', 'manav.gupta@example.com'),
-- (53, 'Manya Singh', 'manya.singh@example.com'),
-- (54, 'Maya Sharma', 'maya.sharma@example.com'),
-- (55, 'Mohit Kumar', 'mohit.kumar@example.com'),
-- (56, 'Mukul Choudhary', 'mukul.choudhary@example.com'),
-- (57, 'Navya Das', 'navya.das@example.com'),
-- (58, 'Neil Patel', 'neil.patel@example.com'),
-- (59, 'Neha Singh', 'neha.singh@example.com');




-- CREATE TABLE courses (
--     id INT PRIMARY KEY,
--     instructor_id INT,
--     name VARCHAR(255) NOT NULL,
--     max_seats INT,
--     start_date DATE,
--     FOREIGN KEY (instructor_id) REFERENCES instructors(id)
-- );

-- INSERT INTO courses (id, instructor_id, name, max_seats, start_date) VALUES
-- (1, 1, 'Introduction to Programming', 50, '2024-03-15'),
-- (2, 2, 'Web Development Fundamentals', 30, '2024-04-01');

-- select * from courses;

-- CREATE TABLE leads (
--     id INT PRIMARY KEY,
--     course_id INT,
--     name VARCHAR(255) NOT NULL,
--     email VARCHAR(255) NOT NULL,
--     phone VARCHAR(20),
--     linkedin_profile VARCHAR(255),
--     status VARCHAR(20) DEFAULT 'Pending',
--     FOREIGN KEY (course_id) REFERENCES courses(id)
-- );


-- CREATE TABLE Comments (
--     id INT PRIMARY KEY,
--     lead_id INT,
--     comment TEXT,
--     FOREIGN KEY (lead_id) REFERENCES leads(id)
-- );