import mysql.connector

try:
    connection = mysql.connector.connect(
        host="127.0.0.1",
        port=3306,
        user="root",
        password="XB_Padz20",
        database="pickleball_courts_booking_db"
    )

    if connection.is_connected():
        print("Successfully connected to the database!")
        cursor = connection.cursor()

except mysql.connector.Error as e:
    print(f"Error while connecting to MySQL: {e}")

finally:
    if 'connection' in locals() and connection.is_connected():
        cursor.close()
        connection.close()
        print("\nMySQL connection is now safely closed.")
