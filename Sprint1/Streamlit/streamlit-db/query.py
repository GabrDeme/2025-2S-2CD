import mysql.connector
import pandas as pd

def connection(query):
    conn = mysql.connector.connect(
        host="127.0.0.1",
        port="3306",
        user="root",
        password="Senai@134",
        db="db_carro"
    )
    df = pd.read_sql(query, conn) # Ao executar uma busca no SQL e armazenar os dados em um dataframe

    conn.close() # Encerra uma consulta

    return df