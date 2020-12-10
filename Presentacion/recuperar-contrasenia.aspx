<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="recuperar-contrasenia.aspx.cs" Inherits="Presentacion.recuperar_contrasenia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="contenedor-mediano">
<h2 class="subtitulo">Recupera tu contraseña</h2>
<div class="descripcion-seccion">
    <p>Ingresa en el siguiente formulario el correo electrónico que tengas asociado a tu usuario, de esta manera podremos enviarte los datos correspondientes a tu usuario.</p>
</div>

 <!-- Ventana Modal -->

<div class="modal fade" id="confirmacionRestauracion" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Acción exitosa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <i class="fas fa-check-circle"></i>
        <p>La contraseña ha sido enviado con éxito. Revise su correo electrónico.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<div class="">
    <form runat="server" class="contenedor-cuenta">
        <!--Formulario Inicio Sesión-->
        <div class="formulario-iniciar-sesion">
            <fieldset>
                <h3>Ingresa tu correo electrónico</h3>
                <div class="fieldset-datos">
                    <div class="form-item">
                        <label for="tboxEmailRecuperacion">Email</label>
                        <div class="input-imagen">
                            <asp:TextBox ID="tboxEmailRecuperacion" type="email" runat="server"></asp:TextBox>
                            <i class="far fa-paper-plane"></i>
                        </div>
                    <asp:Label ID="lblErrorEmailRecuperacion" runat="server" Text="" class="Error"></asp:Label>
                    </div>
                </div>
                <asp:Button ID="btnRecuperarContrasenia" Text="Enviar" runat="server" CssClass="btn" OnClick="btnRecuperarContrasenia_Click"/>
            </fieldset>
        </div>
    </form>              
</div>
    </section>

</asp:Content>
