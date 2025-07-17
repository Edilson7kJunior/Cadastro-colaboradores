from validators import validar_nome, validar_cpf, validar_email, validar_cep, validar_data_nascimento
from cep_api import buscar_endereco
from db import inserir_colaborador
from logger import registrar_log

def cadastrar_colaborador():
    try:
        nome = input("Nome completo: ")
        cpf = input("CPF (000.000.000-00): ")
        email = input("E-mail: ")
        cep = input("CEP (00000-000): ")
        data_nascimento = input("Data de nascimento (dd/mm/aaaa): ")

        if not validar_nome(nome): raise ValueError("Nome inválido.")
        if not validar_cpf(cpf): raise ValueError("CPF inválido.")
        if not validar_email(email): raise ValueError("Email inválido.")
        if not validar_cep(cep): raise ValueError("CEP inválido.")
        if not validar_data_nascimento(data_nascimento): raise ValueError("Data de nascimento inválida.")

        endereco = buscar_endereco(cep)
        if not endereco: raise ValueError("CEP não encontrado.")

        colaborador = {
            "nome": nome,
            "cpf": cpf,
            "email": email,
            "cep": cep,
            "data_nascimento": data_nascimento,
            "logradouro": endereco["logradouro"],
            "bairro": endereco["bairro"],
            "cidade": endereco["localidade"],
            "uf": endereco["uf"]
        }

        inserir_colaborador(colaborador)
        registrar_log(f"Colaborador inserido: {colaborador}")
        print("Colaborador cadastrado com sucesso!")

    except Exception as e:
        registrar_log(f"Erro ao cadastrar colaborador: {e}")
        print("Erro:", e)

if __name__ == "__main__":
    cadastrar_colaborador()