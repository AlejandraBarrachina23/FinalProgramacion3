<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaterAllPages.Master" AutoEventWireup="true" CodeBehind="cuenta-autores.aspx.cs" Inherits="Presentacion.cuenta_categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
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
         <form id="form1" runat="server">
    <div class="crud-libros">
        <div class="filtros-busqueda">
            <div class="busqueda">
                <label for="">Búsqueda</label>
                <asp:TextBox ID="tboxBusqueda" runat="server" OnTextChanged="tboxBusqueda_TextChanged"></asp:TextBox>
                <asp:Button ID="Button1" class="btn btn-busqueda" runat="server" Text="Buscar" />
            </div>
            <div class="orden">
                <label for="prdenar-libros">Ordernar</label>
                <asp:DropDownList ID="cboxOrdenarLibros" runat="server" class="cbox-busqueda" OnSelectedIndexChanged="cboxOrdenarLibros_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="0">Selecciona una opción</asp:ListItem>
                    <asp:ListItem Value="1">Nombre</asp:ListItem>
                    <asp:ListItem Value="2">Apellido</asp:ListItem>
                    <asp:ListItem Value="3">Email</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
  
<!-- Modal EDITAR-CREAR -->
            
            <asp:Button ID="btnAgregar" runat="server" type="button" Text="Agregar"  CssClass="btn btn-dtgrid" data-toggle="modal" data-target=".bd-example-modal-lg" OnClick="btnAgregar_Click" />              
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
                                        <legend>Detalle Autor</legend>
                                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Odit unde doloremque dolorem molestiae facere deleniti delectus praesentium aperiam doloribus quod corrupti.</p>
                                        <div class="fieldset-datos">
                                            <div class="form-item">
                                                <label for="CodigoAutor">Código Autor</label>
                                                <asp:TextBox ID="tboxCodigoAutor" runat="server" Enabled="false" ></asp:TextBox>
                                                <asp:Label ID="lblAutorError" runat="server" Text=""  CssClass="Error"></asp:Label>
                                            </div>
                                            <div class="form-item">
                                                <label for="tboxNombre">Nombre</label>
                                                <asp:TextBox ID="tboxNombre" runat="server" ></asp:TextBox>
                                                <asp:Label ID="lblErrorNombreAutor" runat="server" Text="" CssClass="Error"></asp:Label>
                                            </div>
                                            <div class="form-item">
                                                <label for="tboxApellido">Apellido</label>
                                                 <asp:TextBox ID="tboxApellido" runat="server" Type="text"></asp:TextBox>
                                                 <asp:Label ID="lblErrorApellido" runat="server" Text="" CssClass="Error"></asp:Label>
                                            </div>
                                            <div class="form-item">
                                                <label for="tboxCelular">Celular</label>
                                                 <asp:TextBox ID="tboxCelular" runat="server" Type="text"></asp:TextBox>
                                                 <asp:Label ID="lblErrorCelular" runat="server" Text="" CssClass="Error"></asp:Label>
                                            </div>
                                            <div class="form-item">
                                                <label for="tboxEmail">Email</label>
                                                 <asp:TextBox ID="tboxEmail" runat="server" Type="text"></asp:TextBox>
                                                 <asp:Label ID="lblErrorEmail" runat="server" Text="" CssClass="Error"></asp:Label>
                                            </div>
                                             <asp:Button ID="btnModificar" CssClass="btn" runat="server" Text="Modificar" OnClick="btnModificar_Click" OnClientClick="return ValidarAutores();"/>
                                             <asp:Button ID="btnAceptar" CssClass="btn" runat="server" Text="Agregar" OnClientClick="return ValidarAutores();" OnClick="btnAceptar_Click"/>
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
                      <div class="modal-header m-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <p class="modal-advertencia">¿Está seguro que desea eliminar "<asp:Label ID="lblAutorEliminar" runat="server" Text=""></asp:Label>
                              <asp:Label ID="lblAutorApellidoEliminar" runat="server" />
                              "?</p>
                      </div>
                      <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                          <asp:Button ID="btnEliminar" runat="server" class="btn btn-primary btn-eliminar" Text="Confirmar" OnClick="btnEliminar_Click"/>
                      </div>
                    </div>
                  </div>
                </div>
                <asp:Label ID="lblCodigoAutorEliminar" runat="server" Visible="false"/>

<!-- Modal NOTIFICACION-->

<div class="modal fade" id="modalAccionCompletadaActores" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
<asp:Label ID="lblEstado" Text="" runat="server" Visible="false"/>
<!-- Grilla LIBROS -->
                <asp:GridView ID="grillaAutores" runat="server" CssClass="tabla" AutoGenerateColumns="False" AllowPaging="True" PagerStyle-CssClass="pgr" EmptyDataText="No se encontró ningún elemento asociado a la búsqueda solicitada." ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="grillaAutores_SelectedIndexChanged" OnPageIndexChanging="grillaAutores_PageIndexChanging" OnRowCommand="grillaAutores_RowCommand" OnRowDeleting="grillaAutores_RowDeleting" >
                <Columns>
                    <asp:BoundField DataField="CodigoAutor" HeaderText="Código" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido"/>
                    <asp:BoundField DataField="Email" HeaderText="Email"/>
                    <asp:BoundField DataField="Celular" HeaderText="Celular"/>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/edit.png" SelectText="" ShowSelectButton="True" HeaderText="Actualizar"/>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/img/delete.png" ShowDeleteButton="True"/>              
                </Columns>
                <PagerStyle CssClass="pgr"></PagerStyle>
                </asp:GridView>                
            </div>
            </form>
         
 
</section>
    <script src="js/validacionesAutores.js"></script>

</asp:Content>
