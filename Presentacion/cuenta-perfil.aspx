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
        <form action="perfil.asp" class="formulario">
            <fieldset>
                <legend>Datos del usuario</legend>
                    <div class="perfil"> 
                    <div class="foto-perfil">
                        <img src="img/acerca-de-mi.png" alt="">
                        <p><i class="far fa-images"></i>Subir</p>
                    </div>
                    <div class="datos-perfil">
                        <div class="fieldset-datos">
                        <div class="form-item">
                            <label for="nombre-perfil">Nombre</label>
                            <input type="text" id="nombre-perfil" name="tboxNombrePerfil">
                        </div>
                        <div class="form-item">
                            <label for="apellido-perfil">Apellido</label>
                            <input type="text" id="apellido-perfil" name="tboxApellidoPerfil">
                        </div>
                        <div class="form-item">
                            <label for="correo-perfil">Correo electrónico</label>
                            <input type="text" id="mail" name="tbpxCorreoPerfil">
                        </div>
                        <div class="form-item">
                            <label for="celular-perfil">Celular</label>
                            <input type="number" id="celular-perfil" name="tboxCelularPerfil"> 
                        </div>
                        <div class="form-item">
                            <label for="telefono-perfil">Teléfono</label>
                            <input type="number" id="celular" name="tboxTelefonoPerfil"> 
                        </div>
                        <div class="form-item">
                            <label for="direccion-perfil">Dirección</label>
                            <input type="text" id="direccion-perfil" name="tboxDireccionPerfil"> 
                        </div>
                        <div class="form-item">
                            <label for="contrasenia-perfil">Contraseña</label>
                            <input type="password" id="contrasenia-perfil" name="tboxContraseniaPerfil"> 
                        </div>
                        <div class="form-item">
                            <label for="repetir-contrasenia-perfil">Repetir contraseña</label>
                            <input type="password" id="repetir-contrasenia-perfil" name="tboxRepetirContraseniaPerfil"> 
                        </div>
                    </div>
                </div>
               
            </div>
            
            </fieldset>   
        </form>
</section>
</asp:Content>
