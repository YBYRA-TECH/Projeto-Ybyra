import psycopg2

class BancoPostgres:
    def __init__(self, host, dbname, user, password):
        self.host = host
        self.dbname = dbname
        self.user = user
        self.password = password

    def salvar_url(self, nome, url):
        conn = None
        cur = None
        try:
            conn = psycopg2.connect(
                host=self.host,
                dbname=self.dbname,
                user=self.user,
                password=self.password
            )
            sql = "INSERT INTO imagens (nome, caminho) VALUES (%s, %s)"
            cur = conn.cursor()
            cur.execute(sql, (nome, url))
            conn.commit()
            print("URL salva com sucesso!")
        except psycopg2.DatabaseError as e:
            print("Erro ao salvar URL:", e)
        finally:
            if cur:
                cur.close()
            if conn:
                conn.close()

# Exemplo de uso
if __name__ == "__main__":
    db = BancoPostgres("localhost", "sua_base", "seu_usuario", "sua_senha")
    nome_imagem = "foto1"
    url_imagem = "https://cloudgate-app.com/imagens/foto1.png"
    db.salvar_url(nome_imagem, url_imagem)
