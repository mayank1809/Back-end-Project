CREATE TABLE instructors (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);
-- INSERT INTO courses (id, instructor_id, name, max_seats, start_date) VALUES
-- (1, 1, 'Introduction to Programming', 50, '2024-03-15'),
-- (2, 2, 'Web Development Fundamentals', 30, '2024-04-01');

CREATE TABLE courses (
    id INT PRIMARY KEY,
    instructor_id INT,
    name VARCHAR(255) NOT NULL,
    max_seats INT,
    start_date DATE,
    FOREIGN KEY (instructor_id) REFERENCES instructors(id)
);

CREATE TABLE leads (
    id INT PRIMARY KEY,
    course_id INT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    linkedin_profile VARCHAR(255),
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE Comments (
    id INT PRIMARY KEY,
    lead_id INT,
    comment TEXT,
    FOREIGN KEY (lead_id) REFERENCES leads(id)
);


-- CREATE TABLE course_registrations (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(255) NOT NULL,
--     email VARCHAR(255) NOT NULL,
--     phone VARCHAR(20) NOT NULL,
--     linkedin VARCHAR(255) NOT NULL
-- );
