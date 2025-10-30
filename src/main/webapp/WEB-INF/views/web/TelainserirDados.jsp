<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/imgs/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/globalApp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/TelaInserirDados.css" />
    <title>YBYRA TECH</title>
</head>

<body>
<div class="painel-principal">
    <aside class="barra-lateral">
        <input type="checkbox" id="menu">
        <label for="menu" class="menu-icon">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <label for="menu-icon" class="logo-logo">
            <img src="<%= request.getContextPath() %>/assets/imgs/Nova%20logo.png" alt="Logo YBYRA TECH" id="logo" />
        </label>

        <nav class="menu-principal">
            <ul>
                <li class="item-menu ativo">
                    <a href="<%= request.getContextPath() %>/pagina?nome=inicioBI">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/House.png" alt="Ícone Início" />
                        </div>
                        <span>Início</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=relatorios">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/document.png" alt="Ícone relatorios" />
                        </div>
                        <span>Relatórios</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=tarefas">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/clipboard.png" alt="Ícone Tarefas" />
                        </div>
                        <span>Tarefas</span>
                    </a>
                </li>

                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=insercaoDados">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/camera_insercao.png" alt="Ícone Inserir Dados">
                        </div>
                        <span>Inserir Dados</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=funcionarios">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_funcionario.png" alt="Ícone Funcionários" />
                        </div>
                        <span>Funcionários</span>
                    </a>
                </li>
                <li class="item-menu">
                    <a href="<%= request.getContextPath() %>/pagina?nome=perfil">
                        <div class="box-icone">
                            <img src="<%= request.getContextPath() %>/assets/imgs/icone_usuario.png" alt="Ícone Perfil" />
                        </div>
                        <span>Perfil</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>


    <main class="area-conteudo">
        <div class="conteudo-principal-header">
            <div class="area">
                <a href="<%= request.getContextPath() %>/pagina?nome=insercaoDados">
                    <img src="<%= request.getContextPath() %>/assets/imgs/voltar.png" alt="voltar" id="voltar">
                </a>
                <div class="area-icones">
                    <input type="checkbox" id="menu-notificacoes">
                    <label for="menu-notificacoes">
                        <img src="<%= request.getContextPath() %>/assets/imgs/notificacoes.png" alt="Notificações">
                    </label>
                    <div id="notificacoes">
                        <h1>Notificações</h1>
                        <div>Murilo adicionou uma tarefa</div>
                        <div>Guilherme concluiu uma tarefa</div>
                        <div>Emilly concluiu uma tarefa</div>
                    </div>
                </div>
            </div>
        </div>

        <section class="detalhes-upload-painel">

            <h2 class="titulo-secao">Arquivo escolhido</h2>

            <div class="arquivo-preview">
                <img src="<%= request.getContextPath() %>/assets/imgs/imagem_modelo_arquivo.jpg" alt="Pré-visualização do Controle de Produção" class="preview-img">
            </div>

            <form action="<%= request.getContextPath() %>/InsercaoDados" method="post">
                <div class="formulario-detalhes">

                    <div class="area-detalhes">
                        <h3 class="subtitulo-secao">Detalhes</h3>

                        <div class="campo">
                            <label for="nome-arquivo">Nome do arquivo</label>
                            <input type="text" id="nome-arquivo" name="nome" value="" placeholder="Digite o nome do arquivo">
                        </div>

                        <div class="campo">
                            <label for="titulo">Título</label>
                            <input type="text" id="titulo" name="titulo" value="" placeholder="Digite o titulo">
                        </div>

                        <div class="campo">
                            <label for="categoria">Categoria</label>
                            <input type="text" id="categoria" name="area" value="" placeholder="Digite a categoria">
                        </div>
                    </div>

                    <div class="area-descricao">
                        <h3 class="subtitulo-secao">Descrição</h3>
                        <h3 style="opacity: 0;">Espaço</h3>
                        <textarea name="descricao" class="texto-descricao" placeholder="coloque aqui a descrição do arquivo"></textarea>

                        <input type="hidden" name="pdf" value="<%= session.getAttribute("arquivoNome") != null ? session.getAttribute("arquivoNome") : "" %>">

                        <button type="submit" class="btn-enviar">Enviar Arquivo</button>
                    </div>
                </div>
            </form>
        </section>
    </main>
</div>
<!--
<script>
    window.addEventListener('DOMContentLoaded', () => {
        const arquivoNome = localStorage.getItem('arquivoNome');
        const arquivoBase64 = localStorage.getItem('arquivoBase64');
        const dadosProcessados = localStorage.getItem('dadosProcessados');

        // Mostra a imagem ou PDF
        if (arquivoBase64) {
            const previewContainer = document.querySelector('.arquivo-preview');
            const preview = document.querySelector('.preview-img');

            // Se for PDF, mostra o PDF real no lugar da imagem
            if (arquivoNome.toLowerCase().endsWith('.pdf')) {
                // Cria um elemento <embed> para visualizar o PDF
                const pdfViewer = document.createElement('embed');
                pdfViewer.src = arquivoBase64;
                pdfViewer.type = 'application/pdf';
                pdfViewer.style.width = '100%';
                pdfViewer.style.height = '500px';
                pdfViewer.style.borderRadius = '10px';
                pdfViewer.style.border = '1px solid #ccc';

                // Limpa a imagem antiga e insere o visualizador
                previewContainer.innerHTML = '';
                previewContainer.appendChild(pdfViewer);
            } else {
                // Mantém o comportamento original para imagens
                preview.src = arquivoBase64;
                preview.alt = arquivoNome;
            }
        }

        // Preenche campos automáticos
        if (dadosProcessados) {
            try {
                const dados = JSON.parse(dadosProcessados);
                console.log('📄 Dados carregados:', dados);

                document.getElementById('titulo').value = dados.titulo || arquivoNome || '';
                document.getElementById('categoria').value = dados.categoria || '';
                document.getElementById('prioridade').value = dados.prioridade || '';
                document.querySelector('.texto-descricao').value = JSON.stringify(dados, null, 2);
            } catch (e) {
                console.error('Erro ao interpretar dados processados:', e);
            }
        }
    });
</script>
-->

</body>

</html>