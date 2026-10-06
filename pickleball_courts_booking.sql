CREATE DATABASE IF NOT EXISTS pickleball_db;
USE pickleball_courts_booking;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    contact_number VARCHAR(20) NOT NULL
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    employee_type VARCHAR(30) NOT NULL,
    monthly_salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE Courts (
    court_id INT AUTO_INCREMENT PRIMARY KEY,
    court_name VARCHAR(50) NOT NULL,
    hourly_rate DECIMAL(10,2) NOT NULL
);

CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    court_id INT,
    employee_id INT,
    booking_date DATE NOT NULL,
    hours_booked INT NOT NULL,
    court_fee_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (court_id) REFERENCES Courts(court_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Equipment_Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    item_name VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    total_rental_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    payment_method VARCHAR(30) NOT NULL, -- 'GCash' or 'Cash'
    amount_paid DECIMAL(10,2) NOT NULL,
    reference_number VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Utilities (
    utility_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_type VARCHAR(50) NOT NULL, -- 'Electricity', 'Land Lease', 'Water'
    amount DECIMAL(10,2) NOT NULL,
    billing_month VARCHAR(20) NOT NULL -- 'October 2026'
);


INSERT INTO Customers (name, contact_number) VALUES 
('Alex Mercer', '09171234567'),
('Sophia Chen', '09189876543');

INSERT INTO Employees (name, employee_type, monthly_salary) VALUES 
('Juan Dela Cruz', 'Caretaker', 12000.00),
('Maria Clara', 'Front Desk', 15000.00);

INSERT INTO Courts (court_name, hourly_rate) VALUES 
('Court 1 (Outdoor Pad)', 400.00);

INSERT INTO Bookings (customer_id, court_id, employee_id, booking_date, hours_booked, court_fee_total) VALUES 
(1, 1, 1, '2026-10-10', 2, 800.00);

INSERT INTO Schedules (booking_id, start_time, end_time) VALUES 
(1, '17:00:00', '19:00:00');

INSERT INTO Equipment_Rentals (booking_id, item_name, quantity, total_rental_price) VALUES 
(1, 'Paddle Rental', 2, 100.00);

INSERT INTO Payments (booking_id, payment_method, amount_paid, reference_number) VALUES 
(1, 'GCash', 500.00, 'GCASH-98712345'),
(1, 'Cash', 400.00, 'CASH-REC-001');

INSERT INTO Utilities (expense_type, amount, billing_month) VALUES 
('Land Lease', 15000.00, 'October 2026'),
('Electricity (Floodlights)', 6000.00, 'October 2026'),
('Water Utility', 1500.00, 'October 2026');

SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Courts;
SELECT * FROM Bookings;
SELECT * FROM Schedules;
SELECT * FROM Equipment_Rentals;
SELECT * FROM Payments;
SELECT * FROM Utilities;