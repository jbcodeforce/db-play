import psycopg2
from config import config

def connect(db_cfg_name: str):
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        params = config(filename=db_cfg_name)
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        print("Connected to the PostgreSQL database")
        return cur, conn
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
        raise error
   
if __name__ == '__main__':
    cursor, conn = connect("local_db.ini")
    query = "select * from employees"
    cursor.execute(query)
    employees = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    print(f"Columns: {', '.join(column_names)}")
    print("-" * (len(', '.join(column_names)) + 15))
    if employees:
        for row in employees:
            print(row)
    else:
        print("No employee data found in the table.")
    cursor.close()
    conn.close()
    print("Connection closed, most likely local port forward is closed to with a reset by peer")
