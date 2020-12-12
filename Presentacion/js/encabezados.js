const boton = document.getElementById('btnCerrarSesion');
const link = document.getElementById('hplnkLogin');
if (link.text !== 'LOGIN') boton.removeAttribute('hidden');

var pathname = window.location.pathname;
const header = document.getElementsByTagName('header');


if (pathname === "/libros.aspx") {

    header[0].classList.add("header-libros");
    header[0].lastElementChild.firstElementChild.textContent = "Libros";
}

else if (pathname === "/ghostwriter.aspx") {

    header[0].classList.remove("header-contacto");
    header[0].classList.add("header-ghostwriter");
    header[0].lastElementChild.firstElementChild.textContent = "Ghostwriter";
}

else if (pathname === "/talleres.aspx") {

    header[0].classList.remove("header-contacto");
    header[0].classList.add("header-talleres");
    header[0].lastElementChild.firstElementChild.textContent = "Talleres";

}

else if (pathname === "/nosotros.aspx") {

    header[0].lastElementChild.firstElementChild.textContent = "Nosotros";
}

else if (pathname === "/faq.aspx") {

    header[0].lastElementChild.firstElementChild.textContent = "FAQ";
}

else if (pathname === "/contacto.aspx") {

    header[0].lastElementChild.firstElementChild.textContent = "Contacto";
}

else if (pathname === "/edicion.aspx") {

    header[0].lastElementChild.firstElementChild.textContent = "Edición";
}

else if (pathname === "/notificacion.aspx" || pathname === "/error404.aspx") {

    header[0].classList.remove("header-contacto");
    header[0].lastElementChild.remove();
}