const config = {
    type: 'loop',
    perPage: 3,
    breakpoints: {
        768: {
            perPage: 2
        },

    }
}

new Splide('.splide', config).mount();

const botonHamburguesa = document.querySelector("#btn-responsive");
botonHamburguesa.addEventListener('click', mostrarDiv);


function mostrarDiv() {

    const menu = document.querySelector(".menu");
    menu.classList.toggle('mostrar-barra');
}



let slider = document.querySelector('.testimoniales');
let sliderIndividual = document.querySelectorAll('.testimoniales-item');
let contador = 1;
let tamanio = sliderIndividual[0].clientWidth; //<- toma el tamaño
let intervalo = 3000;

setInterval(function tiempo() {

    slides();

}, intervalo)


function slides() {

    slider.style.transform = 'translate(' + (- tamanio * contador) + 'px'
    slider.style.transition = 'transform 1s'
    contador++;

    if (contador === sliderIndividual.length) {
        contador = 0;

        setTimeout(function () {

            slider.style.transform = 'translate(0px)';
            slider.style.transition = 'transform 0s';
        }, intervalo)

    }
}



