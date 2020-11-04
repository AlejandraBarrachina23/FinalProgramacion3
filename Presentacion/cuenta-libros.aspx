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
            <asp:Label ID="lblIndex" runat="server" Text="indice"></asp:Label>
            <asp:GridView ID="grillaLibros" runat="server" CssClass="tabla" AutoGenerateColumns="False" OnSelectedIndexChanged="grillaLibros_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="grillaLibros_PageIndexChanging" PageSize="5" PagerStyle-CssClass="pgr" >
                <Columns>
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                    <asp:BoundField DataField="Titulo" HeaderText="Título" />
                    <asp:BoundField DataField="AnioEdicion" HeaderText="Año" />
                    <asp:BoundField DataField="CodigoAutor" HeaderText="Autor" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/edit.png" SelectText="" ShowSelectButton="True" HeaderText="Actualizar"/>
                </Columns>
            </asp:GridView>
            <asp:Panel ID="modal" runat="server" CssClass="ventana-emergente">
                <h3>Agregar un nuevo libro</h3>
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Odit unde doloremque dolorem molestiae facere deleniti delectus praesentium aperiam doloribus quod corrupti.</p>
                <div class="emergente-campos">
                <div class="emergente-izquierda">
                    <label for="">ISBN</label>
                    <asp:TextBox ID="tboxIsbn" runat="server"></asp:TextBox>
                    <label for="">Titulo</label>
                    <asp:TextBox ID="tboxTitulo" runat="server"></asp:TextBox>
                    <label for="">Formato</label>
                    <asp:DropDownList ID="ddlFormatos" runat="server"></asp:DropDownList>
                    <label for="">Año de edición</label>
                    <asp:TextBox ID="AnioEdicion" runat="server"></asp:TextBox>
                    <label for="">Autor</label>
                    <asp:DropDownList ID="ddlAutores" runat="server"></asp:DropDownList>
                </div>
                <div class="emergente-derecha">
                    <label for="">Sinopsis</label>
                    <asp:TextBox ID="tboxSinopsis" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <label for="">Foto de la tapa</label>
                    <asp:Image ID="imgPortada" runat="server" ImageUrl="~/img/imagen-no-disponible.png" Width="200"/>
                    <asp:FileUpload ID="fupImagenPortada" runat="server" />
                </div>
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
            </div>
            </asp:Panel>
        </form>
    </div>
</section>
</asp:Content>
