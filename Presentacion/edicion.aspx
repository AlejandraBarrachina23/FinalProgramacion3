<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="edicion.aspx.cs" Inherits="Presentacion.edicion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="contenedor-mediano">
        <h2 class="subtitulo">¿Qué es editar?</h2>
        <div class="descripcion-seccion">
            <p>La palabra edición hace referencia a dos etapas complementarias de un mismo proceso. Se denomina edición, al trabajo, junto con el autor, de formular la estética del libro, la longitud de los capítulos, la importancia de las ilustraciones si fueran necesarias y su correcta presentación. </p>
            <p>Y también se llama edición al seguimiento y control de todas las instancias de confección del libro, desde la primera corrección, pasando por las galeras, hasta la etapa de liquidación de derechos.</p>
            <p>Es el editor/a quien acompaña y asiste al autor en todas las etapas, oficiando a su vez de representante.</p>
        </div>
        <h2 class="subtitulo">Nuestros servicios</h2>
    <div class="edicion-servicios">
        <div class="edicion-item">
            <div class="edicion-item-imagen">
            <img src="img/servicios-edicion.jpg" alt="servicio-correcion">
            <h3>Edición</h3>
        </div>
        <div class="edicion-item-descripcion">
            <p>Convertir un manuscrito a libro implica adentrarse en un mundo que va mucho más allá de la escritura.
                El proceso muchas veces solitario de la redacción, toma una dimensión multitudinaria cuando editores, diseñadores y correctores entran en juego.
                De alguna forma, se trata de una instancia decisiva del manuscrito, que deja de ser tal para convertirse en un libro hecho y derecho.</p>
        </div>
        </div>
        <div class="edicion-item foto-izquierda">
            <div class="edicion-item-descripcion">
                <p>La corrección, de la que no escapa ningún libro, ni ningún autor –por consagrado que sea- pulirá el original de posibles defectos de tipeo, errores de ortografía, de ortotipografía y de sintaxis. Eventualmente, se puede además dar un toque al estilo, siempre con la anuencia del autor y en tanto no se modifique la esencia ni el espíritu del original.
                </p>
            </div>
            <div class="edicion-item-imagen">
                <img src="img/servicios-correccion.jpg" alt="servicio-correcion">
                <h3>Corrección</h3>
            </div>
        </div>
        <div class="edicion-item ">
            <div class="edicion-item-imagen">
            <img src="img/servicios-disenio.jpg" alt="servicio-correcion">
            <h3>Diseño y armado</h3>
        </div>
        <div class="edicion-item-descripcion">
            <p>Esta etapa significa darle forma al libro: cantidad de páginas, tipo y cuerpo de carácter, importancia de títulos y subtítulos, categorización de temas. 
                Paralelamente, se trabaja el diseño de tapa y también se fijan sus características técnicas: gramaje del papel o cartulina, con o sin solapas, tipo de laminado.
                De acuerdo con la temática, al público y a las características temporales del mercado, se boceta la tapa hasta alcanzar el ideal del proyecto.</p>
        </div>
        </div>
        <div class="edicion-item foto-izquierda">
        <div class="edicion-item-descripcion">
            <p>La culminación del proceso editorial es la encuadernación. Allí se define la apariencia final del libro.
                Es de esta competencia, el sistema a aplicar para encuadernar: pegado, con sus múltiples variantes, o cosido, el sistema tradicional que permite al libro ya confeccionado mayor versatilidad.
                De acuerdo al circuito comercial donde el libro haga su debut, corresponderá o no el termoenvasado uno a uno.
            </p>
        </div>
        <div class="edicion-item-imagen">
            <img src="img/servicios-impresion.jpg" alt="servicio-correcion">
            <h3>Impresión</h3>
         </div>
        </div>
    </div>
    </section>
<!--Fin section-edicion-->
</asp:Content>
