<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="libros.aspx.cs" Inherits="Presentacion.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
        
        <div class="listado-ediciones" id="list">
        <% Negocio.LibroNegocio unLibroNegocio = new Negocio.LibroNegocio();
            List<Dominio.Libro> ListadoLibros = unLibroNegocio.ListadoLibros();
            int posicion = 0;

            foreach (var unLibro in unLibroNegocio.ListadoLibros())
            {
                posicion++;%>        
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="<%=unLibro.Portada.Replace("~","") %>" alt="">
                    <button type="button" class="btn btn-primary preview" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-search-plus"></i> Ver más</button>
                    <p class="identificador"><%=posicion%></p>
                </div>
                <div class="libro-descripcion">
                    <h3><%= unLibro.Titulo %></h3>
                    <p class="autor">por: <%=  unLibro.Autor.Nombre + " " + unLibro.Autor.Apellido %></p>

                </div>
            </div>
        <%}%>
         </div>
        <div class="paginacion" id="pagination"> </div>

      <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content ">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body descripcion-libro">
                <div class="modal-izquierda">
                    <img src="img/libros/libro7.jpg" alt="">
                </div>
                <div class="modal-derecha">
                    <h3 id="titulo"></h3>
                    <p id="sinopsis"></p>
                    <hr>
                    <p><span>Autor: </span> Adrián Ortiz</p> 
                    <p><span>Género: </span> Suspenso</p>
                    <p><span>Año: </span> 2018 </p>
                    <div class="libros-calificaciones">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                </div>
            </div>
          </div>
      </div>
    </div>
    </section>
        <script src="js/paginacion.js"></script>
        <script>
            const items = document.querySelectorAll('button.btn.btn-primary');
            let posicion = 0;
                    
            items.forEach(item => {
            item.addEventListener('click', function(event){
                posicion = item.nextElementSibling.textContent;
                document.getElementById('sinopsis').textContent = <%= unLibroNegocio.ListadoLibros()[0].Titulo %>

                 })
          })
        </script>
  
</asp:Content>
