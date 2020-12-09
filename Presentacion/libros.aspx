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
<!-- FILTROS -->

        <div class="filtros-busqueda">
            <div class="busqueda">
                <label for="">Búsqueda</label>
                <input type="text">
            </div>
            <div class="orden">
                <label for="prdenar-libros">Ordernar por</label>
                <select name="cboxOrdenarLibros" id="ordenar-libros">
                    <option value="1">Alfabéticamente: A-Z</option>
                    <option value="2">Alfabéticamente: Z-A</option>
                    <option value="3">Fecha emisión ascendiente </option>
                    <option value="4">Fecha emisión descendiente </option>
                </select>
            </div>
        </div>
 <!-- GRILLA -->
        
        <div class="listado-ediciones" id="list">
        <% Negocio.LibroNegocio unLibroNegocio = new Negocio.LibroNegocio();
            List<Dominio.Libro> ListadoLibros = unLibroNegocio.ListadoLibros();

            foreach (var unLibro in unLibroNegocio.ListadoLibros())
            {
                %>        
            <div class="libros-item">
                <div class="libro-imagen">
                    <img src="<%=unLibro.Portada.Replace("~","") %>" alt="">
                    <button type="button" class="btn btn-primary preview resumen" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-search-plus"></i> Ver más</button>
                </div>
                <div class="libro-descripcion">
                    <h3><%= unLibro.Titulo %></h3>
                    <p class="autor">por: <%=  unLibro.Autor.Nombre + " " + unLibro.Autor.Apellido %></p>
                    <p hidden><%=  unLibro.Sinopsis %></p>
                    <p hidden><%=  unLibro.AnioEdicion %></p>
                </div>
            </div>
        <%}%>
         </div>
        <div class="paginacion" id="pagination"> </div>

<!-- VENTANA MODAL-->
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
                    <img src="img/libros/libro7.jpg" id="modal-imagen" alt="">
                </div>
                <div class="modal-derecha">
                    <h3 id="modal-titulo"></h3>
                    <br />
                    <div class="libros-calificaciones">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <br />
                    <p id="modal-sinopsis"></p>
                    <hr />
                    <p id="modal-autor">Adrián Ortiz</p> 
                    <p id="modal-anio">2018 </p>

                </div>
            </div>
          </div>
      </div>
    </div>
    </section>
        <script src="js/paginacion.js"></script>
        <script>

            const items = document.querySelectorAll('.resumen');
            let modalTitulo = document.getElementById('modal-titulo');
            let modalAutor = document.getElementById('modal-autor');
            let modalImagen = document.getElementById('modal-imagen');
            let modalAnio = document.getElementById('modal-anio');
            let modalSinopsis = document.getElementById('modal-sinopsis');
                    
            items.forEach(item => {
            item.addEventListener('click', function(event){

                modalTitulo.textContent = item.parentElement.parentElement.lastElementChild.children[0].textContent;
                modalAutor.textContent = item.parentElement.parentElement.lastElementChild.children[1].textContent;
                modalAnio.textContent = "Año: " + item.parentElement.parentElement.lastElementChild.children[3].textContent;
                modalSinopsis.textContent =  item.parentElement.parentElement.lastElementChild.children[2].textContent;
                modalImagen.src = item.parentElement.firstElementChild.src;

                 })
            })

            const ddlListOrden = document.getElementById('ordenar-libros');
            let librosItem = document.querySelectorAll('.libros-item');
            let listadoLibros = Array.from(librosItem)

            listadoLibros.sort(function (a, b) {
                a = document.querySelector('.libro-descripcion').firstElementChild.textContent.toLowerCase;
                b = document.querySelector('.libro-descripcion').firstElementChild.textContent.toLowerCase;

                return a > b
            });


        </script>
  
</asp:Content>
