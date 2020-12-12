<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="notificacion.aspx.cs" Inherits="Presentacion.notificacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-error404">
    <div class="notificacion">
            <div class="contenedor-mediano">
                <h2>GRACIAS POR VISITARNOS</h2>
                <h3>Tu sesión de usuario ha sido cerrada</h3>
                <p>Haz click en siguiente botón para volver al inicio.</p>
                <a href="index.aspx" class="btn">Volver al inicio</a>
            </div>      
        </div>
    </div>
</asp:Content>
