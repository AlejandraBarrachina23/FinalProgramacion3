<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta-categoria.aspx.cs" Inherits="Presentacion.cuenta_categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="contenedor-mediano">
        <h2 class="subtitulo">Opciones generales</h2>
        <div class="descripcion-seccion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
            <nav>
                <ul class="menu-administrador">
                    <li><a href=""><i class="fas fa-users"></i>Mi cuenta</a></li>
                    <li><a href=""><i class="fas fa-theater-masks"></i>Categorías</a></li>
                    <li><a href=""><i class="fas fa-book"></i>Libros</li></a>
                </ul>    
            </nav>
        </div>
        <h2 class="subtitulo">Listado de categorías</h2>
        <div class="descripcion-seccion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
 
        </div>
        <div class="crud-libros">
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
        <table class="tabla">
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Acciones</th>
              </tr>
              <tr>
                <td>1</td>
                <td>Novela</td>
                <td>
                    <i class="far fa-edit"></i>
                    <i class="far fa-trash-alt"></i>
                </td>
              </tr>
              <tr>
                <td>2</td>
                <td>Cuento</td>
                <td>
                    <i class="far fa-edit"></i>
                    <i class="far fa-trash-alt"></i>
                </td>
              </tr>
              <tr>
                <td>3</td>
                <td>Biografía</td>
                <td>
                    <i class="far fa-edit"></i>
                    <i class="far fa-trash-alt"></i>
                </td>
              </tr>
              <tr>
                <td>4</td>
                <td>Ensayo</td>
                <td>
                    <i class="far fa-edit"></i>
                    <i class="far fa-trash-alt"></i>
                </td>
              </tr>            
        </table>
        
        <div class="paginacion">
          
            <div class="numeracion">
                <ul class="paginacion-numeros">
                    <li class="mueve-pagina">Ant</li>
                    <li class="pagina-seleccionada">1</li>
                    <li>2</li>
                    <li class="mueve-pagina">Sig</li>
                </ul> 
            </div>
        </div>
    </div>
</section>
</asp:Content>
