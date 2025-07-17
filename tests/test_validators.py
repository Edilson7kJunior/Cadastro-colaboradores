import unittest
from validators import *

class TestValidadores(unittest.TestCase):
    def test_nome(self):
        self.assertTrue(validar_nome("João Silva"))
        self.assertFalse(validar_nome("J"))

    def test_cpf(self):
        self.assertTrue(validar_cpf("123.456.789-09"))
        self.assertFalse(validar_cpf("12345678909"))

    def test_email(self):
        self.assertTrue(validar_email("teste@dominio.com"))
        self.assertFalse(validar_email("teste@@dominio"))

    def test_cep(self):
        self.assertTrue(validar_cep("12345-678"))
        self.assertFalse(validar_cep("12345678"))

    def test_data_nascimento(self):
        self.assertTrue(validar_data_nascimento("01/01/2000"))
        self.assertFalse(validar_data_nascimento("01-01-2000"))

if __name__ == '__main__':
    unittest.main()