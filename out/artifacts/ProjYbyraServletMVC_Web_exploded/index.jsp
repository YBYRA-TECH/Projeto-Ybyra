<%--
  Created by IntelliJ IDEA.
  User: davioliveira-ieg
  Date: 07/10/2025
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="shortcut icon"
            href="./imgs/Nova logo Sem tech.png"
            type="image/x-icon"
    />
    <link rel="stylesheet" href="style.css" />
    <title>YBYRA TECH</title>
</head>
<body>
<header>
    <img
            src="./imgs/Nova logo.png"
            alt="Logo Ybyra Tech"
            style="width: 8.125rem;"
    />
    <a href="#sec3">Conheça o App</a>
    <a href="./cadastro.html">Cadastre-se</a>
    <button>
        <p>
            <a href="./login.html" style="color: aliceblue; font-size: 1rem"
            >Acesse a sua conta</a
            >
        </p>
    </button>
</header>

<main>
    <section class="sec_intro">
        <div id="texto_intro">
            <h1>
                ENTENDA.
                <br />
                APLIQUE
                <br />
                EVOLUA.
            </h1>
            <br />
            <a href="#sec_sobre" style="color: aliceblue"> Conheça a YBYRA Tech! →</a>
        </div>
        <div id="imagem_intro">
            <img
                    src="./imgs/Dois celulare 1Pa.png"
                    alt="Dois celulares mostrando o aplicativo"
                    style="width: 31.25rem; max-width: 90vw; height: auto"
            />
        </div>
    </section>

    <h1 id="titulo_resultados">Resultados com <br />Ybyra Tech</h1>
    <section class="sec_cartoes">
        <div>
            <div class="card">
                <span class="num_cartao">01.</span>
                <p class="texto_inicio">
                    Inclusão do chão de fábrica nos resultados da produção.
                </p>
                <p class="texto_fim">
                    Quando se está por dentro do que seu trabalho gera, você tende a
                    ter gosto pelo que faz.
                </p>
                <a class="link_cartao" href="#">Veja Mais →</a>
            </div>
        </div>
        <div>
            <div class="card">
                <span class="num_cartao">02.</span>
                <p class="texto_inicio">Acompanhe sua produção em tempo real sem atrasos.</p>
                <p class="texto_fim">
                    Nosso App ajuda você a ter uma visão abrangente de toda a
                    produção.
                </p>
                <a class="link_cartao" href="#">Saiba Mais →</a>
            </div>
        </div>
        <div>
            <div class="card">
                <span class="num_cartao">03.</span>
                <p class="texto_inicio">
                    Sugestões de melhoria baseadas nos seus resultados.
                </p>
                <p class="texto_fim">
                    Adicione mais um integrante ao seu brainstorming, a MelhoraAI te
                    ajuda a encontrar soluções para seus problemas!
                </p>
                <a class="link_cartao" href="#">Conheça já →</a>
            </div>
        </div>
    </section>

    <section id="sec3">
        <div class="sec3_content">
            <div class="sec3_slider">
                <input type="radio" name="steps" id="step1" checked />
                <input type="radio" name="steps" id="step2" />
                <input type="radio" name="steps" id="step3" />
                <input type="radio" name="steps" id="step4" />

                <div class="slides">
                    <div class="slide" data-step="1">
                        <img src="./imgs/Escaneia.png" alt="Escaneie a informação" />
                        <div class="slide-text">
                            <h1>Conheça o App</h1>
                            <h2>
                                1 -
                                <span
                                        style="
                        background: linear-gradient(
                          to right,
                          #5cdffb,
                          #3389ee,
                          #164de5
                        );
                        background-clip: text;
                        color: transparent;
                      "
                                >
                      Escaneie
                    </span>
                                a informação desejada
                            </h2>
                            <p>
                                A tecnologia ICR dispensa a necessidade de ter uma letra
                                bonita, ou de ser um documento já impresso anteriormente.
                            </p>
                        </div>
                    </div>

                    <div class="slide" data-step="2">
                        <img src="./imgs/Relatorios.png" alt="Relatórios" />
                        <div class="slide-text">
                            <h1>Conheça o App</h1>
                            <h2>
                                2 - Uma lista com todos os
                                <span
                                        style="
                        background: linear-gradient(to right, #174ee5, #5cdffb);
                        background-clip: text;
                        color: transparent;
                      "
                                >
                      índices analisados
                    </span>
                            </h2>
                            <p>
                                Deixa fácil a organização e visualização dos dados
                                analisados anteriormente, facilitando o seu dia.
                            </p>
                        </div>
                    </div>

                    <div class="slide" data-step="3">
                        <img src="./imgs/planilhia.png" alt="Planilhas" />
                        <div class="slide-text">
                            <h1>Conheça o App</h1>
                            <h2>
                                3 -
                                <span
                                        style="
                        background: linear-gradient(to right, #1f89ef, #0346a7);
                        background-clip: text;
                        color: transparent;
                      "
                                >
                      Resuma a planilha
                    </span>
                                em gráficos, e mais
                            </h2>
                            <p>
                                Veja a mesma planilha de outra forma, visualize o desempenho
                                em tempo real, e as causas dos problemas.
                            </p>
                        </div>
                    </div>

                    <div class="slide" data-step="4">
                        <img src="./imgs/Melhora ai.png" alt="Melhora AI" />
                        <div class="slide-text">
                            <h1>Conheça o App</h1>
                            <h2>
                                4 - Converse agora com
                                <span
                                        style="
                        background: linear-gradient(to right, #0246a7, #5cdffb);
                        background-clip: text;
                        color: transparent;
                      "
                                >
                      a nossa IA!
                    </span>
                            </h2>
                            <p>
                                Adicione mais um integrante ao seu brainstorm com a
                                MelhoraAI, IA que te dá possíveis soluções aos seus
                                problemas.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="sec3_controls">
                    <label for="step1" class="dot" aria-label="Passo 1"></label>
                    <label for="step2" class="dot" aria-label="Passo 2"></label>
                    <label for="step3" class="dot" aria-label="Passo 3"></label>
                    <label for="step4" class="dot" aria-label="Passo 4"></label>
                </div>
            </div>
        </div>
    </section>

    <section id="sec4">
        <div class="texto">
            <h1>Perguntas</h1>
            <div class="textoP">
                <p>Por que usar Ybyra Tech?</p>
                <hr />
                <p>Onde nos encontrar</p>
                <hr />
                <p>Funcionamento do Aplicativo</p>
                <hr />
                <p>Onde nos encontrar</p>
                <hr />
            </div>
        </div>
        <img
                src="./imgs/dundo sec4.png"
                alt=""
                style="width: 50rem; max-width: 95vw; height: auto"
                id="sec4Im"
        />
    </section>
    <div id="imagem_decorativa"></div>

    <section id="sec_sobre">
        <h1 id="titulo_sobre">Sobre Nós</h1>
        <div id="cartoes_sobre">
            <div class="card_sobre" style="background-color: white;background-image: url('./imgs/missao.png'); background-repeat: no-repeat; background-position: 0.5rem 22rem;background-size: 102%;">
                <h1 class="titulo_card">Nossa Missão</h1>
                <p>
                    Queremos impulsionar o processo produtivo industrial através de
                    <strong>análises avançadas de dados</strong> de uma forma mais
                    simples e objetiva, ajudando a
                    <strong>entender a eficiência em cada setor</strong> e a
                    <strong>pontuar os gargalos que atrapalham a qualidade</strong> do
                    trabalho.
                </p>
            </div>

            <div class="card_sobre" style="background-color: white;">
                <h1 class="titulo_card">Quem Somos</h1>
                <p>
                    Nossa Equipe é formada por 7 pessoas, alunos do curso de
                    programação do Instituto J&F. Este projeto foi fundamentado a
                    partir de dores reais que as indústrias enfrentam hoje em dia em
                    diversas áreas de atuações. Fizemos pesquisas de campo, e online,
                    e assim surgiu a Ybyra Tech, que visa otimizar a organização de
                    arquivos e documentos importantes, ajudando no entendimento e na
                    manipulação deles.
                </p>
            </div>

            <div class="card_sobre" style="margin-right: 3.5rem;background-color: white;padding: 1.3rem;background-image: url('./imgs/valores.png'); background-repeat: no-repeat; background-position: 8.5rem 19rem;background-size: 70%;">
                <h1 class="titulo_card">Nossos Valores</h1>
                <p>
                    Prezamos pela simplicidade, um valor importantíssimo para uma
                    comunicação assertiva e entendível.<br />
                    Disponibilidade é outro valor que prezamos, a vontade de fazer e o
                    gosto pelo trabalho é de suma importância para uma qualidade de
                    trabalho boa.
                </p>
            </div>
        </div>
    </section>
</main>

<footer>
    <div>
        <section class="col1">
            <h3>Sobre Nós</h3>
            <p>Funcionalidades do App</p>
            <p>Nossa Equipe</p>
        </section>

        <section class="col2">
            <h3>Contato</h3>
            <p>ybyratech@gmail.com</p>
            <p>+55 (11) 97710-6126</p>
        </section>

        <section class="col3">
            <h3>Redes</h3>
            <p>Instagram: @ybyra_ofc</p>
            <p>LinkedIn: @ybyratech</p>
        </section>
    </div>
    <p class="direitos">TODOS OS DIREITOS RESERVADOS YBYRA TECH © 2025</p>
</footer>
</body>
</html>