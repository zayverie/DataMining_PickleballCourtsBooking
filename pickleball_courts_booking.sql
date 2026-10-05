/*CREATE TABLE Customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
phone VARCHAR(11)
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
total_price DECIMAL(10,2)
);*/

ALTER TABLE Customers
RENAME COLUMN phone TO contact_num;

ALTER TABLE Customers 
CHANGE COLUMN phone contact_num VARCHAR(11);

SELECT * FROM Customers;



INSERT INTO customers(name, contact_num)
VALUES
('John Doe', '09123456789'),
('Juan Dela Cruz', '09987654321'),
('Amadeus Bogart', '09342156567');

INSERT INTO courts(court_name, hourly_rate)
VALUES
('Court A', '100.00'),
('Court B', '150.00'),
('Court C', '200.00');

INSERT INTO bookings(customer_id, court_id, hours_booked, total_price) VALUES
(1, 3, 5, 1000.00),
(2, 1, 6, 600.00),
(3, 2, 1, 150.00);

SELECT * FROM Customers;
SELECT * FROM Courts;
SELECT * FROM BOOKINGS;