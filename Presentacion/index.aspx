<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterLanding.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Presentacion.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Inicio Ultimos lanzamiento-->
    <main class="contenedor-mediano">
        <h2>Últimos lanzamientos</h2>
        <p class="bajada-titulo">Ultimas trabajos de edición realizadas por nuestra editorial.</p>
        <div class="splide">
            <div class="splide__arrows">
                <button class="splide__arrow splide__arrow--prev">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <button class="splide__arrow splide__arrow--next">
                  <i class="fas fa-chevron-right"></i>
                </button>
            </div>
            <div class="splide__track">
                <ul class="splide__list">
  <%
     
      Negocio.LibroNegocio unLibroNegocio = new Negocio.LibroNegocio();

      foreach (var unLibro in unLibroNegocio.ListarUltimasEdiciones())
      { %>
            <li class="splide__slide">
                <div class="libros-item">
                <div class="libro-imagen">
                    <img src="<%=unLibro.Portada.Replace("~","") %>" alt="">
                </div>
                <div class="libro-descripcion">
                    <h3><%= unLibro.Titulo %></h3>
                    <p class="autor">por: <%=  unLibro.Autor.Nombre + " " + unLibro.Autor.Apellido %></p>
                </div>
                </div>
            </li>
      <%}
          
           %>
            </ul>
        </div>
 </div>
    </main>
<!--Fin Ultimos lanzamiento-->

<!--Inicio Servicios-->
<div class="imagen-fondo">
<section class="contenedor-mediano">
    <h2>Servicios</h2>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-tools"></i></div>
        <a href="edicion.aspx">    
            <div class="servicio-descripcion">
                <h3>Edición</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
            </div>
        </a>
    </div>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-highlighter"></i></div>
        <a href="edicion.aspx">
            <div class="servicio-descripcion">
             <h3>Corrección</h3>
             <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
            </div>
        </a>
    </div>
    <div class="servicios">
       <div class="servicio-icono"><i class="fas fa-palette"></i></div>
        <a href="edicion.aspx">
            <div class="servicio-descripcion">
                <h3>Diseño y armado</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
            </div>
        </a>
    </div>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-book"></i></div>
        <a href="edicion.aspx">
            <div class="servicio-descripcion">
                <h3>Impresión</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
            </div>
        </a>
    </div>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-ghost"></i></div>
        <a href="ghostwriter.aspx">
            <div class="servicio-descripcion">
                <h3>Ghostwriter</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
            </div>
        </a>
    </div>
    <div class="servicios">
        <div class="servicio-icono"><i class="fas fa-pen-nib"></i></div>
        <a href="talleres.aspx">
        <div class="servicio-descripcion">
            <h3>Talleres</h3>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
        </div>
        </a>
    </div>
</section>

<!--Fin Servicios-->
<!--Inicio Sobre Mi-->

<section class="contenedor-mediano">
    <h2>Sobre mi</h2>
<div class="acerca-de-mi">
    <a href="nosotros.aspx"><div class="acerca-de-mi-imagenes"><img src="img/acerca-de-mi.png" alt=""></div></a>
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
        <div class="testimoniales-item">
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
        </div>

        <div class="testimoniales-item">
            <div class="testimoniales-detalle">
                <div class="testimoniales-imagen">
                    <img src="img/testimoniales2.jpg" alt="">
                    <h3>Fernando Rodriguez</h3>
                    <p>Product Manager, AVON</p>
                </div>
                <div class="testimoniales-descripcion">
                    <p><i class="fas fa-quote-left"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, etscelerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper  libero rutrum. </p>
                </div>
            </div>
        </div>

        <div class="testimoniales-item">
            
            <div class="testimoniales-detalle">
                <div class="testimoniales-imagen">
                    <img src="img/testimoniales3.jpg" alt="">
                    <h3>Virginia Oliviero </h3>
                    <p>Compositora musical</p>
                </div>
                <div class="testimoniales-descripcion">
                    <p><i class="fas fa-quote-left"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, etscelerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper  libero rutrum. </p>
                </div>
            </div>

        </div>

        <div class="testimoniales-item">
            
            <div class="testimoniales-detalle">
                <div class="testimoniales-imagen">
                    <img src="img/testimoniales4.jpg" alt="">
                    <h3>Sofia Lamas</h3>
                    <p>Chef principal, El Gourmet</p>
                </div>
                <div class="testimoniales-descripcion">
                    <p><i class="fas fa-quote-left"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, etscelerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper  libero rutrum. </p>
                </div>
            </div>

        </div>
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
                <a href="https://bit.ly/EdicionesElemento" target="_blank"><i class="fab fa-whatsapp"></i><p>+54 11 2250 4318</p></a>
            </div>
        </address>
    </div>
    </div>
        <form method="post" runat="server">
        <div class="contacto-simple-formulario">    
            <label for="tboxNombre">Nombre y Apellido</label>
            <input type="text" name="tboxNombreUsuario" id="input-nombre" required>
            <label for="input-correo">Correo Electrónico</label>
            <input type="email" name="tboxEmail" id="input-correo" required>
            <label for="text-area-mensaje">Mensaje</label>
            <textarea name="tboxMensaje" id="text-area-mensaje" cols="30" rows="7" required></textarea>
            <asp:Button ID="btnEnviarConsulta" CssClass="btn" runat="server" Text="Enviar" OnClick="btnEnviarConsulta_Click"/>
        </div>
    </form>
</div>
</div>
</section>
</div>
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/js/splide.min.js"></script>
    <script src="js/funciones.js"></script>
<!--Fin Contacto-->


<!-- Modal -->
<div class="modal fade" id="modalMailEnviado" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content m-contenido">
      <div class="modal-header m-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <i class="far fa-check-circle m-icono"></i>
       <p>Tu consulta fue enviada exitosamente</p>
      </div>
            
    </div>
  </div>
</div>

    <!--Fin Ventana modal-->

    <script>

        const tboxNombre = document.getElementById('input-nombre');
        const tboxCorreo = document.getElementById('input-correo');
        const tboxMensaje = document.getElementById('text-area-mensaje');
        const botonSubmit = document.getElementById('ContentPlaceHolder1_btnEnviarConsulta');

            botonSubmit.addEventListener('click', notificacion);

            function notificacion() {

                if (tboxNombre.value !== "" && tboxCorreo !== "" && tboxMensaje !== "" && tboxCorreo.value.includes('@')) {

                    $('#modalMailEnviado').modal({ show: true });
                }

            }
        
    </script>
    
</asp:Content>
