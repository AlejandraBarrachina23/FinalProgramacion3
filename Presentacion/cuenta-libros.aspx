<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta-libros.aspx.cs" Inherits="Presentacion.cuenta_libros" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link href="css/estilos.css" rel="stylesheet" />
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
        <h2 class="subtitulo">Listado de ediciones</h2>
        <div class="descripcion-seccion">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare lorem neque, et celerisque ligula tempus nec. Nam molestie leo sit amet arcu lacinia, et ullamcorper libero rutrum.</p>
        
        </div>
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
                          <p>¿Está seguro que desea eliminar "<asp:Label ID="Label1" runat="server" Text=""></asp:Label>"?</p>
                      </div>
                      <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                          <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Confirmar" OnClick="btnEliminar_Click1"/>
                      </div>
                    </div>
                  </div>
                </div>
                <asp:Label ID="Label2" runat="server" />
            <asp:Button ID="btnAgregar" type="button" class="btn btn-primary preview" data-toggle="modal" data-target=".bd-example-modal-lg" runat="server" OnClick="btnAgregar_Click" Text="Agregar"/>
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
                                                <asp:Label ID="lblISBN" runat="server" Text=""></asp:Label>
                                            </div>
                                            <div class="form-item">
                                                <label for="titulo">Título</label>
                                                <asp:TextBox ID="tboxTitulo" runat="server" ></asp:TextBox>
                                            </div>
                                            <div class="form-item">
                                                <label for="">Formato</label>
                                                <asp:DropDownList ID="ddlFormatos" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-item">
                                                <label for="anioEdicion">Año de edición</label>
                                                 <asp:TextBox ID="AnioEdicion" runat="server" Type="number" min="1960" max="2050"></asp:TextBox>
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
                                                 <asp:TextBox ID="tboxSinopsis" runat="server" TextMode="MultiLine" ></asp:TextBox>
                                            </div>
                                            <div class="form-item">
                                                <label for="formato-libro">Foto</label>
                                                <asp:Image ID="imgPortada" runat="server" Width="200" ImageUrl="~/img/imagen-no-disponible.png"/>
                                                <asp:FileUpload ID="fupImagenPortada" runat="server"  />
                                                <asp:Label ID="lblErrorImagen" runat="server" Text=""></asp:Label>
                                            </div>
                                             <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" Visible="false"/>
                                             <asp:Button ID="btnAceptar" runat="server" Text="Agregar" OnClick="btnAceptar_Click1"/>
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
                <asp:Label ID="lblISBNEliminar" runat="server" />
        
<!-- Grilla LIBROS -->
                <asp:GridView ID="grillaLibros" runat="server" CssClass="tabla" AutoGenerateColumns="False" OnSelectedIndexChanged="grillaLibros_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="grillaLibros_PageIndexChanging" PagerStyle-CssClass="pgr" OnRowDeleting="grillaLibros_RowDeleting" OnRowCommand="grillaLibros_RowCommand" >
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
      <script src="js/Preview.js">
         
        
</script>
</asp:Content>
