import pymysql

try:
    conn = pymysql.connect(
        host="127.0.0.1",    # change to DBHOST if needed
        port=3306,           # or 3307 if you're using that
        user="root",
        password="pw",
        db="employees"
    )
    print("[✅] DB connection successful!")
    conn.close()
except Exception as e:
    print("[❌] DB connection failed:", e)
