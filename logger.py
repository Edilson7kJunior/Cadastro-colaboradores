from datetime import datetime

def registrar_log(mensagem):
    with open("logs.txt", "a") as log_file:
        log_file.write(f"[{datetime.now()}] {mensagem}\n")