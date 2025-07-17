import re

def validar_nome(nome):
    return bool(re.fullmatch(r'[A-Za-zÀ-ÿ ]{3,}', nome.strip()))

def validar_cpf(cpf):
    return bool(re.fullmatch(r'\d{3}\.\d{3}\.\d{3}-\d{2}', cpf))

def validar_email(email):
    return bool(re.fullmatch(r'[\w\.-]+@[\w\.-]+\.\w{2,}', email))

def validar_cep(cep):
    return bool(re.fullmatch(r'\d{5}-\d{3}', cep))

def validar_data_nascimento(data):
    return bool(re.fullmatch(r'\d{2}/\d{2}/\d{4}', data))