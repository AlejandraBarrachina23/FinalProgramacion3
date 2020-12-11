
///TOMO TODOS LOS NODOS DE LA LISTA
let cantidadLibros = document.getElementById('list').querySelectorAll('.libros-item');

const pagination_element = document.getElementById('pagination');

let current_page = 1; //DONDE EMPIEZO
let row = 12; //CADA CINCO ELEMENTOS

function DisplayList(items, wrapper, rows_per_page, page) {

    page--;
    let start = rows_per_page * page;
    let end = start + rows_per_page;
    var btnsArr = Array.from(items);
    let paginatedItem = btnsArr.slice(start, end);

    //OCULTO TODO
    for (let i = 0; i < btnsArr.length; i++) {

        btnsArr[i].style.display = 'none';

    }
    //MUESTRO LO QUE NECESITO

    for (let i = 0; i < paginatedItem.length; i++) {

        paginatedItem[i].style.display = 'block';
    }
}

function SetupPagination(items, wrapper, rows_per_page) {

    wrapper.innerHTML = "";
    let page_count = Math.ceil(items.length / rows_per_page);

    for (let i = 1; i < page_count + 1; i++) {

        let btn = PaginationButton(i, items);
        wrapper.appendChild(btn);
    }
}

function PaginationButton(page, items) {

    let button = document.createElement('button');
    button.innerText = page;

    if (current_page == page) {
        button.classList.add('active');
    }

    button.addEventListener('click', function () {
        current_page = page;
        DisplayList(items, cantidadLibros, row, current_page);
    });

    return button;
}

SetupPagination(cantidadLibros, pagination_element, row);
DisplayList(cantidadLibros, cantidadLibros, row, current_page);

const items = document.querySelectorAll('.resumen');
let modalTitulo = document.getElementById('modal-titulo');
let modalAutor = document.getElementById('modal-autor');
let modalImagen = document.getElementById('modal-imagen');
let modalAnio = document.getElementById('modal-anio');
let modalSinopsis = document.getElementById('modal-sinopsis');

items.forEach(item => {
    item.addEventListener('click', function (event) {

        modalTitulo.textContent = item.parentElement.parentElement.lastElementChild.children[0].textContent;
        modalAutor.textContent = item.parentElement.parentElement.lastElementChild.children[1].textContent;
        modalAnio.textContent = "Año: " + item.parentElement.parentElement.lastElementChild.children[3].textContent;
        modalSinopsis.textContent = item.parentElement.parentElement.lastElementChild.children[2].textContent;
        modalImagen.src = item.parentElement.firstElementChild.src;

    })
})

// LISTADO DE FILTRO (ALFABETICO/FECHA)
const ddlListOrden = document.getElementById('ordenar-libros');
// LISTADO DE ITEMS (CON TODOS LOS DATOS)
let librosItem = document.querySelectorAll('.libros-item');
// CONVERSION A ARRAY
let listadoLibros = Array.from(librosItem);
let busqueda = document.getElementById('tboxBusqueda');

function filtroBusqueda() {

    librosItem.forEach(item => {

        if (item.lastElementChild.firstElementChild.textContent.toLowerCase().includes(busqueda.value.toLowerCase())) item.style.display = 'block';
        else item.style.display = 'none';

    });

}

function ordenamiento() {

    let seleccion = ddlListOrden.selectedIndex;
    let listadoEdiciones = document.querySelector('.listado-ediciones');
    listadoEdiciones.innerHTML = "";

    switch (seleccion) {

        case 0: ///ALFABETICAMENTE A-Z
            listadoLibros.sort(comparaTitulosAZ);
            break;
        case 1: //ALFABETICAMENTE Z-A
            listadoLibros.sort(comparaTitulosZA);
            break;
        case 2: //NUMERICAMENTE 1 A X
            listadoLibros.sort(comparaNumerosAscendiente);
            break;
        case 3: //NUMERICAMENTE X A 1
            listadoLibros.sort(comparaNumerosDescendiente);
            break;
        default:
            break;

    }

    listadoLibros.forEach(item => listadoEdiciones.appendChild(item));
}

busqueda.addEventListener('keyup', filtroBusqueda);
ddlListOrden.addEventListener('change', ordenamiento);


function comparaTitulosAZ(itemA, itemB) {

    let tituloUno = itemA.lastElementChild.firstElementChild.textContent.toLowerCase();
    let tituloDos = itemB.lastElementChild.firstElementChild.textContent.toLowerCase();

    if (tituloUno < tituloDos) {
        return -1;
    }
    if (tituloUno > tituloDos) {
        return 1;
    }

    return 0;
}

function comparaTitulosZA(itemA, itemB) {

    let tituloUno = itemA.lastElementChild.firstElementChild.textContent.toLowerCase();
    let tituloDos = itemB.lastElementChild.firstElementChild.textContent.toLowerCase();

    if (tituloUno > tituloDos) {
        return -1;
    }
    if (tituloUno < tituloDos) {
        return 1;
    }

    return 0;
}

function comparaNumerosAscendiente(itemA, itemB) {

    let tituloUno = itemA.lastElementChild.lastElementChild.textContent.toLowerCase();
    let tituloDos = itemB.lastElementChild.lastElementChild.textContent.toLowerCase();

    if (tituloUno > tituloDos) {
        return -1;
    }
    if (tituloUno < tituloDos) {
        return 1;
    }

    return 0;
}

function comparaNumerosDescendiente(itemA, itemB) {

    let tituloUno = itemA.lastElementChild.lastElementChild.textContent.toLowerCase();
    let tituloDos = itemB.lastElementChild.lastElementChild.textContent.toLowerCase();

    if (tituloUno < tituloDos) {
        return -1;
    }
    if (tituloUno > tituloDos) {
        return 1;
    }

    return 0;
}