<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta.aspx.cs" Inherits="Presentacion.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
<section class="contenedor-mediano">
<h2 class="subtitulo">Accede a tu cuenta</h2>
<div class="descripcion-seccion">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
</div>
<div class="">
    <form runat="server" class="contenedor-cuenta">

        <!--Formulario Inicio Sesión-->
        <div class="formulario-iniciar-sesion">
            <fieldset>
                <h3>Iniciar sesión</h3>
                <div class="fieldset-datos">
                    <div class="form-item">
                        <label for="usuario">Usuario</label>
                        <div class="input-imagen">
                            <asp:TextBox ID="tboxUsuarioInicio" type="text" runat="server"></asp:TextBox>
                            <i class="fas fa-lock"></i>
                        </div>
                    <asp:Label ID="lblErrorUsuarioInicio" runat="server" Text="" class="Error"></asp:Label>
                    </div>
                    <div class="form-item">
                        <label for="contrasenia">Contraseña</label>
                        <div class="input-imagen">
                            <asp:TextBox ID="tboxConstrasenia" type="password" runat="server"></asp:TextBox>
                            <i class="far fa-eye-slash mostrar"></i>
                        </div>
                        <asp:Label ID="lblErrorContraseniaInicio" runat="server" Text="" class="Error"></asp:Label>
                    </div>
                </div>
                <asp:Label ID="lblEstadoLogeo" class="Error" runat="server" Text=""></asp:Label>    
                <a href="recuperar-contrasenia.aspx"><p>Olvide mi contraseña</p></a>
                <asp:Button ID="btnIniciarSesion" Text="Iniciar Sesión" runat="server" CssClass="btn" OnClick="btnIniciarSesion_Click" OnClientClick="return ValidarInicioSesion();"/>
            </fieldset>
        </div>

        <!--Formulario Registro-->
        <div class="formulario-registro" id="formularioRegistro">
            <fieldset>
             <h3>Registrate</h3>
             <div class="fieldset-datos">
                <div class="form-item">
                    <label for="usuario-registro">Usuario</label>
                    <div class="input-imagen">    
                        <asp:TextBox ID="tboxUsuarioRegistro" runat="server"></asp:TextBox>
                        <i class="far fa-user"></i>
                    </div>
                </div>
                <asp:Label ID="lblErrorRegistroUsuario" class="Error" runat="server" Text=""></asp:Label>
                <div class="form-item">
                    <label for="email-registro">E-mail</label>
                    <div class="input-imagen">    
                        <asp:TextBox type="email" ID="tboxEmailRegistro" runat="server"></asp:TextBox>
                        <i class="far fa-paper-plane"></i>
                    </div>
                 </div>
                 <asp:Label ID="lblErrorRegistroEmail" class="Error" runat="server" Text=""></asp:Label>
                 <div class="form-item">
                     <label for="usuario-celular">Celular</label>
                     <div class="input-imagen">   
                        <asp:TextBox ID="tboxCelularRegistro" type="number" placeholder="112387044" runat="server"></asp:TextBox>
                        <i class="fas fa-phone"></i>
                    </div>
                 </div>
                 <asp:Label ID="lblErrorCelular" class="Error" runat="server" Text=""></asp:Label>
                 <div class="form-item">
                    <label for="contrasenia-registro">Contraseña</label>
                    <div class="input-imagen">    
                        <asp:TextBox ID="tboxContraseniaRegistro" type="password" runat="server"></asp:TextBox>
                        <i class="far fa-eye-slash mostrar"></i>
                    </div>
                 </div>
                 <asp:Label ID="lblErrorPassword" class="Error" runat="server" Text=""></asp:Label>
                 <div class="form-item">
                    <label for="repetir-contrasenia-registro">Repetir Contraseña</label>
                    <div class="input-imagen">  
                        <asp:TextBox ID="tboxRepetirContrasenia" type="password" runat="server"></asp:TextBox>
                        <i class="far fa-eye-slash mostrar"></i>
                    </div>
                 </div>
                 <asp:Label class="Error" ID="lblErrorPasswordRepetida" runat="server" Text=""></asp:Label>
                 <asp:Button ID="btnRegistro" runat="server" CssClass="btn" Text="Enviar" OnClick="btnRegistro_Click"  OnClientClick="return ValidarRegistro();" />
             </div>
       </fieldset>
       </div>
    </form>              
</div>

    </section>
    <script src="js/validacionesRegistro.js"></script>
    <script src="js/botonCerrarSesion.js"></script>
<!--Fin section-edicion-->
</asp:Content>
