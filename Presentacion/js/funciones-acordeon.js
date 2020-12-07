document.querySelectorAll('.pregunta').forEach(button => {

    button.addEventListener('click', () => {

        const respuesta = button.nextElementSibling;
        button.classList.toggle('pregunta--active');
        if (button.classList.contains('pregunta--active')) {

            respuesta.style.maxHeight = "100%";
        }
        else {

            respuesta.style.maxHeight = "0px";
        }
    });
});