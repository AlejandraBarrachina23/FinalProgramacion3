<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta-home.aspx.cs" Inherits="Presentacion.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="contenedor-mediano">
        <h2 class="subtitulo">Bienvenido</h2>
        <div class="descripcion-seccion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
        </div>
    <div class="edicion-servicios">
        <div class="edicion-item">
                <div class="edicion-item-imagen">
                    <img src="img/inicio-libros.jpg" alt="servicio-correcion">
                    <a href="cuenta-libros.aspx"><h3>Libros</h3></a>
                </div>
            <div class="edicion-item-descripcion">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
            </div>
                
        </div>
        <div class="edicion-item">
            <div class="edicion-item-imagen">
                <img src="img/inicio-categorias.jpg" alt="servicio-correcion">
                <a href="cuenta-autores.aspx"><h3>Autores</h3></a>
            </div>
        <div class="edicion-item-descripcion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
        </div>
                
    </div>
    <div class="edicion-item">
       
        <div class="edicion-item-imagen">
            <img src="img/inicio-cuenta.jpg" alt="servicio-correcion">
             <a href="cuenta-perfil.aspx"><h3>Mi cuenta</h3></a>
        </div>
    <div class="edicion-item-descripcion">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
    </div>
            
</div>
        
    </div>
    </section>
</asp:Content>
