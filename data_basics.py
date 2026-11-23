import mysql.connector

conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="XB_Padz20",
    database="pickleball_courts_booking_db"
)
variable1 = conn.cursor()
variable2 = conn.cursor()

variable1.execute("SELECT * FROM Customers")
first_data = variable1.fetchall()

variable2.execute("SELECT * FROM Bookings")
second_data = variable2.fetchall()

print("The Output")
print(first_data)
print("The Second Output")
print(second_data)

variable1.close()
variable2.close()
conn.close()
