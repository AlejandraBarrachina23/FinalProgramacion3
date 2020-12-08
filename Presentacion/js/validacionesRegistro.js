
function ValidarRegistro() {

    //LIMPIO LABELS

    const notificacionError = document.querySelectorAll('.Error');
    const NuevoItem = Array.from(notificacionError);
 
    NuevoItem.forEach(item => {


        item.textContent = "";
  
         
    });


    //VALIDACIONES
    let errores = 0;
    let tboxUsuario = document.getElementById('ContentPlaceHolder1_tboxUsuarioRegistro').value;
    let tboxEmail = document.getElementById('ContentPlaceHolder1_tboxEmailRegistro').value;
    let tboxCelular = document.getElementById('ContentPlaceHolder1_tboxCelularRegistro').value;
    let tboxContrasenia = document.getElementById('ContentPlaceHolder1_tboxContraseniaRegistro').value;
    let tboxContraseniaRepetida = document.getElementById('ContentPlaceHolder1_tboxRepetirContrasenia').value;

    //VALIDO CAMPOS VACIOS

    function validarTextBox(textBox, campo) {

        if (textBox == "") { campo.textContent = 'Complete este campo'; errores++; }
    }

    //VALIDO LA LONGITUD DEL NOMBRE DE USUARIO

    function longitudPermitida(tboxEvaluar, cantidadCaracteresPermitidos, campo) {

        if (tboxEvaluar.length > cantidadCaracteresPermitidos) { campo.textContent = 'Máximo de caracterese excedido'; errores++ }

    }

    //VALIDO QUE LAS CONSTRASEÑAS COINCIDAN
    function compararContrasenias(campo) {

        if (tboxContrasenia.toLowerCase() !== tboxContraseniaRepetida.toLowerCase()) { campo.textContent = 'Las contraseñas no coinciden'; errores++ }
    }

    //VALIDO LONGITUD DEL CELULAR
    function longitudCelular(tboxEvaluar, cantidadCaracteresPermitidos, campo) {

        if (tboxEvaluar.length !== cantidadCaracteresPermitidos) { campo.textContent = 'El celular debe tener 10 digitos'; errores++ }
    }

    validarTextBox(tboxUsuario, document.getElementById('ContentPlaceHolder1_lblErrorRegistroUsuario'));
    validarTextBox(tboxEmail, document.getElementById('ContentPlaceHolder1_lblErrorRegistroEmail'));
    validarTextBox(tboxCelular, document.getElementById('ContentPlaceHolder1_lblErrorCelular'));
    validarTextBox(tboxContrasenia, document.getElementById('ContentPlaceHolder1_lblErrorPassword'));
    validarTextBox(tboxContraseniaRepetida, document.getElementById('ContentPlaceHolder1_lblErrorPasswordRepetida'));

    longitudPermitida(tboxUsuario, 20, document.getElementById('ContentPlaceHolder1_lblErrorRegistroUsuario'));
    longitudCelular(tboxCelular, 10, document.getElementById('ContentPlaceHolder1_lblErrorCelular'));

    compararContrasenias(document.getElementById('ContentPlaceHolder1_lblErrorPasswordRepetida'));

    //SI HAY AUNQUE SEA UN ERROR, DEVUELVO FALSO.
    if (errores > 0) { return false; }
    else { return true; }
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