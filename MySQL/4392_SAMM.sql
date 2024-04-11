CREATE DATABASE inter;

USE inter;

CREATE TABLE L1_maintenance_records (
    maintenance_id INT PRIMARY KEY,
    machine_id INT,
    technician_name VARCHAR(255),
    maintenance_date DATE,
    maintenance_type VARCHAR(255),
    cost DECIMAL(10, 2)
);


INSERT INTO L1_maintenance_records (maintenance_id, machine_id, technician_name, maintenance_date, maintenance_type, cost) VALUES
(1, 1001, 'John Doe', '2024-03-15', 'Full Service', 1200.00),
(2, 1002, 'Jane Smith', '2024-03-20', 'Oil Change', 200.00),
(3, 1003, 'Mike Johnson', '2024-03-22', 'Belt Replacement', 450.00),
(4, 1001, 'Emily Davis', '2024-03-25', 'Calibration', 300.00),
(5, 1004, 'John Doe', '2024-04-01', 'Full Service', 1500.00);


CREATE TABLE L2_updates (
    update_id VARCHAR(255) PRIMARY KEY,
    product_id VARCHAR(255),
    release_date DATE,
    incident_count_pre_update INT,
    incident_count_post_update INT,
    user_feedback_score DECIMAL(3, 1)
);


INSERT INTO L2_updates (update_id, product_id, release_date, incident_count_pre_update, incident_count_post_update, user_feedback_score) VALUES
('U001', 'P100', '2024-03-01', 25, 5, 4.3),
('U002', 'P101', '2024-03-10', 40, 15, 3.8),
('U003', 'P102', '2024-03-15', 30, 2, 4.8),
('U004', 'P100', '2024-03-20', 10, 8, 4.1),
('U005', 'P103', '2024-03-25', 50, 20, 3.5);


CREATE TABLE L3_patients (
    patient_id VARCHAR(255) PRIMARY KEY,
    patient_name VARCHAR(255),
    date_of_birth DATE,
    insurance_provider VARCHAR(255)
);

INSERT INTO L3_patients (patient_id, patient_name, date_of_birth, insurance_provider) VALUES
('P001', 'John Smith', '1980-05-20', 'HealthCare Inc.'),
('P002', 'Jane Doe', '1975-08-04', 'MedSecure'),
('P003', 'Michael Bay', '1990-02-17', 'WellLife'),
('P004', 'Alice Johnson', '1983-11-13', 'HealthCare Inc.'),
('P005', 'Chris Evans', '1987-06-13', 'MedSecure');

CREATE TABLE L3_visits (
    visit_id VARCHAR(255) PRIMARY KEY,
    patient_id VARCHAR(255),
    facility_id VARCHAR(255),
    visit_date DATE,
    reason_for_visit VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES L3_patients(patient_id)
);


INSERT INTO L3_visits (visit_id, patient_id, facility_id, visit_date, reason_for_visit) VALUES
('V001', 'P001', 'F001', '2024-03-15', 'Routine Checkup'),
('V002', 'P002', 'F002', '2024-03-18', 'Consultation'),
('V003', 'P003', 'F003', '2024-03-20', 'Emergency'),
('V004', 'P004', 'F001', '2024-03-22', 'Routine Checkup'),
('V005', 'P005', 'F002', '2024-03-25', 'Consultation');


CREATE TABLE L3_treatments (
    treatment_id VARCHAR(255) PRIMARY KEY,
    visit_id VARCHAR(255),
    treatment VARCHAR(255),
    outcome VARCHAR(255),
    FOREIGN KEY (visit_id) REFERENCES L3_visits(visit_id)
);


INSERT INTO L3_treatments (treatment_id, visit_id, treatment, outcome) VALUES
('T001', 'V001', 'Vaccine', 'Successful'),
('T002', 'V002', 'Therapy', 'Ongoing'),
('T003', 'V003', 'Surgery', 'Complicated'),
('T004', 'V004', 'Vaccine', 'Successful'),
('T005', 'V005', 'Physical Therapy', 'Improved');


CREATE TABLE L3_facilities (
    facility_id VARCHAR(255) PRIMARY KEY,
    facility_name VARCHAR(255),
    location VARCHAR(255)
);


INSERT INTO L3_facilities (facility_id, facility_name, location) VALUES
('F001', 'Main Hospital', 'Downtown'),
('F002', 'North Clinic', 'Uptown'),
('F003', 'East Specialty', 'Suburban'),
('F004', 'West Emergency', 'City Outskirts'),
('F005', 'Central Health', 'Downtown');


CREATE TABLE L4_products (
    product_id VARCHAR(255) PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL(10, 2)
);


INSERT INTO L4_products (product_id, product_name, category, price) VALUES
('PR001', 'T-Shirt', 'Apparel', 29.99),
('PR002', 'Blender', 'Appliances', 49.99),
('PR003', 'Running Shoe', 'Footwear', 79.99),
('PR004', 'Coffee Maker', 'Appliances', 89.99),
('PR005', 'Baseball Cap', 'Apparel', 19.99);


CREATE TABLE L4_sales (
    sale_id VARCHAR(255) PRIMARY KEY,
    product_id VARCHAR(255),
    store_id VARCHAR(255),
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES L4_products(product_id)
);


INSERT INTO L4_sales (sale_id, product_id, store_id, sale_date, quantity) VALUES
('S001', 'PR001', 'ST001', '2024-03-15', 10),
('S002', 'PR002', 'ST002', '2024-03-18', 5),
('S003', 'PR003', 'ST003', '2024-03-20', 8),
('S004', 'PR004', 'ST001', '2024-03-22', 4),
('S005', 'PR005', 'ST002', '2024-03-25', 15);


CREATE TABLE L4_stores (
    store_id VARCHAR(255) PRIMARY KEY,
    store_name VARCHAR(255),
    region VARCHAR(255)
);


INSERT INTO L4_stores (store_id, store_name, region) VALUES
('ST001', 'City Plaza', 'North'),
('ST002', 'Town Mall', 'East'),
('ST003', 'Ocean View', 'West'),
('ST004', 'Mountain Ridge', 'North'),
('ST005', 'Valley Square', 'South');

SELECT * FROM l1_maintenance_records;

SELECT machine_id
FROM l1_maintenance_records
WHERE Month(maintenance_date) = 4 AND year(maintenance_date) = '2024' AND COST > (SELECT AVG(COST) FROM l1_maintenance_records)
;

SELECT maintenance_type, COUNT(*) as count FROM l1_maintenance_records
WHERE Month(maintenance_date) = 3 AND YEAR(maintenance_date)='2024'
GROUP BY maintenance_type
ORDER BY count DESC
LIMIT 1;

SELECT * FROM l1_maintenance_records;

SELECT technician_name, avg(cost), COUNT(maintenance_type) as count
FROM l1_maintenance_records
WHERE MONTH(maintenance_date) = 3 AND YEAR(maintenance_task) ='2024'
GROUP BY technician_name
ORDER BY avg(cost), COUNT(maintenance_type) DESC;


SELECT * FROM l2_updates;

SELECT product_id, AVG(incident_count_pre_update-incident_count_post_update) as avg_reduction
FROM l2_updates
GROUP BY product_id;

SELECT * FROM l2_updates;

SELECT product_id
FROM l2_updates
ORDER BY user_feedback_score DESC
limit 1;

SELECT product_id FROM l2_updates
WHERE user_feedback_score = (SELECT MAX(user_feedback_score) FROM l2_updates);

SELECT product_id, (incident_count_post_update-incident_count_pre_update) AS improvement_scale
FROM l2_updates
ORDER BY improvement_scale DESC
limit 1;

SELECT p.patient_name, f.facility_name, v.reason_for_visit, t.outcome
FROM l3_patients p
JOIN l3_visits v ON p.patient_id = v.patient_id
JOIN l3_treatments t ON v.visit_id = t.visit_id
JOIN l3_facilities f on v.facility_id = f.facility_id
WHERE Month(visit_date) = 3 AND Year(visit_date) = '2024';


SELECT f.facility_name, COUNT(v.visit_date) as count
FROM l3_visits v
JOIN l3_facilities f ON v.facility_id = f.facility_id
WHERE v.reason_for_visit = "Emergency"
GROUP BY f.facility_name;


SELECT p.insurance_provider, p.patient_id 
FROM l3_patients p
JOIN l3_visits v ON p.patient_id = v.patient_id
JOIN l3_treatments t ON v.visit_id = t.visit_id
WHERE t.outcome = " Complicated" AND Quarter(visit_date) = 3;
ORDER BY insurance_provider

SELECT * FROM l4_products;

SELECT product_id FROM l4_products p WHERE EXISTS (SELECT p.product_id , (p.price*s.sales) AS total_price 
FROM l4_products p JOIN l4_sales s ON p.product_id = s.product_id 
GROUP BY p_product_id
ORDER BY total_price DESC
Limit 1
)

CREATE OR REPLACE VIEW sample AS (
SELECT s.sale_id, st.store_name, st.region, (p.price*s.sales) AS total_sale FROM l4_sales s
JOIN l4_products p ON s.product_id = p.product_id
JOIN l4_stores st
ON s.store_id = st.store_id
WHERE Quarter(sales_date) = 1
GROUP BY st.region
ORDER BY (p.price*s.sales) DESC);

SELECT * FROM sample;

SELECT p.product_name, st.region 
FROM l4_products p 
FULL OUTER JOIN l4_sales s 
ON p.product_id = s.product_id
FULL OUTER JOIN l4_stores st ON s.store_id = st.store_id
WHERE Month(sales_date) = 3 AND YEAR(sales_date) = '2024'
ORDER BY p.product_name;







