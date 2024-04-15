
USE exam;


-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    address VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

-- Insert data into Customers table
INSERT INTO Customers (customer_id, customer_name, address, email, phone_number) VALUES
(1, 'PharmaCo Inc.', '123 Pharma St., Pharma City', 'info@pharmaco.com', '123-456-7890'),
(2, 'MediCare Solutions', '456 Health Blvd., Medtown', 'contact@medicare.com', '234-567-8901'),
(3, 'PharmaPlus Ltd.', '789 Wellness Ave., Pharmaville', 'support@pharmaplus.com', '345-678-9012'),
(4, 'HealLife Pharmaceuticals', '987 Cure Road, Healville', 'info@heallife.com', '456-789-0123');

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_category VARCHAR(50)
);

-- Insert data into Products table
INSERT INTO Products (product_id, product_name, product_category) VALUES
(101, 'Product A', 'Category 1'),
(102, 'Product B', 'Category 2'),
(103, 'Product C', 'Category 1'),
(104, 'Product D', 'Category 3'),
(105, 'Product E', 'Category 2'),
(106, 'Product F', 'Category 1'),
(107, 'Product G', 'Category 3'),
(108, 'Product H', 'Category 2');

-- Create Sales_Records table
CREATE TABLE Sales_Records (
    record_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sales_amount DECIMAL(10, 2),
    sales_date DATE
);

-- Insert data into Sales_Records table
INSERT INTO Sales_Records (record_id, customer_id, product_id, sales_amount, sales_date) VALUES
(1, 1, 101, 1000.50, '2024-03-01'),
(2, 2, 102, 2000.75, '2024-03-02'),
(3, 1, 103, 1500.25, '2024-03-03'),
(4, 3, 104, 3000.00, '2024-03-04'),
(5, 4, 105, 1200.90, '2024-03-05'),
(6, 2, 106, 1800.30, '2024-03-06'),
(7, 1, 107, 2500.60, '2024-03-07'),
(8, 3, 108, 4000.75, '2024-03-08');




CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10),
    departure_airport VARCHAR(50),
    arrival_airport VARCHAR(50),
    departure_date DATE,
    arrival_date DATE,
    base_price DECIMAL(10, 2)
);

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    frequent_flyer_status BOOLEAN
);

CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    ticket_price DECIMAL(10, 2),
    ticket_date DATE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);


INSERT INTO Flights VALUES (1, 'FL123', 'JFK', 'LAX', '2024-04-01', '2024-04-01', 500.00);
INSERT INTO Flights VALUES (2, 'FL456', 'LAX', 'ORD', '2024-04-02', '2024-04-02', 400.00);
INSERT INTO Flights VALUES (3, 'FL789', 'ORD', 'DFW', '2024-04-03', '2024-04-03', 300.00);

INSERT INTO Passengers VALUES (1, 'John Doe', 35, 'Male', true);
INSERT INTO Passengers VALUES (2, 'Jane Smith', 28, 'Female', false);
INSERT INTO Passengers VALUES (3, 'Michael Johnson', 40, 'Male', true);

INSERT INTO Tickets VALUES (101, 1, 1, 500.00, '2024-03-30');
INSERT INTO Tickets VALUES (102, 2, 2, 400.00, '2024-03-31');
INSERT INTO Tickets VALUES (103, 3, 3, 300.00, '2024-04-01');
INSERT INTO Tickets VALUES (104, 1, 2, 500.00, '2024-03-30');
INSERT INTO Tickets VALUES (105, 2, 3, 400.00, '2024-03-31');
INSERT INTO Tickets VALUES (106, 3, 1, 300.00, '2024-04-01');


-- Create Players table
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(255),
    player_email VARCHAR(255),
    registration_date DATE
);

-- Create Games table
CREATE TABLE Games (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(255),
    game_genre VARCHAR(255),
    release_date DATE
);

-- Create PlayerScores table
CREATE TABLE PlayerScores (
    score_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    score INT,
    play_date DATE,
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);



-- Insert statements for Players table
INSERT INTO Players (player_id, player_name, player_email, registration_date) VALUES
(1, 'John Doe', 'johndoe@example.com', '2023-01-15'),
(2, 'Jane Smith', 'janesmith@example.com', '2023-02-20'),
(3, 'Mark Johnson', 'markjohnson@example.com', '2023-03-10');

-- Insert statements for Games table
INSERT INTO Games (game_id, game_name, game_genre, release_date) VALUES
(1, 'Fortnite', 'Battle Royale', '2020-07-25'),
(2, 'Minecraft', 'Sandbox', '2011-11-18'),
(3, 'League of Legends', 'MOBA', '2009-10-27');

-- Insert statements for PlayerScores table
INSERT INTO PlayerScores (score_id, player_id, game_id, score, play_date) VALUES
(1, 1, 1, 250, '2023-01-20'),
(2, 1, 2, 500, '2023-02-01'),
(3, 2, 1, 300, '2023-02-15'),
(4, 2, 3, 700, '2023-03-05'),
(5, 3, 1, 400, '2023-03-20'),
(6, 3, 2, 600, '2023-03-25'),
(7, 3, 3, 800, '2023-04-01');



-- Create Patients table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    admission_date DATE,
    discharge_date DATE,
    diagnosis VARCHAR(100),
    bill_amount DECIMAL(10, 2)
);

-- Insert data into Patients table
INSERT INTO Patients (patient_id, patient_name, age, gender, admission_date, discharge_date, diagnosis, bill_amount)
VALUES
    (1, 'John Doe', 45, 'Male', '2023-01-15', '2023-01-30', 'Hypertension', 1500.00),
    (2, 'Jane Smith', 30, 'Female', '2023-02-10', '2023-02-20', 'Diabetes', 2000.00),
    (3, 'Michael Johnson', 65, 'Male', '2023-03-05', '2023-03-20', 'Stroke', 3500.00),
    (4, 'Emily Wilson', 50, 'Female', '2023-04-12', '2023-04-25', 'Pneumonia', 2800.00),
    (5, 'David Brown', 55, 'Male', '2023-05-20', '2023-06-05', 'Heart Attack', 5000.00);

-- Create Doctors table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    years_of_experience INT
);

-- Insert data into Doctors table
INSERT INTO Doctors (doctor_id, doctor_name, specialization, years_of_experience)
VALUES
    (101, 'Dr. Smith', 'Cardiology', 10),
    (102, 'Dr. Johnson', 'Neurology', 15),
    (103, 'Dr. Brown', 'Endocrinology', 8),
    (104, 'Dr. Wilson', 'Pulmonology', 12),
    (105, 'Dr. White', 'Internal Medicine', 5);

-- Create Treatments table
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    treatment_name VARCHAR(100),
    treatment_date DATE,
    cost DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Insert data into Treatments table
INSERT INTO Treatments (treatment_id, patient_id, doctor_id, treatment_name, treatment_date, cost)
VALUES
    (1, 1, 101, 'Angioplasty', '2023-01-20', 5000.00),
    (2, 2, 103, 'Insulin Therapy', '2023-02-15', 1000.00),
    (3, 3, 102, 'Physical Therapy', '2023-03-10', 2000.00),
    (4, 4, 104, 'Oxygen Therapy', '2023-04-15', 1500.00),
    (5, 5, 101, 'Heart Surgery', '2023-05-25', 10000.00);

-- Lab 5:
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50),
    enrollment_year INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT,
    department VARCHAR(50)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2),
    semester VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);



-- Inserting data into the Students table
INSERT INTO Students (student_id, student_name, major, enrollment_year) VALUES
(1, 'John Doe', 'Computer Science', 2020),
(2, 'Jane Smith', 'Biology', 2021),
(3, 'Alice Johnson', 'History', 2019),
(4, 'Michael Brown', 'Mathematics', 2020),
(5, 'Emily Wilson', 'Psychology', 2021),
(6, 'David Lee', 'Economics', 2019);

-- Inserting data into the Courses table
INSERT INTO Courses (course_id, course_name, credits, department) VALUES
(101, 'Introduction to Computer Science', 3, 'Computer Science'),
(102, 'Cell Biology', 4, 'Biology'),
(103, 'World History', 3, 'History'),
(104, 'Calculus I', 4, 'Mathematics'),
(105, 'Introduction to Psychology', 3, 'Psychology'),
(106, 'Microeconomics', 3, 'Economics');

-- Inserting data into the Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, grade, semester) VALUES
(1, 1, 101, 85.0, 'Fall'),
(2, 1, 104, 78.5, 'Fall'),
(3, 2, 102, 92.0, 'Spring'),
(4, 3, 103, 88.5, 'Fall'),
(5, 3, 106, 95.0, 'Spring'),
(6, 4, 101, 90.0, 'Fall'),
(7, 4, 104, 85.5, 'Spring'),
(8, 5, 105, 87.5, 'Fall'),
(9, 5, 106, 91.0, 'Spring'),
(10, 6, 106, 94.0, 'Fall');


SELECT * FROM sales_records;

SELECT * FROM products;

SELECT AVG(s.sales_amount) AS avg_sales, p.product_category
FROM sales_records s
JOIN products p ON  s.product_id = p.product_id
WHERE sales_date > EXTRACT(DAY FROM DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY))
GROUP BY p.product_category;

SELECT * FROM products;

SELECT p.product_name, SUM(s.sales_amount), s.sales_date FROM 
products p 
JOIN sales_records s ON p.product_id = s.product_id
GROUP BY p.product_name, s.sales_date;

SELECT p.product_name, SUM(s.sales_amount), s.sales_date FROM 
products p 
JOIN sales_records s ON p.product_id = s.product_id
GROUP BY p.product_name, s.sales_date
ORDER BY SUM(s.sales_amount) desc
LIMIT 3;

SELECT p.product_name, SUM(s.sales_amount) FROM 
products p 
JOIN sales_records s ON p.product_id = s.product_id
WHERE year(sales_date) = YEAR(CURRENT_DATE())
GROUP BY p.product_name
ORDER BY SUM(s.sales_amount) desc
LIMIT 3;

SELECT * FROM customers;
SELECT * FROM sales_records;

SELECT c.customer_name, SUM(s.sales_amount),
CUME_DIST() OVER (PARTITION BY c.customer_name ORDER BY SUM(s.sales_amount) DESC) as contribution
FROM customers c
JOIN sales_records s ON c.customer_id = s.customer_id
GROUP BY c.customer_name, s.sales_amount
ORDER BY contribution DESC;

SELECT c.customer_name, SUM(s.sales_amount)
FROM customers c
JOIN sales_records s ON c.customer_id = s.customer_id
group by c.customer_name
ORDER BY SUM(s.sales_amount) DESC
LIMIT 1;

SELECT * FROM products;

SELECT * FROM sales_records;

SELECT c.customer_name, 
CASE WHEN customer_name IN
(SELECT customer_name FROM customers c
JOIN sales_records s ON c.cateogry_id = s.category_id
WHERE sales_date > DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)) THEN "Consistent Buyers"
ELSE "Ocassional Buyers"
END AS purchasing_behaviour
FROM customers;

SELECT * FROM Flights;

SELECT AVG(base_price), GROUP_CONCAT( departure_airport, "-", arrival_airport) AS fight_route
FROM Flights;

SELECT AVG(t.ticket_price), f.departure_airport, f.arrival_airport AS fight_route, 
GROUP_CONCAT( f.departure_airport, "-", f.arrival_airport) as flight_route
FROM Flights f
JOIN tickets t ON f.flight_id = t.flight_id
GROUP BY f.departure_airport, f.arrival_airport;

SELECT f.flight_number, f.departure_date, COUNT(ticket_id) as ticket_count
FROM Flights f
JOIN tickets t ON f.flight_id = t.flight_id
WHERE MONTH(ticket_date) > DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY f.flight_number, f.departure_date
ORDER BY ticket_count DESC;

SELECT p.passenger_name, p.frequent_flyer_status, SUM(t.ticket_price) AS total_amount_spent
FROM passengers p
JOIN tickets t ON p.passenger_id = t.passenger_id
GROUP BY p.passenger_name, p.frequent_flyer_status
ORDER BY SUM(t.ticket_price)
LIMIT 5;

SELECT MONTH(t.ticket_date), count(p.passenger_id) AS ticket_count
FROM ticket t
JOIN passengers p ON t.passenger_id = p.passenger_id
GROUP BY Month(t.ticket_date)
order by ticket_count
LIMIT 1;

SELECT * FROM games;

SELECT game_genre, AVG(DATEDIFF(ps.play_date,p.registration_date)) AS play_time
FROM games g
join PLAYERSCORES ps
ON g.game_id = ps.game_id
JOIN players p ON ps.player_id = p.player_id
GROUP BY game_genre;

SELECT g.game_name, COUNT(*) as num_player
FROM games g
JOIN playerscores ps ON g.game_id = ps.game_id
JOIN players p ON ps.player_id = p.player_id
GROUP BY g.game_name
ORDER by num_player DESC
LIMIT 3;

SELECT g.game_name, MAX(ps.score) as highest_score, AVG(ps.score) as average_score, COUNT(ps.player_id) AS player_count
FROM games g
JOIN playerscores ps ON g.game_id = ps.game_id
JOIN players p ON ps.player_id = p.player_id
group by game_name;

SELECT p.player_name FROM players p WHERE NOT EXISTS (SELECT p.player_name FROM games g
JOIN playerscores ps ON g.game_id = ps.game_id
JOIN players p ON ps.player_id = p.player_id
WHERE DAY(ps.play_date) > DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY))
AND EXISTS (SELECT p.player_name FROM games g
JOIN playerscores ps ON g.game_id = ps.game_id
JOIN players p ON ps.player_id = p.player_id
WHERE DAY(ps.play_date) < DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY))
;

SELECT d.doctor_name, SUM(t.cost) as total_cost
FROM doctors d
JOIN treatments t ON d.doctor_id = t.doctor_id
GROUP BY doctor_name
ORDER BY SUM(cost) DESC
Limit 5;

SELECT treatment_name, SUM(cost) as revenue, ((SUM(cost)-cost)/(cost)*100) as percent
FROM treatments
GROUP BY treatment_name;

SELECT patient_id, patient_name, admitted_date, discharge_date
FROM patients
WHERE DAY(DATEDIFF(admission_date, dicharge_date)) < 30

SELECT p.patient_id, p.patient_name, p.admitted_date, p.discharge_date
FROM patients p 
JOIN treatments t 
ON p.patient_id = t.patient_date
WHERE DAY(DATEDIFF(admission_date, t.treatment_date)) < 30

SELECT 

SELECT gender, diagnosis, AVG(DATEDIFF(discharge_date - admission_date) as avg_len_stay
FROM patients

SELECT c.department, e.semester, avg(e.grade)
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.department, e.semester
ORDER BY c.department, e.semester

SELECT s.major, COUNT(e.student_id) as enroll_stud, enrollment_year
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY major, s.enrollment_year

SELECT s.student_id, s.student_name, e.semester, SUM(c.credits) as credit_comp
FROM stduents s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.student_name, e.semester
HAVING SUM(c.credits) >= 50;

SELECT c.course_name, s.enrollment_year, COUNT(*) as num_st
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name, s.enrollment_year
ORDER BY COUNT(e.student_id) desc
LIMIT 5;
