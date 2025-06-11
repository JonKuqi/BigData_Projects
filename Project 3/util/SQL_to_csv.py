import mysql.connector
import pandas as pd
import os

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="mondial"
)

cursor = conn.cursor()
cursor.execute("SHOW TABLES;")
tables = cursor.fetchall()

export_dir = r"C:\Users\jonku\Desktop\mondial_exports"
os.makedirs(export_dir, exist_ok=True)

for (table_name,) in tables:
    df = pd.read_sql(f"SELECT * FROM {table_name}", conn)
    csv_path = os.path.join(export_dir, f"{table_name}.csv")
    df.to_csv(csv_path, index=False)
    print(f"Exported {table_name} to {csv_path}")

cursor.close()
conn.close()
