CREATE DATABASE IF NOT EXISTS pickleball_courts_booking_db;
USE pickleball_courts_booking_db;

CREATE TABLE Courts (
    court_id INT AUTO_INCREMENT PRIMARY KEY,
    court_name VARCHAR(50) NOT NULL,
    hourly_rate DECIMAL(10,2) NOT NULL,
    is_available BOOLEAN DEFAULT TRUE
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(11)
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    employee_type VARCHAR(30) NOT NULL,
    salary_value DECIMAL(10,2) NOT NULL
);

CREATE TABLE Equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_type VARCHAR(50) NOT NULL,
    rental_rate DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0
);

CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    court_id INT NOT NULL,
    employee_id INT NOT NULL,
    booking_date DATE NOT NULL,
    court_fee_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (court_id) REFERENCES Courts(court_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Equipment_Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    equipment_id INT NOT NULL,
    quantity INT NOT NULL,
    total_rental_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_type VARCHAR(20) NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    reference_number VARCHAR(50),
    payment_date DATETIME NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_category VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    pay_period VARCHAR(30)
);

CREATE TABLE Salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_id INT NOT NULL UNIQUE,
    employee_id INT NOT NULL,
    FOREIGN KEY (expense_id) REFERENCES Expenses(expense_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Utilities (
    utility_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_id INT NOT NULL UNIQUE,
    utility_type VARCHAR(50) NOT NULL,
    provider VARCHAR(100),
    FOREIGN KEY (expense_id) REFERENCES Expenses(expense_id)
);

INSERT INTO Courts (court_name, hourly_rate, is_available) VALUES 
('Court 1 (Outdoor)', 400.00, TRUE);

INSERT INTO Customers (customer_name, contact_number) VALUES 
('Alyssa Valdez', '09171234567'),
('Mika Reyes', '09189876543');

INSERT INTO Employees (employee_name, employee_type, salary_value) VALUES 
('Juan Dela Cruz', 'Caretaker', 12000.00),
('Maria Clara', 'Front Desk', 15000.00);

INSERT INTO Equipment (equipment_type, rental_rate, stock_quantity) VALUES 
('Paddle Rental', 50.00, 20),
('Pickleball (3-Pack)', 30.00, 50);

INSERT INTO Bookings (customer_id, court_id, employee_id, booking_date, court_fee_total) VALUES 
(1, 1, 2, '2026-10-15', 800.00);

INSERT INTO Schedules (booking_id, start_time, end_time) VALUES 
(1, '2026-10-15 17:00:00', '2026-10-15 19:00:00');

INSERT INTO Equipment_Rentals (booking_id, equipment_id, quantity, total_rental_price) VALUES 
(1, 1, 2, 100.00);

INSERT INTO Payments (booking_id, payment_type, amount_paid, reference_number, payment_date) VALUES 
(1, 'GCash', 500.00, 'GCASH-98712345', '2026-10-14 10:00:00'),
(1, 'Cash', 400.00, 'CASH-REC-001', '2026-10-15 16:50:00');

INSERT INTO Expenses (expense_category, amount, expense_date, pay_period) VALUES 
('Utility', 15000.00, '2026-10-01', 'October 2026');

INSERT INTO Utilities (expense_id, utility_type, provider) VALUES 
(1, 'Land Lease', 'Metro Manila Properties Corp');

INSERT INTO Expenses (expense_category, amount, expense_date, pay_period) VALUES 
('Utility', 6000.00, '2026-10-05', 'October 2026');

INSERT INTO Utilities (expense_id, utility_type, provider) VALUES 
(2, 'Electricity', 'Meralco');

INSERT INTO Expenses (expense_category, amount, expense_date, pay_period) VALUES 
('Payroll', 12000.00, '2026-10-30', 'October 2026');

INSERT INTO Salaries (expense_id, employee_id) VALUES 
(3, 1);

INSERT INTO Expenses (expense_category, amount, expense_date, pay_period) VALUES 
('Payroll', 15000.00, '2026-10-30', 'October 2026');

INSERT INTO Salaries (expense_id, employee_id) VALUES 
(4, 2);

INSERT INTO Courts (court_name, hourly_rate, is_available) VALUES
('Court 2 (Indoor VIP)', 600.00, TRUE),
('Court 3 (Standard)', 400.00, TRUE);

INSERT INTO Customers (customer_name, contact_number) VALUES
('Hairy Pottah', '09175551234'),
('Hermayonnaise Stranger', '09184445678'),
('Run Wizzly', '09193339876');

INSERT INTO Bookings (customer_id, court_id, employee_id, booking_date, court_fee_total) VALUES
(2, 2, 2, '2026-10-16', 1200.00), 
(3, 2, 1, '2026-10-17', 600.00),  
(4, 2, 2, '2026-10-18', 1800.00), 
(1, 3, 1, '2026-10-19', 800.00),  
(5, 1, 2, '2026-10-20', 400.00),  
(3, 2, 2, '2026-10-21', 1200.00); 

INSERT INTO Schedules (booking_id, start_time, end_time) VALUES
(8,  '2026-10-16 18:00:00', '2026-10-16 20:00:00'),
(9,  '2026-10-17 09:00:00', '2026-10-17 10:00:00'),
(10, '2026-10-18 17:00:00', '2026-10-18 20:00:00'),
(11, '2026-10-19 16:00:00', '2026-10-19 18:00:00'),
(12, '2026-10-20 08:00:00', '2026-10-20 09:00:00'),
(13, '2026-10-21 19:00:00', '2026-10-21 21:00:00');

INSERT INTO Equipment_Rentals (booking_id, equipment_id, quantity, total_rental_price) VALUES
(8,  1, 4, 200.00),
(8,  2, 1, 30.00),
(9,  1, 2, 100.00),
(10, 1, 4, 200.00),
(10, 2, 2, 60.00),
(11, 2, 1, 30.00),
(13, 1, 2, 100.00);

INSERT INTO Payments (booking_id, payment_type, amount_paid, reference_number, payment_date) VALUES
(8,  'GCash', 1430.00, 'GCASH-11223344', '2026-10-15 14:00:00'),
(9,  'Cash',   700.00, 'CASH-REC-002',   '2026-10-17 08:50:00'),
(10, 'GCash', 2060.00, 'GCASH-55667788', '2026-10-16 11:30:00'),
(11, 'Maya',   830.00, 'MAYA-99887766',  '2026-10-18 20:15:00'),
(12, 'Cash',   400.00, 'CASH-REC-003',   '2026-10-20 07:55:00'),
(13, 'GCash', 1300.00, 'GCASH-44332211', '2026-10-20 19:00:00');

SELECT 
    c.court_name,
    COUNT(DISTINCT b.booking_id) AS total_bookings,
    SUM(er.quantity) AS total_equipments_rented,
    SUM(DISTINCT b.court_fee_total) + SUM(er.total_rental_price) AS total_earned
FROM Courts c
LEFT JOIN Bookings b ON c.court_id = b.court_id
LEFT JOIN Equipment_Rentals er ON b.booking_id = er.booking_id
GROUP BY c.court_id, c.court_name
ORDER BY total_earned DESC;
