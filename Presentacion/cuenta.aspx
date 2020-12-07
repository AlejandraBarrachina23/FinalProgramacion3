<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta.aspx.cs" Inherits="Presentacion.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="contenedor-mediano">
        <h2 class="subtitulo">Accede a tu cuenta</h2>
        <div class="descripcion-seccion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum. 
            </p>
        </div>
        <div class="contenedor-cuenta">
            <div class="registro">
                 <form runat="server" class="formulario formulario-iniciar-sesion">
                    <fieldset>
                        <h3>Iniciar sesión</h3>
                            <div class="fieldset-datos">
                            <div class="form-item">
                                <label for="usuario">Usuario</label>
                                <div class="input-imagen">
                                    <input type="text" placeholder="tu_usuario" id="usuario" name="tboxUsuarioInicio">
                                    <i class="fas fa-lock"></i>
                                </div>
                            </div>
                            <div class="form-item">
                                    <label for="contrasenia">Contraseña</label>
                                    <div class="input-imagen">
                                        <input type="password" placeholder="contraseña" id="contrasenia" name="tboxConstrasenia">
                                        <i class="far fa-eye-slash"></i>
                                    </div>
                            </div>
                            </div>
                            <div>
                                <p>Olvide mi contraseña</p>
                                <asp:Button Text="Enviar" runat="server" class="btn" OnClick="Unnamed1_Click" />
                                
                            </div>
                    </fieldset>
                </form>
                <asp:Label ID="lblEstadoLogeo" Text="text" runat="server" />
                    <form action="contacto.asp" class="formulario formulario-registro">
                        <fieldset>
                            <h3>Registrate</h3>
                                <div class="fieldset-datos">
                                <div class="form-item">
                                    <label for="usuario-registro">Usuario</label>
                                    <div class="input-imagen">    
                                        <input type="text" id="usuario-registro" name="tboxUsuarioRegistro">
                                        <i class="far fa-user"></i>
                                    </div>
                                </div>
                                <div class="form-item">
                                    <label for="email-registro">E-mail</label>
                                    <div class="input-imagen">    
                                        <input type="email" id="email-registro" name="tboxEmailRegistro">
                                        <i class="far fa-paper-plane"></i>
                                    </div>
                                </div>
                                <div class="form-item">
                                    <label for="usuario-celular">Celular</label>
                                    <div class="input-imagen">    
                                        <input type="number" id="usuario-celular" name="tboxCelularRegistro">
                                        <i class="fas fa-phone"></i>
                                    </div>
                                </div>
                                <div class="form-item">
                                    <label for="contrasenia-registro">Contraseña</label>
                                    <div class="input-imagen">    
                                        <input type="password" id="contrasenia-registro" name="tboxContraseniaRegistro">
                                        <i class="far fa-eye-slash"></i>
                                    </div>
                                </div>
                                <div class="form-item">
                                    <label for="repetir-contrasenia-registro">Repetir Contraseña</label>
                                    <div class="input-imagen">    
                                        <input type="password" id="repetir-contrasenia-registro" name="tboxRepetirContrasenia">
                                        <i class="far fa-eye-slash"></i>
                                    </div>
                                </div>
                                <input type="submit" class="btn">
                        </fieldset>
                        
                    </form>
            </div>
        </div>

    </section>
<!--Fin section-edicion-->
</asp:Content>
