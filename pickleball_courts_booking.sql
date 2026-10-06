CREATE DATABASE IF NOT EXISTS pickleball_db;
USE pickleball_courts_booking;

CREATE TABLE Courts (
    court_id INT AUTO_INCREMENT PRIMARY KEY,
    court_name VARCHAR(50) NOT NULL,
    hourly_rate DECIMAL(10,2) NOT NULL,
    is_cleaned BOOLEAN DEFAULT TRUE
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(11) NOT NULL
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    employee_type VARCHAR(30) NOT NULL
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
    equipment_type VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    total_rental_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_type VARCHAR(20) NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    reference_number VARCHAR(50) NOT NULL,
    payment_date DATETIME NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_category VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    pay_period VARCHAR(20) NOT NULL
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
    provider VARCHAR(50) NOT NULL,
    FOREIGN KEY (expense_id) REFERENCES Expenses(expense_id)
);

INSERT INTO Courts (court_name, hourly_rate, is_cleaned) VALUES 
('Court 1 (Outdoor)', 400.00, TRUE);

INSERT INTO Customers (name, contact_number) VALUES 
('Alyssa Valdez', '09171234567'),
('Mika Reyes', '09189876543');

INSERT INTO Employees (name, employee_type) VALUES 
('Juan Dela Cruz', 'Caretaker'),
('Maria Clara', 'Front Desk');

INSERT INTO Bookings (customer_id, court_id, employee_id, booking_date, court_fee_total) VALUES 
(1, 1, 2, '2026-10-15', 800.00);

INSERT INTO Schedules (booking_id, start_time, end_time) VALUES 
(1, '2026-10-15 17:00:00', '2026-10-15 19:00:00');

INSERT INTO Equipment_Rentals (booking_id, equipment_type, quantity, total_rental_price) VALUES 
(1, 'Paddle Rental', 2, 100.00);

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
