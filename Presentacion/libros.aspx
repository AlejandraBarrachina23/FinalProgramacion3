<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="libros.aspx.cs" Inherits="Presentacion.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="contenedor-mediano">
        <h2 class="subtitulo">Nuestras ediciones</h2>
        <div class="descripcion-seccion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.                
        </div>
        <div class="filtros-busqueda">
            <div class="busqueda">
                <label for="">Búsqueda</label>
                <input type="text">
            </div>
            <div class="orden">
                <label for="prdenar-libros">Ordernar por</label>
                <select name="cboxOrdenarLibros" id="ordenar-libros">
                    <option value="">Alfabéticamente: A-Z</option>
                    <option value="">Alfabéticamente: Z-A</option>
                    <option value="">Precio: Más bajo </option>
                    <option value="">Precio: Más alto </option>
                    <option value="">Fecha emisión </option>
                </select>
            </div>
        </div>
    <div class="listado-ediciones">
        <div class="listado-libros">
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="img/libros/libro7.jpg" alt="">
                </div>
                <div class="libro-descripcion">
                <h3>La disolución freudiana de las psicosis</h3>
                <p class="autor">por: Adrián Ortiz</p>
            </div>
            </div>
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="img/libros/libro6.jpg" alt="">
                </div>
                <div class="libro-descripcion">
                <h3>Iorio, el perro cristiano</h3>
                <p class="autor">por: Ariel O. Torres</p>
            </div>
            </div>
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="img/libros/libro1.png" alt="">
                </div>
                <div class="libro-descripcion">
                <h3>Guía shiatsu elemental Namikoshi</h3>
                <p class="autor">por: Shiatsu Argentina</p>
            </div>
            </div>
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="img/libros/libro2.png" alt="">
                </div>
                <div class="libro-descripcion">
                <h3>Daiki</h3>
                <p class="autor">por: Graciela Glorgetti</p>
            </div>
            </div>
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="img/libros/libro3.png" alt="">
                </div>
                <div class="libro-descripcion">
                <h3>Contacto físico establecido</h3>
                <p class="autor">por: Marcelo G. Martorelli</p>
            </div>
            </div>
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="img/libros/libro4.jpg" alt="">
                </div>
                <div class="libro-descripcion">
                <h3>Poubellication / 15</h3>
                <p class="autor">por: María Laura Andrade</p>
            </div>
            </div>
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="img/libros/libro5.png" alt="">
                </div>
                <div class="libro-descripcion">
                <h3>Mi vida a través de mis receteas</h3>
                <p class="autor">por: Susana Majernik</p>
            </div>
            </div>
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="img/libros/libro10.jpg" alt="">
                </div>
                <div class="libro-descripcion">
                <h3>Guía para el estudio del servicio de referencia en las bibliotecas</h3>
                <p class="autor">por: María Laura Andrade</p>
            </div>
            </div>
            
        </div>
    </div>
    <div class="paginacion">
        <p>Mostrando 1–2 de 80 resultados</p>
        <div class="numeracion">
            <ul class="paginacion-numeros">
                <li class="mueve-pagina">Ant</li>
                <li class="pagina-seleccionada">1</li>
                <li>2</li>
                <li class="mueve-pagina">Sig</li>
            </ul> 
        </div>
    </div>
    </section>
</asp:Content>
