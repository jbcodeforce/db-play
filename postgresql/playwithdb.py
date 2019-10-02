import psycopg2
from config import config

def connect():
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters
        params = config()
 
        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
      
        # create a cursor
        cur = conn.cursor()
        
   # execute a statement
        print('PostgreSQL database version:')
        cur.execute('SELECT version()')
 
        # display the PostgreSQL database server version
        db_version = cur.fetchone()
        print(db_version)
       
       # close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')
 
def addRecord(id,name):
    sql = """INSERT INTO suppliers(supplier_id,name,status)
             VALUES(%s,%s,1) RETURNING supplier_id;"""
    conn = None
    supplier_id = None
    try:
        # read database configuration
        params = config()
        # connect to the PostgreSQL database
        conn = psycopg2.connect(**params)
        # create a new cursor
        cur = conn.cursor()
        # execute the INSERT statement
        cur.execute(sql, (id,name,))
        # get the generated id back
        supplier_id = cur.fetchone()[0]
        # commit the changes to the database
        conn.commit()
        # close communication with the database
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

def queryRecords():
    sql = "SELECT * FROM suppliers ORDER BY name;"
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(sql)
        print("The number of rows: ", cur.rowcount)
        row = cur.fetchone()
        while row is not None:
            print(row)
            row = cur.fetchone()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

def updateRecord(id,name):
    sql = "UPDATE suppliers SET name = %s WHERE supplier_id = %s"
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(sql,(name,id))
        updated_rows = cur.rowcount
        conn.commit()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
        
if __name__ == '__main__':
    connect()
    # addRecord("1","toto")
    # addRecord("2","tata")
    queryRecords()
    updateRecord("2","titi")
    queryRecords()