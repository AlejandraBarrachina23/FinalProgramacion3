﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta-home.aspx.cs" Inherits="Presentacion.WebForm8" %>
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
            <a href="cuenta-libros.aspx">
                <div class="edicion-item-imagen">
                    <img src="img/inicio-libros.jpg" alt="servicio-correcion">
                    <h3>Libros</h3>
                </div>
            <div class="edicion-item-descripcion">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
            </div>
                </a>
        </div>
        <div class="edicion-item">
            <a href="cuenta-categoria.aspx">
            <div class="edicion-item-imagen">
                <img src="img/inicio-categorias.jpg" alt="servicio-correcion">
                <h3>Categorías</h3>
            </div>
        <div class="edicion-item-descripcion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
        </div>
                </a>
    </div>
    <div class="edicion-item">
        <a href="cuenta-perfil.aspx">
        <div class="edicion-item-imagen">
            <img src="img/inicio-cuenta.jpg" alt="servicio-correcion">
            <h3>Mi cuenta</h3>
        </div>
    <div class="edicion-item-descripcion">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
    </div>
            </a>
</div>
        
    </div>
    </section>
</asp:Content>
