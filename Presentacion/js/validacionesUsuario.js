function mostrarOcultarPassword() {

    const iconos = document.querySelectorAll('.mostrar');
    const listadoIconos = Array.from(iconos);

    listadoIconos.forEach(item => {

        item.addEventListener('click', function () {

            (item.previousElementSibling.type == 'text') ? item.previousElementSibling.type = 'password' : item.previousElementSibling.type = 'text';

        });
    });
}

mostrarOcultarPassword();

function validarTextBoxVacio(textBox, campo, mensajeError) {

    if (textBox.value == "") { campo.textContent = mensajeError; return false }
    return true;
}

function ValidarMail(email) {

    var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email.value) ? true : false;
}

function longitudExacta(tboxEvaluar, cantidadCaracteresPermitidos, campo, mensajeError) {

    if (tboxEvaluar.value.length !== cantidadCaracteresPermitidos) { campo.textContent = mensajeError; return false }
    return true;
}


function ValidarIntervalo(tboxEvaluar, ValorMaximo, ValorMinimo, campo, mensajeError) {

    if (tboxEvaluar.value.length > ValorMaximo || tboxEvaluar.value.length < ValorMinimo) { campo.textContent = mensajeError; return false }
    else return true;
}

function compararContrasenias(contraseniaUno, contraseniaDos, campo, mensajeError) {

    if (contraseniaUno.value.toLowerCase() !== contraseniaDos.value.toLowerCase()) { campo.textContent = mensajeError; return false; }
    return true;
}

function limpiarFormulario(etiquetas) {

    const NuevoItem = Array.from(etiquetas);

    NuevoItem.forEach(item => {

        item.textContent = "";
    });
}

function ValidarUsuario() {

    const lblErrores = document.querySelectorAll('.Error');
    limpiarFormulario(lblErrores);

    let errores = 0;
    const tboxNombre = document.getElementById('ContentPlaceHolder1_tboxNombre');
    const tboxApellido = document.getElementById('ContentPlaceHolder1_tboxApellido');
    const tboxEmail = document.getElementById('ContentPlaceHolder1_tboxEmail');
    const tboxCelular = document.getElementById('ContentPlaceHolder1_tboxCelular');
    const tboxContrasenia = document.getElementById('ContentPlaceHolder1_tboxConstrasenia');
    const tboxRepetirContrasenia = document.getElementById('ContentPlaceHolder1_tboxRepetirContrasenia');

    const lblErorNombre = document.getElementById('ContentPlaceHolder1_lblErrorNombre');
    const lblErrorApellido = document.getElementById('ContentPlaceHolder1_lblErrorApellido');
    const lblErrorEmail = document.getElementById('ContentPlaceHolder1_lblErrorEmail');
    const lblErrorCelular = document.getElementById('ContentPlaceHolder1_lblErrorCelular');
    const lblErrorContrasenia = document.getElementById('ContentPlaceHolder1_lblErrorContrasenia');
    const lblErrorContraseniaRepetida = document.getElementById('ContentPlaceHolder1_lblErrorContraseniaRepetir');

    if (!validarTextBoxVacio(tboxNombre, lblErorNombre, "Complete este campo")) errores++;
    if (!validarTextBoxVacio(tboxApellido, lblErrorApellido, "Complete este campo")) errores++;
    if (!validarTextBoxVacio(tboxEmail, lblErrorEmail, "Complete este campo")) errores++;
    if (!validarTextBoxVacio(tboxCelular, lblErrorCelular, "Complete este campo")) errores++;
    if (!validarTextBoxVacio(tboxContrasenia, lblErrorContrasenia, "Complete este campo")) errores++;
    if (!validarTextBoxVacio(tboxRepetirContrasenia, lblErrorContraseniaRepetida, "Complete este campo")) errores++;
    if (!ValidarMail(tboxEmail)) { errores++; lblErrorEmail.textContent = "El formato de mail ingresado no es válido" }
    if (!longitudExacta(tboxCelular, 10, lblErrorCelular, "El celular debe contener 10 dígitos")) errores++;
    if (!ValidarIntervalo(tboxContrasenia, 20, 10, lblErrorContrasenia, "La contraseña debe contener de 10 a 20 caracteres")) errores++;
    if (!ValidarIntervalo(tboxRepetirContrasenia, 20, 10, lblErrorContraseniaRepetida, "La contraseña debe contener de 10 a 20 caracteres")) errores++;
    if (!compararContrasenias(tboxContrasenia, tboxRepetirContrasenia, lblErrorContraseniaRepetida, "Las contraseñas ingresadas no coinciden")) errores++;

    if (errores !== 0) return false;
    else return true;
}