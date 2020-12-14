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
                    <li><a href="cuenta-perfil.aspx"><i class="fas fa-users"></i>Mi cuenta</a></li>
                    <li><a href="cuenta-autores.aspx"><i class="fas fa-theater-masks"></i>Autores</a></li>
                    <li><a href="cuenta-libros.aspx"><i class="fas fa-book"></i>Libros</li></a>
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
                   <asp:Panel runat="server" ID="pnlDatosUsuario">
                    <div class="datos-perfil">
                        <div class="fieldset-datos">
                        <div class="form-item">
                            <label for="nombre-perfil">Nombre</label>
                            <asp:TextBox ID="tboxNombre" runat="server" Type="text" ></asp:TextBox>
                            <asp:Label ID="lblErrorNombre" runat="server" Text="" CssClass="Error"></asp:Label>
                        </div>
                        <div class="form-item">
                            <label for="apellido-perfil">Apellido</label>
                            <asp:TextBox ID="tboxApellido" runat="server" Type="text" ></asp:TextBox>
                            <asp:Label ID="lblErrorApellido" runat="server" Text="" CssClass="Error"></asp:Label>
                        </div>
                        <div class="form-item">
                            <label for="correo-perfil">Correo electrónico</label>
                            <asp:TextBox ID="tboxEmail" runat="server" Type="email" ></asp:TextBox>
                            <asp:Label ID="lblErrorEmail" runat="server" Text="" CssClass="Error"></asp:Label>
                        </div>
                        <div class="form-item">
                            <label for="celular-perfil">Celular</label>
                            <asp:TextBox ID="tboxCelular" runat="server" Type="number"></asp:TextBox>
                            <asp:Label ID="lblErrorCelular" runat="server" Text="" CssClass="Error"></asp:Label>
                        </div>
                        <div class="form-item">
                            <label for="tboxContrasenia">Contraseña</label>
                            <div class="input-imagen">  
                                <asp:TextBox ID="tboxConstrasenia" type="password" runat="server"></asp:TextBox>
                                <i class="far fa-eye mostrar"></i>
                            </div>
                             <asp:Label ID="lblErrorContrasenia" runat="server" Text="" CssClass="Error"></asp:Label>
                        </div>
                        <div class="form-item">
                           <label for="tboxRepetirContrasenia">Repetir Contraseña</label>
                            <div class="input-imagen">  
                                <asp:TextBox ID="tboxRepetirContrasenia" type="password" runat="server"></asp:TextBox>
                                <i class="far fa-eye mostrar"></i>
                            </div>
                            <asp:Label ID="lblErrorContraseniaRepetir" runat="server" Text="" CssClass="Error"></asp:Label>
                        </div>
                             <asp:Button ID="btnModificar" CssClass="btn" runat="server" Text="Habilitar Campos" OnClick="btnModificar_Click"/>
                             <asp:Button ID="btnAceptar" CssClass="btn" runat="server" Text="Guardar Cambios" Visible="false" OnClick="btnAceptar_Click" OnClientClick="return ValidarUsuario();"/>
                    </div>
                </div>
               
            </asp:Panel>  
            
            </fieldset>   
<!-- Modal -->
<div class="modal fade" id="modalUsuarioModificacion" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content m-contenido">
      <div class="modal-header m-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <i class="far fa-check-circle m-icono"></i>
       <p>Tu usuario fue modificado exitosamente.</p>
      </div>
            
    </div>
  </div>
</div>
<!--Fin Ventana modal-->
        </form>


</section>
    <script src="js/validacionesUsuario.js">
</script>
</asp:Content>
