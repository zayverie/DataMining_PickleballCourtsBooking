CREATE DATABASE IF NOT EXISTS pickleball_courts_booking;
USE pickleball_courts_booking;


CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE Courts (
    court_id INT AUTO_INCREMENT PRIMARY KEY,
    court_name VARCHAR(50),
    hourly_rate DECIMAL(10,2)
);

CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    court_id INT,
    hours_booked INT,
    total_price DECIMAL(10,2),
    booking_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (court_id) REFERENCES Courts(court_id)
);

CREATE TABLE Utilities (
    utility_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_type VARCHAR(50),    -- e.g., 'Electricity (Floodlights)', 'Water'
    amount DECIMAL(10,2),        -- Cost in PHP
    billing_month VARCHAR(20)    -- e.g., 'October 2026'
);

INSERT INTO Customers (name, phone) VALUES 
('Alex Mercer', '0917-123-4567'),
('Sophia Chen', '0918-987-6543');

INSERT INTO Courts (court_name, hourly_rate) VALUES 
('Court 1 (Outdoor Pad)', 400.00);

INSERT INTO Bookings (customer_id, court_id, hours_booked, total_price, booking_date) VALUES 
(1, 1, 3, 1200.00, '2026-10-01'),
(2, 1, 4, 1600.00, '2026-10-02'),
(1, 1, 5, 2000.00, '2026-10-03');

INSERT INTO Utilities (expense_type, amount, billing_month) VALUES 
('Land Lease Deposit/Rent', 15000.00, 'October 2026'),
('Electricity (Floodlights)', 6000.00, 'October 2026'),
('Water Bill', 1500.00, 'October 2026'),
('Caretaker Allowance', 10000.00, 'October 2026');

SELECT * FROM Customers;
SELECT * FROM Courts;
SELECT * FROM Bookings;
SELECT * FROM Utilities;