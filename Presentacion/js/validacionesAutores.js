function validarTextBoxVacio(textBox, campo, mensajeError) {

    if (textBox.value == "") { campo.textContent = mensajeError; return false }
    return true;
}

function limpiarFormulario(etiquetas) {

    const NuevoItem = Array.from(etiquetas);

    NuevoItem.forEach(item => {

        item.textContent = "";
    });
}

function longitudExacta(tboxEvaluar, cantidadCaracteresPermitidos, campo, mensajeError) {

    if (tboxEvaluar.value.length !== cantidadCaracteresPermitidos) { campo.textContent = mensajeError; return false }
    return true;
}

function ValidarMail(email) {

    var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email.value) ? true : false;
}

function ValidarAutores() {

    let errores = 0;

    //LIMPIAR ERRORES
    const listadoErrores = document.querySelectorAll('.Error');
    limpiarFormulario(listadoErrores);

    //INPUTS A VALIDAR
    const tboxNombre = document.getElementById('ContentPlaceHolder1_tboxNombre');
    const tboxCelular = document.getElementById('ContentPlaceHolder1_tboxCelular');
    const tboxEmail = document.getElementById('ContentPlaceHolder1_tboxEmail');

    ///CAMPO ERRORES
    const errorNombre = document.getElementById('ContentPlaceHolder1_lblErrorNombreAutor');
    const errorCelular = document.getElementById('ContentPlaceHolder1_lblErrorCelular');
    const errorEmail = document.getElementById('ContentPlaceHolder1_lblErrorEmail');

    ///VALIDACIONES
    if (!validarTextBoxVacio(tboxNombre, errorNombre, "El campo esta vacio")) errores++;
    if (!validarTextBoxVacio(tboxCelular, errorCelular, "El campo esta vacio")) errores++;
    if (!validarTextBoxVacio(tboxEmail, errorEmail, "El campo esta vacio")) errores++;
    if (!longitudExacta(tboxCelular, 10, errorCelular, "El celular debe tener 10 caracteres")) errores++;
    if (!ValidarMail(tboxEmail)) { errores++; errorEmail.textContent = "Formato de email inválido." }

    if (errores !== 0) return false;
    else return true;
}