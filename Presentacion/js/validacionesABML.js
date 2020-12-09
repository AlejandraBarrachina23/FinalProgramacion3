function validarABML() { 

    const ISBN = document.getElementById('ContentPlaceHolder1_tboxIsbn');
    const ISBNError = document.getElementById('ContentPlaceHolder1_lblISBN');
    const TituloLibro = document.getElementById('ContentPlaceHolder1_tboxTitulo');
    const TituloError = document.getElementById('ContentPlaceHolder1_lblTitulo');
    const AnioEdicion = document.getElementById('ContentPlaceHolder1_AnioEdicion');
    const AnioEdiconError = document.getElementById('ContentPlaceHolder1_lblAnioEdicion');
    const Sinopsis = document.getElementById('ContentPlaceHolder1_tboxSinopsis');
    const SinopsisError = document.getElementById('ContentPlaceHolder1_lblSinopsis');
    const notificacionError = document.querySelectorAll('.Error');
    let errores = 0;

    //LIMPIO LAS NOTIFICACIONES
    limpiarFormulario(notificacionError);

    //VALIDO LONGITUD DEL ISBN

    if (!longitudExacta(ISBN, 13, ISBNError, 'El ISBN debe contener 13 dígitos')) errores++;
    //VALIDO CAMPOS VACIOS
    if (!validarTextBoxVacio(TituloLibro, TituloError, 'Complete este campo')) errores++;
    if (!validarTextBoxVacio(TituloLibro, TituloError, 'Complete este campo')) errores++;
    if (!validarTextBoxVacio(AnioEdicion, AnioEdiconError, 'Complete este campo')) errores++;
    if (!validarTextBoxVacio(Sinopsis, SinopsisError, 'Complete este campo')) errores++;

    //VALIDO QUE NO SE HAYA ENCONTRADO NINGUN ERROR
    if (errores !== 0) return false;
    else return true;
}

function longitudExacta(tboxEvaluar, cantidadCaracteresPermitidos, campo, mensajeError) {

    if (tboxEvaluar.value.length !== cantidadCaracteresPermitidos) { campo.textContent = mensajeError; return false }
    return true;
}

function validarTextBoxVacio(textBox, campo,mensajeError) {

    if (textBox.value == "") { campo.textContent = mensajeError;  return false }
    return true;
}

function limpiarFormulario(etiquetas) {


    const NuevoItem = Array.from(etiquetas);

    NuevoItem.forEach(item => {

        item.textContent = "";
    });
}





