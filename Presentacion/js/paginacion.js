
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