import random
import string
import random

def gera_letras(size=6, chars=string.ascii_lowercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

letras = gera_letras()

def createEmail():
    print(str(random.randint(0,99999999)) + letras + "@123.com")

createEmail()