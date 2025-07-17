import sqlite3

conn = sqlite3.connect("colaboradores.db")
cursor = conn.cursor()

cursor.execute('''
CREATE TABLE IF NOT EXISTS colaboradores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    cpf TEXT,
    email TEXT,
    cep TEXT,
    data_nascimento TEXT,
    logradouro TEXT,
    bairro TEXT,
    cidade TEXT,
    uf TEXT
)
''')
conn.commit()

def inserir_colaborador(colab):
    cursor.execute('''
    INSERT INTO colaboradores (nome, cpf, email, cep, data_nascimento, logradouro, bairro, cidade, uf)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', (colab['nome'], colab['cpf'], colab['email'], colab['cep'], colab['data_nascimento'],
          colab['logradouro'], colab['bairro'], colab['cidade'], colab['uf']))
    conn.commit()