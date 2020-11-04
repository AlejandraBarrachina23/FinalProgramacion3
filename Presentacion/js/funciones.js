
const botonHamburguesa = document.querySelector("#btn-responsive");
botonHamburguesa.addEventListener('click',mostrarDiv);
desplegarRespuesta();

function mostrarDiv(){
   
    const menu = document.querySelector(".menu");
    menu.classList.toggle('mostrar-barra');
}

function desplegarRespuesta(){
   
    const preguntas = document.querySelectorAll(".pregunta");
    preguntas.forEach(unaPregunta => {
        unaPregunta.addEventListener('click',  () => {
            unaPregunta.classList.toggle('desplegar');
        });
    });

}


