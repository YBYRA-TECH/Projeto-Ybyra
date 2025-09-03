document.addEventListener("DOMContentLoaded", function () {
  let slides = document.querySelectorAll(".sec3Slide");
  let mudar = document.querySelectorAll(".sec3NavButton");

  window.showSlide = function (index) {
    slides.forEach((slide, i) => {
      slide.classList.toggle("active", i === index);
      if (mudar[i]) mudar[i].classList.toggle("active", i === index);
    });
  };
});
