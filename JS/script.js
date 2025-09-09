let ultimoScroll = 0;                // guarda a posição anterior
const header = document.querySelector('header');

window.addEventListener('scroll', () => {
  const scrollAtual = window.scrollY;          // pega a posição atual doz scroll
  if(scrollAtual > ultimoScroll) {             // se rolou pra baixo
    header.style.top = '-60px';               // esconde o header
  } else {                                     // se rolou pra cima
    header.style.top = '0';                   // mostra o header
  }
  ultimoScroll = scrollAtual;                 // atualiza a posição anterior
});