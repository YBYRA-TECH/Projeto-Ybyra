// JS/script.js
const slides = [...document.querySelectorAll('.slide')];
const dots = [...document.querySelectorAll('.dot')];

function go(i) {
  slides.forEach((el, idx) => el.classList.toggle('on', idx === i));
  dots.forEach((el, idx) => el.classList.toggle('on', idx === i));
}

dots.forEach(d => d.addEventListener('click', e => go(+e.currentTarget.dataset.i)));
go(0);
