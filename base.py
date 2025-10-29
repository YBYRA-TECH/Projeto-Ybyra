import os
import io
import json
from flask import Flask, request, jsonify
from flask_cors import CORS
from PIL import Image
import pytesseract
from PyPDF2 import PdfReader
from langchain_google_genai import ChatGoogleGenerativeAI

# Configuração da API
API_KEY = "AIzaSyBrW6eYlLMapokI_eaa8aBlVz_76XjmrhU"

# Inicializar LLM do LangChain
llm = ChatGoogleGenerativeAI(
    model="gemini-2.5-flash",
    temperature=0, 
    google_api_key=API_KEY,
)

# Inicializar Flask
app = Flask(__name__)
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024  # Limite de 16MB

# Habilitar CORS para permitir requisições do frontend
CORS(app, resources={r"/*": {"origins": "*"}})

def extrair_texto_pdf(arquivo_bytes):
    """
    Extrai texto de um PDF a partir de bytes
    """
    texto = ""
    try:
        reader = PdfReader(io.BytesIO(arquivo_bytes))
        for page in reader.pages:
            texto += page.extract_text() + "\n"
    except Exception as e:
        raise Exception(f"Erro ao extrair texto do PDF: {str(e)}")
    return texto

def extrair_texto_imagem(arquivo_bytes):
    """
    Extrai texto de uma imagem usando OCR
    """
    try:
        imagem = Image.open(io.BytesIO(arquivo_bytes))
        texto = pytesseract.image_to_string(imagem, lang="por")
    except Exception as e:
        raise Exception(f"Erro ao extrair texto da imagem: {str(e)}")
    return texto

def extrair_dados_com_gemini(texto):
    """
    Extrai dados estruturados do texto usando Gemini AI via LangChain
    """
    prompt = f"""Analise o texto abaixo e retorne os dados em JSON estruturado.

IMPORTANTE: Retorne APENAS o JSON, sem markdown, sem texto adicional, sem ```json.

Exemplo de saída:
[
  {{
    "nome": "...",
    "data": "...",
    "valor": "..."
  }}
]

Texto:
{texto}"""
    
    try:
        # Usar llm.invoke() do LangChain
        response = llm.invoke(prompt)
        
        # Extrair o conteúdo da resposta
        conteudo = ""
        if hasattr(response, 'content'):
            conteudo = response.content
        else:
            conteudo = str(response)
        
        # Limpar markdown code blocks se existirem
        conteudo = conteudo.strip()
        if conteudo.startswith('```json'):
            conteudo = conteudo.replace('```json', '').replace('```', '').strip()
        elif conteudo.startswith('```'):
            conteudo = conteudo.replace('```', '').strip()
        
        return conteudo
        
    except Exception as e:
        raise Exception(f"Erro ao processar com Gemini: {str(e)}")

@app.route('/health', methods=['GET'])
def health_check():
    """
    Rota para verificar se a API está funcionando
    """
    return jsonify({"status": "OK", "message": "API está funcionando"}), 200

@app.route('/processar-documento', methods=['POST'])
def processar_documento():
    """
    Rota para processar documentos PDF e extrair dados estruturados
    """
    try:
        # Verificar se há arquivo na requisição
        if 'arquivo' not in request.files:
            return jsonify({"erro": "Nenhum arquivo enviado"}), 400
        
        arquivo = request.files['arquivo']
        
        # Verificar se o arquivo foi selecionado
        if arquivo.filename == '':
            return jsonify({"erro": "Nenhum arquivo selecionado"}), 400
        
        # Ler o conteúdo do arquivo
        arquivo_bytes = arquivo.read()
        nome_arquivo = arquivo.filename
        
        # Extrair texto conforme o tipo de arquivo
        if nome_arquivo.lower().endswith('.pdf'):
            texto = extrair_texto_pdf(arquivo_bytes)
        elif nome_arquivo.lower().endswith(('.png', '.jpg', '.jpeg', '.gif', '.bmp')):
            texto = extrair_texto_imagem(arquivo_bytes)
        else:
            return jsonify({
                "erro": "Formato de arquivo não suportado. Use PDF ou imagens (PNG, JPG, JPEG, GIF, BMP)"
            }), 400
        
        # Verificar se o texto foi extraído
        if not texto.strip():
            return jsonify({
                "erro": "Não foi possível extrair texto do documento"
            }), 400
        
        # Processar com Gemini
        resultado_json = extrair_dados_com_gemini(texto)
        
        # Retornar resultado
        return jsonify({
            "status": "sucesso",
            "arquivo": nome_arquivo,
            "texto_extraido": texto[:500] + "..." if len(texto) > 500 else texto,
            "dados_estruturados": resultado_json
        }), 200
        
    except Exception as e:
        return jsonify({
            "erro": str(e)
        }), 500

@app.route('/HTML/insercaoDados.html', methods=['GET'])
def index():
    """
    Página inicial com informações da API
    """
    return jsonify({
        "nome": "API de Extração de Dados",
        "versao": "1.0",
        "descricao": "API para extrair e processar dados de documentos PDF e imagens",
        "endpoints": {
            "GET /": "Informações da API",
            "GET /health": "Verificar status da API",
            "POST /processar-documento": "Processar documento e extrair dados estruturados"
        }
    }), 200

if __name__ == "__main__":
    # Executar a API
    app.run(debug=True, host='0.0.0.0', port=5000)