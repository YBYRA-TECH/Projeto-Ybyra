import requests
from io import BytesIO

class CloudGateUploader:
    def __init__(self, api_url):
        self.api_url = api_url

    def upload_imagem_bytes(self, imagem_bytes, filename="imagem.png"):
        files = {'file': (filename, BytesIO(imagem_bytes), 'image/png')}
        response = requests.post(self.api_url, files=files)
        if response.status_code == 200:
            url = response.json().get("url")  # Ajustar conforme API real
            return url
        else:
            raise Exception(f"Erro no upload: {response.status_code} {response.text}")
