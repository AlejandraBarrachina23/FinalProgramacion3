<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="contacto.aspx.cs" Inherits="Presentacion.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="contenedor-mediano">
        <h2 class="subtitulo">Mantegamonos en contacto</h2>
        <div class="descripcion-seccion">
            <p>Hay tantos libros como autores y cada uno con características propias, lo que convierte en muy injusto cualquier intento de dar con un costo acertado para la publicación de un libro.</p>
            <p>Para poder preparar correctamente un presupuesto, es fundamental completar el siguiente formulario:</p>
        </div> 

        <form runat="server" action="" class="formulario">
<fieldset>
                <legend>Datos del solicitante</legend>
                    <div class="fieldset-datos">
                    <div class="form-item">
                        <label for="nombre">Nombre</label>
                        <input type="text" id="nombre" name="tboxNombre" required>
                    </div>
                    <div class="form-item">
                        <label for="apellido">Apellido</label>
                        <input type="text" id="apellido" name="tboxApellido" required>
                    </div>
                    <div class="form-item">
                        <label for="mail">Correo electrónico</label>
                        <input type="email" id="mail" name="tboxMail" required>
                    </div>
                    <div class="form-item">
                        <label for="celular">Celular</label>
                        <input type="number" id="celular" name="tboxCelular" required> 
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
                                <input type="radio" id="radio-indiferente" name="rbtnPreferenciaContacto" value="" checked>
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
                        <label for="ddl-formato-libro">Formato</label>
                        <select name="cboxFormato" id="ddl-formato-libro">
                            <option value="" disabled selected>Seleccione un Formato</option>
                            <option value="tamanio14x20">14cmx20cm</option>
                            <option value="tamanio12x23">15cmx23cm</option>
                            <option value="tamanio20x28">20cmx28cm</option>
                            <option value="otros">Otros</option>
                        </select>
                    </div>
                    <div class="form-item">
                        <label for="formato-otros">Otro</label>
                        <input type="text" id="tbox-formato-otros" name="tboxFormatoOtros" disabled>
                    </div>
                    <div class="form-item">
                        <label for="formato-libro">Género</label>
                        <select name="cboxGenero" id="ddl-genero-libro">
                            <option value="" disabled selected>Seleccione un género</option>
                            <option value="ensayo">Ensayo</option>
                            <option value="novela">Novela</option>
                            <option value="cuento">Cuento</option>
                            <option value="poesia">Poesía</option>
                            <option value="otros">Otros</option>
                        </select>
                    </div>
                    <div class="form-item">
                        <label for="formato-otros">Otro</label>
                        <input type="text" id="tbox-genero-otros" name="tboxGeneroOtros" disabled>
                    </div>
                    <div class="form-item">
                        <label for="cantidad-caracteres">Cantidad de caracteres</label>
                        <input type="number" id="cantidad-caracteres" name="tboxCaracteres" min=1> 
                    </div>
                    <div class="form-item">
                        <label for="cantidad-ejemplares">Cantidad de ejemplares</label>
                        <input type="number" id="cantidad-ejemplares" name="tboxCantidadEjemplares" min=50> 
                    </div>
                    <div class="form-item">
                        <label for="radio-imagenes">Imágenes</label> 
                        <div class="form-item-radio">             
                            <div class="radio-item">
                                <input type="radio" id="radio-imagenes-si" name="rbtnImagenes" value="Si">
                                <label for="radio-celular">Sí</label>
                            </div>
                            <div class="radio-item">
                                <input type="radio" id="radio-imagenes-no" name="rbtnImagenes" value="No">
                                <label for="radio-mail">No</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-item">
                        <label for="cantidad-imagenes">Cantidad imágenes</label>
                        <input type="number" id="tbox-imagenes" name="tboxCantidadImagenes" disabled min=1> 
                    </div>
                </div>
                
            </fieldset>
            <asp:Button ID="btnSubmitFormContacto" runat="server" Text="Enviar" class="btn btn-form-contacto" OnClick="btnSubmitFormContacto_Click"/>
        </form>

    </section>
    <script src="js/contacto.js"></script>
<!--Fin section-edicion-->

</asp:Content>
