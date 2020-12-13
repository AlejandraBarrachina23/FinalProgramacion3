
function ValidarRegistro() {

    const notificacionError = document.querySelectorAll('.Error');
    const tboxUsuario = document.getElementById('ContentPlaceHolder1_tboxUsuarioRegistro');
    const UsuarioRegistroError = document.getElementById('ContentPlaceHolder1_lblErrorRegistroUsuario');
    const tboxEmail = document.getElementById('ContentPlaceHolder1_tboxEmailRegistro');
    const EmailError = document.getElementById('ContentPlaceHolder1_lblErrorRegistroEmail');
    const tboxCelular = document.getElementById('ContentPlaceHolder1_tboxCelularRegistro');
    const CelularError = document.getElementById('ContentPlaceHolder1_lblErrorCelular');
    const tboxContrasenia = document.getElementById('ContentPlaceHolder1_tboxContraseniaRegistro');
    const ContraseniaError = document.getElementById('ContentPlaceHolder1_lblErrorPassword');
    const tboxContraseniaRepetida = document.getElementById('ContentPlaceHolder1_tboxRepetirContrasenia');
    const ConstraseniaRepetidaError = document.getElementById('ContentPlaceHolder1_lblErrorPasswordRepetida');

    let errores = 0;

    //LIMPIO LAS NOTIFICACIONES
    limpiarFormulario(notificacionError);

    //VALIDO CAMPOS VACIOS
    if (!validarTextBoxVacio(tboxUsuario, UsuarioRegistroError, 'Complete este campo')) errores++;
    if (!validarTextBoxVacio(tboxEmail, EmailError, 'Complete este campo')) errores++;
    if (!validarTextBoxVacio(tboxCelular, CelularError, 'Complete este campo')) errores++;
    if (!validarTextBoxVacio(tboxContrasenia, ContraseniaError, 'Complete este campo')) errores++;
    if (!validarTextBoxVacio(tboxContraseniaRepetida, ConstraseniaRepetidaError, 'Complete este campo')) errores++;

    //VALIDO QUE EL CAMPO USUARIO Y CONTRASEÑA NO TENGA MAS DE 20 CARACTERES
    if (!ValidarIntervalo(tboxContrasenia, 20, 10, ContraseniaError, "La contraseña debe contener de 10 a 20 caracteres"))  errores++; 
    if (!ValidarIntervalo(tboxUsuario, 20, 10, UsuarioRegistroError, "El nombre de usuario debe tener de 10 a 20 caracteres"))  errores++; 

    //VALIDO LONGITUD DEL CELULAR
    if (!longitudExacta(tboxCelular, 10, CelularError, 'El celular debe contener 10 caracteres')) errores++;

    //COMPARO CONTRASEÑAS
    if (!compararContrasenias(tboxContrasenia, tboxContraseniaRepetida, ConstraseniaRepetidaError, 'Las contraseñas no coinciden')) errores++;

    if (!ValidarMail(tboxEmail)) { EmailError.textContent = "El formato de mail ingresado es incorrecto"; errores++ }
    

    //SI HAY AUNQUE SEA UN ERROR, DEVUELVO FALSO.
    if (errores > 0) { return false; }
    else { return true; }
}

function ValidarInicioSesion() {

    const tboxUsuarioInicio = document.getElementById('ContentPlaceHolder1_tboxUsuarioInicio');
    const UsuarioInicioError = document.getElementById('ContentPlaceHolder1_lblErrorUsuarioInicio');
    const tboxConstraseniaInicio = documente.getElementById('ContentPlaceHolder1_tboxConstrasenia');
    const ContraseniaInicioError = document.getElementById('ContentPlaceHolder1_lblErrorContraseniaInicio');
    let errores = 0;

    //VALIDO CAMPOS VACIOS
    if (!validarTextBoxVacio(tboxUsuarioInicio, UsuarioInicioError, 'Complete este campo')) errores++;
    if (!validarTextBoxVacio(tboxConstraseniaInicio, ContraseniaInicioError, 'Complete este campo')) errores++;

    //SI HAY AUNQUE SEA UN ERROR, DEVUELVO FALSO.
    if (errores > 0) { return false; }
    else { return true; }
    
}

function ValidarIntervalo(tboxEvaluar, ValorMaximo, ValorMinimo, campo, mensajeError) {

    if (tboxEvaluar.value.length > ValorMaximo || tboxEvaluar.value.length < ValorMinimo) { campo.textContent = mensajeError; return false }
    else return true;
}

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

function longitudMaxima(tboxEvaluar, cantidadCaracteresPermitidos, campo, mensajeError) {

    if (tboxEvaluar.value.length > cantidadCaracteresPermitidos) { campo.textContent = mensajeError; return false }
    return true;
}

function compararContrasenias(contraseniaUno,contraseniaDos,campo,mensajeError) {

    if (contraseniaUno.value.toLowerCase() !== contraseniaDos.value.toLowerCase()) { campo.textContent = mensajeError; return false; }
    return true;
}

function longitudExacta(tboxEvaluar, cantidadCaracteresPermitidos, campo, mensajeError) {

    if (tboxEvaluar.value.length !== cantidadCaracteresPermitidos) { campo.textContent = mensajeError; return false }
    return true;
}

function ValidarMail(email) {

    var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email.value) ? true : false;
}


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