import requests
from logger import registrar_log

def buscar_endereco(cep):
    try:
        response = requests.get(f'https://viacep.com.br/ws/{cep}/json/')
        if response.status_code == 200 and 'erro' not in response.json():
            return response.json()
        return None
    except Exception as e:
        registrar_log(f"Erro na consulta ViaCEP: {e}")
        return None