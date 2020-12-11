<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="talleres.aspx.cs" Inherits="Presentacion.talleres" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="contenedor-mediano">
        <h2 class="subtitulo">Acerca de los talleres</h2>
        <div class="descripcion-seccion">
            <p>Destinado a quienes quieren lanzarse a escribir sus vivencias, este taller es personalizado y puede realizarse tanto de manera presencial como a distancia. Está pensado en módulos flexibles, que permiten ir acompañando la evolución del texto y ¡claro! del autor.</p>
            <p>Cada módulo se desarrolla en flexibles 90 minutos, que nos permitirán trabajar en equipo para ir encontrando o puliendo el estilo de acuerdo a la necesidad.</p>
            <p>Ediciones Elemento ofrece este servicio de manera independiente de la edición del libro, llena nuestra formulario <a href="contacto.aspx"><strong><span class="resaltar-verde">aquí</span></strong></a>para que nos pongamos en contacto.</p>
        </div>
        <h2 class="subtitulo">Biografía, autobiografía y memorias</h2>
        <div class="descripcion-seccion descripcion-flotada">
            <div class="descripcion-imagenes">
                <img src="img/talleres.jpg" class="flotar-izquierda" alt="">
            </div>
            <div class="descripcion-parrafos">
                <p>A mitad de camino entre la literatura y la historia, la biografía es el relato de una vida, contada por una tercera persona. 
                La autobiografía, aunque parecida, es el relato de una vida, contado por el propio protagonista, es decir en primera persona. El estilo es siempre libre, de no ficción y puede darse en forma cronológica o no, ser epistolar o dividirse en capítulos convencionales.</p>
                <p>Las memorias, muy emparentadas a la autobiografía se diferencian por tomar sólo algunos episodios o cierta época de la vida del autor. Generalmente, las memorias no incluyen toda la vida, sino lo más trascendente de una carrera profesional o determinado episodio digno de trascender.</p>
                <p>Clásicos de la literatura como la novela “El lazarillo de Tormes” es un claro ejemplo de autobiografía, está escrita en primera persona, a modo epistolar (es una larga carta). “Vivir para contarla” de Gabriel García Marquez es un compilado de sus crónicas periodísticas, amalgamadas en un relato autobiográfico. En la categoría memorias, "Tierra de hombres", la obra de Antoine de Saint Exupéry, narra algunos episodios de su vida de piloto. De hecho, el elemento central de la novela es el accidente que sufrió en 1935 en la parte libia del desierto del Sahara, cuando viajaba con André Prévot y en el que estuvieron a punto de morir de sed.</p>
            </div>    
        </div>    
                <div class="listado-autobiografias">
            <div class="autobiografia-item">
                <div class="libro-autobiografia-tapa">
                    <img src="img/autobiografia-tapa1.jpg" alt="">
                </div>
                <div class="libro-autobiografia-descripcion">
                    <h3>Vivir para contarla</h3>
                    <p>Autor: Gabriel García Márquez</p>
                    <p>Género: Autobiografía</p>
                    <p>Año: 2002</p>
                </div>
            </div>

            <div class="autobiografia-item">
                <div class="libro-autobiografia-tapa">
                    <img src="img/autobiografia-tapa3.jpg" alt="">
                </div>
                <div class="libro-autobiografia-descripcion">
                    <h3>Tierra de los hombres</h3>
                    <p>Autor: Antoine de Saint</p>
                    <p>Género: Autobiografía</p>
                    <p>Año: 1993</p>
                </div>
            </div>
            <div class="autobiografia-item">
                <div class="libro-autobiografia-tapa">
                    <img src="img/autobiografia-tapa2.png" alt="">
                </div>
                <div class="libro-autobiografia-descripcion">
                    <h3>Lazarillo de Tormes</h3>
                    <p>Autor: Anónimo</p>
                    <p>Género: Autobiografía</p>
                    <p>Año: 1554</p>
                </div>
            </div>
        </div>
    </section>

<!--Fin section-edicion-->
</asp:Content>
