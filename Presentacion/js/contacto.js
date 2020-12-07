
const ddlFormato = document.getElementById('ddl-formato-libro');
const tboxFormatoOtros = document.getElementById('tbox-formato-otros');

const ddlGenero = document.getElementById('ddl-genero-libro');
const tboxGenero = document.getElementById('tbox-genero-otros');

const radioButton = document.getElementsByName('rbtnImagenes');
const tboxCantidadImagenes = document.getElementById('tbox-imagenes');

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
