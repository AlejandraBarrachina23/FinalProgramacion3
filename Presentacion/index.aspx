<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterLanding.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Presentacion.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Inicio Ultimos lanzamiento-->
    <main class="contenedor-mediano">
        <h2>Últimos lanzamientos</h2>
        <p class="bajada-titulo">Ultimas trabajos de edición realizadas por nuestra editorial.</p>
    <div class="listado-libros">
        <i class="fas fa-arrow-left flecha-izquierda"></i>
        <div class="libros-item">
            <div class="libro-imagen">
                <img src="img/libros/libro7.jpg" alt="">
            </div>
            <div class="libro-descripcion">
            <h3>La disolución freudiana de las psicosis</h3>
            <p class="autor">por: Adrián Ortiz</p>
            <div class="libros-calificaciones">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
        </div>
        </div>
        <div class="libros-item">
            <div class="libro-imagen">
                <img src="img/libros/libro6.jpg" alt="">
            </div>
            <div class="libro-descripcion">
            <h3>Iorio, el perro cristiano</h3>
            <p class="autor">por: Ariel O. Torres</p>
            <div class="libros-calificaciones">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
        </div>
        </div>
        <div class="libros-item">
            <div class="libro-imagen">
                <img src="img/libros/libro10.jpg" alt="">
            </div>
            <div class="libro-descripcion">
            <h3>Guía para el estudio del servicio de referencia en las bibliotecas</h3>
            <p class="autor">por: María Laura Andrade</p>
            <div class="libros-calificaciones">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
        </div>
        </div>
        <i class="fas fa-arrow-right flecha-derecha"></i>
    </div>
    </main>
<!--Fin Ultimos lanzamiento-->
<!--Inicio Servicios-->
<div class="imagen-fondo">
<section class="contenedor-mediano">
    <h2>Servicios</h2>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-tools"></i></div>
            <div class="servicio-descripcion">
                <h3>Edición</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
            </div>
    </div>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-highlighter"></i></div>
        <div class="servicio-descripcion">
            <h3>Corrección</h3>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
        </div>
    </div>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-palette"></i></div>
        <div class="servicio-descripcion">
            <h3>Diseño y armado</h3>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
        </div>
    </div>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-book"></i></div>
        <div class="servicio-descripcion">
            <h3>Impresión</h3>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
        </div>
    </div>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-ghost"></i></div>
        <div class="servicio-descripcion">
            <h3>Ghostwriter</h3>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
        </div>
    </div>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-pen-nib"></i></div>
        <div class="servicio-descripcion">
            <h3>Talleres</h3>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
        </div>
    </div>
</section>

<!--Fin Servicios-->
<!--Inicio Sobre Mi-->

<section class="contenedor-mediano">
    <h2>Sobre mi</h2>
<div class="acerca-de-mi">
    <div class="acerca-de-mi-imagenes"><img src="img/acerca-de-mi.png" alt=""></div>
    <div class="acerca-de-mi-descripcion">
        <h3>Hola, soy Adriana Cabrera</h3>
        <h4>Ghostwriter / Corrección y edición de libros</h4>
        <p>Nací en Buenos Aires en el Siglo XX; estudié periodismo y comunicación social en el
            Círculo de la Prensa. Trabajé en medios gráficos, tuve un programa de radio en La
            Muni, cuando era director Pele Eliaschev y fui asistente de piso en algunos programas
            de televisión. Mi pasión, sin embargo, viene por el lado de la tinta y en papel. Ya me
            preocupaba yo por leer “El oficio gráfico” apenas llegaba a la oficina de mi papá.
            Estudié corrección literaria y trabajando en la producción de libros y revistas, comencé
            a editar, antes de que esta profesión fuera una carrera universitaria.
            Ediciones Elemento es mi proyecto de hoy y siempre.</p>
        <div class="firma"><img src="img/firma.png" alt=""></div>
        <div class="redes-sociales">
            <a href="https://www.facebook.com/edicioneselemento/" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://www.linkedin.com/in/adriana-cabrera-16419139/?originalSubdomain=ar" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            <a href="https://www.bajalibros.com/AR" target="_blank"><i class="fab fa-amazon"></i></a>
            <a href="https://www.instagram.com/ediciones.elemento/" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
</div>
</section>
</div>
<!--Fin Sobre Mi-->
<!--Inicio Testimoniales-->
<div class="fondo-general">
<section class="contenedor-grande">  
    <div class="testimoniales">
        <i class="fas fa-arrow-left "></i>
        <div class="testimoniales-detalle">
        <div class="testimoniales-imagen">
            <img src="img/testimonio1.png" alt="">
            <h3>Eduardo Perez</h3>
            <p>Director Ejecutivo, AMSL</p>
        </div>
        <div class="testimoniales-descripcion">
            <p><i class="fas fa-quote-left"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, etscelerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper  libero rutrum. </p>
        </div>
    </div>
        <i class="fas fa-arrow-right "></i>
    </div>
</section>
<!--Fin Testimoniales-->
<!--Inicio Contacto-->

<section class="section-contacto">   
    <div class="contenedor-mediano contacto-principal">
        <h2>Contacto</h2>
    <div class="contacto-simple">
    <div class="contacto-simple-informacion">
        <p class="bajada-titulo">Para enviarnos un mensaje, complete el siguiente formulario. Nos contactaremos a la brevedad con usted.</p>
        <div class="datos-contacto">
        <address>
            <div class="contacto-item">
                <i class="fas fa-envelope-open-text"></i><p>adrianapcabrera@gmail.com</p>
            </div>
            <div class="contacto-item">
                <i class="fas fa-map-marker-alt"></i><p>Maipu 2045, San Fernando</p>
            </div>
            <div class="contacto-item">
                <i class="fab fa-whatsapp"></i><p>+54 11 2250 4318</p>
            </div>
        </address>
    </div>
    </div>
    <div class="contacto-simple-formulario">
        <label for="tboxNombre">Nombre y Apellido</label>
        <input type="text" id="input-nombre">
        <label for="input-correo">Correo Electrónico</label>
        <input type="text" id="input-correo">
        <label for="text-area-mensaje">Mensaje</label>
        <textarea name="" id="text-area-mensaje" cols="30" rows="7"></textarea>
        <input type="submit" class="btn">
    </div>
</div>
</section>
</div>
<!--Fin Contacto-->
</asp:Content>
