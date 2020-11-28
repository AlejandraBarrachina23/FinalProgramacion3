<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta-libros.aspx.cs" Inherits="Presentacion.cuenta_libros" %>
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
        <h2 class="subtitulo">Listado de ediciones</h2>
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
            <form runat="server" action="" method="post">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click"/>
            <asp:Label ID="lblIndex" runat="server" Text="indice"></asp:Label>
            <asp:GridView ID="grillaLibros" runat="server" CssClass="tabla" AutoGenerateColumns="False" OnSelectedIndexChanged="grillaLibros_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="grillaLibros_PageIndexChanging" PageSize="5" PagerStyle-CssClass="pgr" OnRowDeleting="grillaLibros_RowDeleting" OnRowCommand="grillaLibros_RowCommand" >
                <Columns>
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                    <asp:BoundField DataField="Titulo" HeaderText="Título" />
                    <asp:BoundField DataField="AnioEdicion" HeaderText="Año" />
                    <asp:BoundField DataField="Autor" HeaderText="Autor" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/edit.png" SelectText="" ShowSelectButton="True" HeaderText="Actualizar"/>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/img/delete.png" ShowDeleteButton="True"/>              
                </Columns>
        <PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
            <asp:Panel ID="modal" runat="server" CssClass="ventana-emergente">
                <fieldset>
                <legend>Detalle libro</legend>
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Odit unde doloremque dolorem molestiae facere deleniti delectus praesentium aperiam doloribus quod corrupti.</p>
                <div class="fieldset-datos">
                    <div class="form-item">
                        <label for="ISBN">ISBN</label>
                        <asp:TextBox ID="tboxIsbn" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-item">
                        <label for="titulo">Título</label>
                        <asp:TextBox ID="tboxTitulo" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-item">
                        <label for="">Formato</label>
                        <asp:DropDownList ID="ddlFormatos" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-item">
                        <label for="anioEdicion">Año de edición</label>
                         <asp:TextBox ID="AnioEdicion" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-item">
                        <label for="formato-libro">Autores</label>
                        <asp:DropDownList ID="ddlAutores" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-item">
                        <label for="formato-libro">Editoriales</label>
                        <asp:DropDownList ID="ddlEditorial" runat="server"></asp:DropDownList>
                    </div>
                      <div class="form-item">
                        <label for="formato-libro">Sinopsis</label>
                         <asp:TextBox ID="tboxSinopsis" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="form-item">
                        <label for="formato-libro">Foto</label>
                        <asp:Image ID="imgPortada" runat="server" Width="200" ImageUrl="~/img/imagen-no-disponible.png"/>
                        <asp:FileUpload ID="fupImagenPortada" runat="server"  />
                    </div>
                     <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click"/>
                     <asp:Button ID="btnAceptar" runat="server" Text="Agregar" Visible="false" OnClick="btnAceptar_Click1"/>
                     <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"/>
                </div>
            </fieldset>
            </asp:Panel>
          
        </form>
    </div>
</section>
   
</asp:Content>
