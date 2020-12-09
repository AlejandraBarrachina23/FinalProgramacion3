<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="error404.aspx.cs" Inherits="Presentacion.notificacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-error404">
    <div class="notificacion">
            <div class="contenedor-mediano">
                <h2>ERROR 404</h2>
                <h3>La página solicitada no existe.</h3>
                <p>Has intentando ingresar a un enlace que no está disponible.</p>
                <a href="index.aspx" class="btn">Volver al inicio</a>
            </div>      
        </div>
    </div>
</asp:Content>
