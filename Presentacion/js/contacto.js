
const ddlFormato = document.getElementById('ddl-formato-libro');
const tboxFormatoOtros = document.getElementById('tbox-formato-otros');

const ddlGenero = document.getElementById('ddl-genero-libro');
const tboxGenero = document.getElementById('tbox-genero-otros');

const radioButton = document.getElementsByName('rbtnImagenes');
const tboxCantidadImagenes = document.getElementById('tbox-imagenes');

const celular = document.getElementById('celular');
const celularCampoError = document.getElementById('ContentPlaceHolder1_lblErrorCelular');

const botonEnviar = document.getElementById('ContentPlaceHolder1_btnSubmitFormContacto');
const cantidadCaracteres = document.getElementById('cantidad-caracteres');
const cantidadEjemplares = document.getElementById('cantidad-ejemplares');

const tboxNombre = document.getElementById('nombre');
const tboxApellido = document.getElementById('apellido');
const tboxEmail = document.getElementById('mail');

const lblErrorNombre = document.getElementById('ContentPlaceHolder1_lblErrorNombre');
const lblErrorApellido = document.getElementById('ContentPlaceHolder1_lblErrorApellido');
const lblErorMail = document.getElementById('ContentPlaceHolder1_lblErrorMail');

const listadoErrores = document.querySelectorAll('.Error');

botonEnviar.addEventListener('click', revisarTextBox);

radioButton.forEach(radioItem => {

    radioItem.addEventListener('change', itemSeleccionado);
})

ddlFormato.addEventListener('change', () => habilitarTextBox(tboxFormatoOtros, ddlFormato));
ddlGenero.addEventListener('change', () => habilitarTextBox(tboxGenero, ddlGenero));

function habilitarTextBox(tboxGenerico, ddlGenerico) {

    (ddlGenerico.value === 'otros') ? tboxGenerico.disabled = false : tboxGenerico.disabled = true;
    tboxGenerico.value = "";
}

function itemSeleccionado() {

    tboxCantidadImagenes.value = "";
    radioButton[0].checked ? tboxCantidadImagenes.disabled = false : tboxCantidadImagenes.disabled = true;

}

function revisarTextBox() {

    if (cantidadCaracteres.value === "") cantidadCaracteres.value = 0;
    if (tboxCantidadImagenes.value === "") tboxCantidadImagenes.value = 0;
    if (cantidadEjemplares.value === "") cantidadEjemplares.value = 50;

}


function longitudExacta(tboxEvaluar, cantidadCaracteresPermitidos, campo, mensajeError) {

    if (tboxEvaluar.value.length !== cantidadCaracteresPermitidos) { campo.textContent = mensajeError; return false }
    return true;
}

function validarTextBoxVacio(textBox, campo, mensajeError) {

    if (textBox.value == "") { campo.textContent = mensajeError; return false }
    return true;
}

function ValidarMail(email) {

    var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email.value) ? true : false;
}

function ValidacionesContacto() {


    limpiarFormulario(listadoErrores);
    let errores = 0;

    if (!longitudExacta(celular, 10, celularCampoError, "La longitud del celular es 10")) { errores++; }
    
    if (!validarTextBoxVacio(tboxNombre, lblErrorNombre, "Complete este campo")) { errores++; }
    if (!validarTextBoxVacio(tboxApellido, lblErrorApellido, "Complete este campo")) { errores++; }
    if (!validarTextBoxVacio(tboxEmail, lblErorMail, "Complete este campo")) { errores++; }
    if (!ValidarMail(tboxEmail)) { lblErorMail.textContent = "Mail inválido"; errores++; }

    if (errores !== 0) {

        return false;
    }

    else {

        $('#modalMailEnviadoContacto').modal({ show: true });
        return true;
    }
}

function limpiarFormulario(etiquetas) {

    const NuevoItem = Array.from(etiquetas);

    NuevoItem.forEach(item => {

        item.textContent = "";
    });
}


