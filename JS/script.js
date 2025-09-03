let slides = document.querySelectorAll(".slide");
let mudar = document.querySelectorAll(".mudar");

function showSlide(index) {
  slides.forEach((slide, i) => {
    slide.classList.toggle("active", i === index);
    mudar[i].classList.toggle("active", i === index);
  });
}
