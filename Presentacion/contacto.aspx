<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="contacto.aspx.cs" Inherits="Presentacion.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero">
        <h2 class="titulos-cabecera">Contacto</h2>     
     </div>
    <section class="contenedor-mediano">
        <h2 class="subtitulo">Mantegamonos en contacto</h2>
        <div class="descripcion-seccion">
            <p>Hay tantos libros como autores y cada uno con características propias, lo que convierte en muy injusto cualquier intento de dar con un costo acertado para la publicación de un libro.</p>
            <p>Para poder preparar correctamente un presupuesto, es fundamental completar el siguiente formulario:</p>
        </div> 

        <form runat="server" action="contacto.asp" class="formulario">
            <fieldset>
                <legend>Datos del solicitante</legend>
                    <div class="fieldset-datos">
                    <div class="form-item">
                        <label for="nombre">Nombre</label>
                        <input type="text" id="nombre" name="tboxNombre">
                    </div>
                    <div class="form-item">
                        <label for="apellido">Apellido</label>
                        <input type="text" id="apellido" name="tboxApellido">
                    </div>
                    <div class="form-item">
                        <label for="mail">Correo electrónico</label>
                        <input type="email" id="mail" name="tboxMail">
                    </div>
                    <div class="form-item">
                        <label for="celular">Celular</label>
                        <input type="number" id="celular" name="tboxCelular"> 
                    </div>
                    <div class="form-item">
                        <label for="radio-imagenes">¿Cómo preferís que te contacte?</label> 
                        <div class="form-item-radio">             
                            <div class="radio-item">
                                <input type="radio" id="radio-celular" name="rbtnPreferenciaContacto" value="">
                                <label for="radio-celular">Celular</label>
                            </div>
                            <div class="radio-item">
                                <input type="radio" id="radio-mail" name="rbtnPreferenciaContacto" value="">
                                <label for="radio-mail">Mail</label>
                            </div>
                            <div class="radio-item">
                                <input type="radio" id="radio-indiferente" name="rbtnPreferenciaContacto" value="">
                                <label for="radio-indiferente">Indiferente</label>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
            <fieldset>
                <legend>Datos del libro</legend>
                <div class="fieldset-datos">
                    <div class="form-item">
                        <label for="formato-libro">Formato</label>
                        <select name="cboxFormato" id="formato-libro">
                            <option value="tamanio14x20">14cmx20cm</option>
                            <option value="tamanio12x23">15cmx23cm</option>
                            <option value="tamanio20x28">20cmx28cm</option>
                        </select>
                    </div>
                    <div class="form-item">
                        <label for="formato-otros">Otro</label>
                        <input type="text" id="formato-otros" name="tboxFormatoOtros">
                    </div>
                    <div class="form-item">
                        <label for="formato-libro">Género</label>
                        <select name="cboxGenero" id="genero-libro">
                            <option value="ensayo">Ensayo</option>
                            <option value="novela">Novela</option>
                            <option value="cuento">Cuento</option>
                            <option value="poesia">Poesía</option>
                        </select>
                    </div>
                    <div class="form-item">
                        <label for="formato-otros">Otro</label>
                        <input type="text" id="genero-otros" name="tboxGeneroOtros">
                    </div>
                    <div class="form-item">
                        <label for="cantidad-caracteres">Cantidad de caracteres</label>
                        <input type="number" id="cantidad-caracteres" name="tboxCaracteres"> 
                    </div>
                    <div class="form-item">
                        <label for="cantidad-ejemplares">Cantidad de ejemplares</label>
                        <input type="number" id="cantidad-ejemplares" name="tboxCantidadEjemplares"> 
                    </div>
                    <div class="form-item">
                        <label for="radio-imagenes">Imágenes</label> 
                        <div class="form-item-radio">             
                            <div class="radio-item">
                                <input type="radio" id="radio-imagenes-si" name="rbtnImagenesSi" value="">
                                <label for="radio-celular">Sí</label>
                            </div>
                            <div class="radio-item">
                                <input type="radio" id="radio-imagenes-no" name="rbtnImagenesNo" value="">
                                <label for="radio-mail">No</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label for="cantidad-imagenes">Cantidad imágenes</label>
                        <input type="number" id="imagenes" name="tboxCantidadImagenes"> 
                    </div>
                </div>
            </fieldset>
            <asp:Button ID="btnSubmitFormContacto" runat="server" Text="Enviar" class="btn btn-form-contacto"/>
        </form>
    </section>
<!--Fin section-edicion-->

</asp:Content>
