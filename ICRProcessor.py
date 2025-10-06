import requests
from PIL import Image
from io import BytesIO
import pytesseract

class ICRProcessor:
    def baixar_imagem(self, url):
        resp = requests.get(url)
        return Image.open(BytesIO(resp.content))

    def extrair_texto(self, img, lang="por"):
        return pytesseract.image_to_string(img, lang=lang)
