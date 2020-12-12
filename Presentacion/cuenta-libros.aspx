<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta-libros.aspx.cs" Inherits="Presentacion.cuenta_libros" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- LINK -->

<link href="css/estilos.css" rel="stylesheet" />


<section class="contenedor-mediano">
<!-- OPCIONES GENERALES -->   
    <h2 class="subtitulo">Opciones generales</h2>
    <div class="descripcion-seccion">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
        <nav>
            <ul class="menu-administrador">
                <li><a href="cuenta-perfil.aspx"><i class="fas fa-users"></i>Mi cuenta</a></li>
                <li><a href="cuenta-autores.aspx"><i class="fas fa-theater-masks"></i>Autores</a></li>
                <li><a href="cuenta-libros.aspx"><i class="fas fa-book"></i>Libros</li></a>
            </ul>    
        </nav>
    </div>
    <h2 class="subtitulo">Listado de ediciones</h2>
    <div class="descripcion-seccion">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
    </div>

<!-- BUSQUEDA -->
    <div class="crud-libros">
        <div class="filtros-busqueda">
            <div class="busqueda">
                <label for="">Búsqueda</label>
                <input type="text">
            </div>
            <div class="orden">
                <label for="prdenar-libros">Ordernar por</label>
                <select name="cboxOrdenarLibros" id="ordenar-libros">
                    <option value="">Alfabéticamente: A-Z</option>
                    <option value="">Alfabéticamente: Z-A</option>
                    <option value="">Año de edición</option>
                </select>
            </div>
        </div>

        <form id="form1" runat="server">
        
<!-- Modal EDITAR-CREAR -->
            
            <asp:Button ID="Button1" runat="server" type="button" Text="Agregar" OnClick="btnAgregar_Click" CssClass="btn" data-toggle="modal" data-target=".bd-example-modal-lg" />              
              
                    
                <div id="mymodal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content ">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body descripcion-libro">
                                    <asp:Panel ID="modal" runat="server" CssClass="ventana-emergente">
                                        <fieldset>
                                        <legend>Detalle libro</legend>
                                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Odit unde doloremque dolorem molestiae facere deleniti delectus praesentium aperiam doloribus quod corrupti.</p>
                                        <div class="fieldset-datos">
                                            <div class="form-item">
                                                <label for="ISBN">ISBN</label>
                                                <asp:TextBox ID="tboxIsbn" runat="server" ></asp:TextBox>
                                                <asp:Label ID="lblISBN" runat="server" Text=""  CssClass="Error"></asp:Label>
                                            </div>
                                            <div class="form-item">
                                                <label for="titulo">Título</label>
                                                <asp:TextBox ID="tboxTitulo" runat="server" ></asp:TextBox>
                                                <asp:Label ID="lblTitulo" runat="server" Text="" CssClass="Error"></asp:Label>
                                            </div>
                                            <div class="form-item">
                                                <label for="">Formato</label>
                                                <asp:DropDownList ID="ddlFormatos" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-item">
                                                <label for="anioEdicion">Año de edición</label>
                                                 <asp:TextBox ID="AnioEdicion" runat="server" Type="number" min="1960" max="2050"></asp:TextBox>
                                                 <asp:Label ID="lblAnioEdicion" runat="server" Text="" CssClass="Error"></asp:Label>
                                            </div>
                                            <div class="form-item">
                                                <label for="formato-libro">Autores</label>
                                                <asp:DropDownList ID="ddlAutores" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-item">
                                                <label for="formato-libro">Editoriales</label>
                                                <asp:DropDownList ID="ddlEditorial" runat="server"></asp:DropDownList>
                                            </div>
                                              <div class="form-item">
                                                <label for="formato-libro">Sinopsis</label>
                                                 <asp:TextBox ID="tboxSinopsis" runat="server" TextMode="MultiLine" Height="350" ></asp:TextBox>
                                                 <asp:Label ID="lblSinopsis" runat="server" Text="" CssClass="Error"></asp:Label>
                                            </div>
                                            <div class="form-item item-portada">
                                                <label for="formato-libro">Portada</label>
                                                <asp:Image ID="imgPortada" runat="server" Width="300" ImageUrl="~/img/imagen-no-disponible.png"/>
                                                <asp:FileUpload ID="fupImagenPortada" runat="server"  />
                                                <asp:Label ID="lblErrorImagen" CssClass="Error" runat="server" Text=""></asp:Label>
                                            </div>
                                             <asp:Button ID="btnModificar" CssClass="btn" runat="server" Text="Modificar" OnClick="btnModificar_Click"/>
                                             <asp:Button ID="btnAceptar" CssClass="btn" runat="server" Text="Agregar" OnClick="btnAceptar_Click1" OnClientClick="return validarABML();"/>
                                        </div>
                                    </fieldset>
                                   </asp:Panel>
                          </div>  
                         </div>
                          </div>
         </div>
                
<!-- Modal ELIMINAR -->
        
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <p>¿Está seguro que desea eliminar "<asp:Label ID="lblTituloEliminar" runat="server" Text=""></asp:Label>"?</p>
                      </div>
                      <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                          <asp:Button ID="btnEliminar" runat="server" class="btn btn-primary" Text="Confirmar" OnClick="btnEliminar_Click1"/>
                      </div>
                    </div>
                  </div>
                </div>
                <asp:Label ID="lblISBNEliminar" runat="server" Visible="false"/>

<!-- Modal NOTIFICACION-->

<div class="modal fade" id="modalAccionCompletada" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content m-contenido">
      <div class="modal-header m-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <i class="far fa-check-circle m-icono"></i>
       <p>Acción completada exitosamente</p>
      </div>
            
    </div>
  </div>
</div>

    <!--Fin Ventana modal-->
        
<!-- Grilla LIBROS -->
                <asp:GridView ID="grillaLibros" runat="server" CssClass="tabla" AutoGenerateColumns="False" OnSelectedIndexChanged="grillaLibros_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="grillaLibros_PageIndexChanging" PagerStyle-CssClass="pgr" OnRowDeleting="grillaLibros_RowDeleting" OnRowCommand="grillaLibros_RowCommand" EmptyDataText="No se encontró ningún elemento asociado a la búsqueda solicitada." ShowHeaderWhenEmpty="True" >
                <Columns>
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                    <asp:BoundField DataField="Titulo" HeaderText="Título" />
                    <asp:BoundField DataField="AnioEdicion" HeaderText="Año"/>
                    <asp:BoundField DataField="Autor" HeaderText="Autor" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/edit.png" SelectText="" ShowSelectButton="True" HeaderText="Actualizar"/>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/img/delete.png" ShowDeleteButton="True"/>              
                </Columns>
                <PagerStyle CssClass="pgr"></PagerStyle>
                </asp:GridView>                
         
            </form>
         
    </div>
</section>
    <script src="js/validacionesGenerales.js" ></script>
    <script src="js/validacionesABML.js"></script>
    <script src="js/Preview.js"></script>
         
        
</asp:Content>
