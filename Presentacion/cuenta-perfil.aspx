<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta-perfil.aspx.cs" Inherits="Presentacion.WebForm7" %>
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
        <h2 class="subtitulo">Mi perfil</h2>
        <div class="descripcion-seccion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p> 
        </div>
        <form runat="server" class="formulario">
            <fieldset>
                <legend>Datos del usuario</legend>
                      <div class="datos-perfil">
                        <div class="fieldset-datos">
                        <div class="form-item">
                            <label for="nombre-perfil">Nombre</label>
                            <asp:TextBox ID="tboxNombre" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label for="apellido-perfil">Apellido</label>
                            <asp:TextBox ID="tboxApellido" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label for="correo-perfil">Correo electrónico</label>
                            <asp:TextBox ID="tboxEmail" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label for="celular-perfil">Celular</label>
                            <asp:TextBox ID="tboxCelular" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label for="telefono-perfil">Teléfono</label>
                            <asp:TextBox ID="tboxTelefono" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-item">
                            <label for="contrasenia-perfil">Contraseña</label>
                            <asp:TextBox ID="tboxContrasenia" runat="server"></asp:TextBox>
                        </div>
                             <asp:Button ID="btnModificar" CssClass="btn" runat="server" Text="Modificar"/>
                             <asp:Button ID="btnAceptar" CssClass="btn" runat="server" Text="Agregar" Visible="false"/>
                    </div>
                </div>
               
            
            
            </fieldset>   
        </form>
</section>
</asp:Content>
