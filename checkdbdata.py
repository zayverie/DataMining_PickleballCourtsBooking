import mysql.connector

conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="XB_Padz20",
    database="pickleball_courts_booking_db"
)
cursor = conn.cursor()

query = """
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
"""

cursor.execute(query)

all_rows = cursor.fetchall()

print(f"--- DISPLAYING ALL DATA (Total Rows: {len(all_rows)}) ---")

for row in all_rows:
    print(row)

cursor.close()
conn.close()
