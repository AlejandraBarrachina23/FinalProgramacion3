using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using Negocio;
using Dominio;


namespace Presentacion
{
    public partial class cuenta_libros : System.Web.UI.Page
    {
        private int IndexRow;

        protected void Page_Load(object sender, EventArgs e)
        {

            LibroNegocio unLibroNegocio = new LibroNegocio();
            FormatoNegocio unFormatoNegocio = new FormatoNegocio();
            AutorNegocio unAutorNegocio = new AutorNegocio();
            EditorialNegocio unaEditorialNegocio = new EditorialNegocio();


            if (!IsPostBack)
            {
                //CARGO DROW DOWN LIST -> FORMATO
                ddlFormatos.DataSource = unFormatoNegocio.ListadoFormato();
                ddlFormatos.DataTextField = "Medidas";
                ddlFormatos.DataValueField = "CodigoFormato";
                ddlFormatos.DataBind();

                //CARGO DROW DOWN LIST -> AUTORES
                ddlAutores.DataSource = unAutorNegocio.ListadoAutores();
                ddlAutores.DataValueField = "CodigoAutor";
                ddlAutores.DataTextField = "Nombre";
                ddlAutores.DataBind();

                //CARGO DROW DOWN LIST -> EDITORIALES
                ddlEditorial.DataSource = unaEditorialNegocio.ListarEditoriales();
                ddlEditorial.DataValueField = "CodigoEditorial";
                ddlEditorial.DataTextField = "NombreEditorial";
                ddlEditorial.DataBind();

                //CARGO GRID -> LIBROS

                Session["ListadoLibros"] = unLibroNegocio.ListadoLibros();
                grillaLibros.DataSource = Session["ListadoLibros"];
                grillaLibros.DataBind();

            }

            //CARGO DATOS DE USUARIO
            Usuario usuarioActivo = (Usuario)Session["UsuarioLogeado"];

            if (Session["UsuarioLogeado"] != null && usuarioActivo.TipoUsuario)
            {
                HyperLink linkPerfil = (HyperLink)Master.FindControl("hplnkLogin");
                linkPerfil.Text = usuarioActivo.NombreUsuario;
                linkPerfil.NavigateUrl = "~/cuenta-home.aspx";
            }

            else
            {
                Response.Redirect("error404.aspx");
            }
        }



        protected void grillaLibros_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                //PRECARGA DE DATOS EN EL FORMULARIO OCULTO
                LibroNegocio unLibroNegocio = new LibroNegocio();


                //precarga de datos
                Libro LibroSeleccionado = new Libro();
                LibroSeleccionado.Formato = new Formato();
                LibroSeleccionado.Editorial = new Editorial();
                LibroSeleccionado.Autor = new Autor();

                GridViewRow rowSeleccionada = grillaLibros.SelectedRow;
                string ISBN = rowSeleccionada.Cells[0].Text;
                LibroSeleccionado = unLibroNegocio.LibroSeleccionado(ISBN);

                //CARGO TEXTBOX
                tboxIsbn.Text = LibroSeleccionado.ISBN.ToString();
                tboxTitulo.Text = LibroSeleccionado.Titulo.ToString();
                tboxSinopsis.Text = LibroSeleccionado.Sinopsis;
                AnioEdicion.Text = LibroSeleccionado.AnioEdicion.ToString();

                //CARGO DROP DOWN LIST
                ResetearDDL();
                ddlFormatos.Items.FindByValue(LibroSeleccionado.Formato.CodigoFormato.ToString()).Selected = true;
                ddlAutores.Items.FindByValue(LibroSeleccionado.Autor.CodigoAutor.ToString()).Selected = true;
                ddlEditorial.Items.FindByValue(LibroSeleccionado.Editorial.CodigoEditorial.ToString()).Selected = true;

                //CARGO LA PORTADA
                imgPortada.ImageUrl = LibroSeleccionado.Portada;

                //HABILITO Y DESHABILITO LOS BOTONES
                tboxIsbn.Enabled = false;
            }
            catch (Exception exc)
            {

                throw;
            }

        }

        protected void grillaLibros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            LibroNegocio unLibroNegocio = new LibroNegocio();
            grillaLibros.PageIndex = e.NewPageIndex;
            grillaLibros.DataSource = Session["ListadoLibros"];
            grillaLibros.DataBind();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        protected void grillaLibros_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //TOMO EL VALOR DEL LIBRO A ELIMINAR
            lblTituloEliminar.Text = e.Values[1].ToString();
            lblISBNEliminar.Text = e.Values[0].ToString();

        }

        protected void grillaLibros_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            //VERIFICO QUE COMANDO ACTIVO EL EVENTO PARA PODER DESPLEGAR LA VENTANA EMERGENTE ASOCIADA

            if (e.CommandName == "Select")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
                btnModificar.Visible = true;
                btnAceptar.Visible = false;


            }

            if (e.CommandName == "Delete")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EliminarModal", "$('#exampleModalCenter').modal({show:true});", true);
            }


        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
            LimpiarFormulario();
            tboxIsbn.Enabled = true;
            btnModificar.Visible = false;
            btnAceptar.Visible = true;

        }

        protected void btnAceptar_Click1(object sender, EventArgs e)
        {

            tboxIsbn.Enabled = true;
            /*HttpPostedFile -> La HttpFileCollection clase proporciona acceso a todos los archivos que se cargan 
            desde un cliente como una colección de archivos.*/

            //CAPTURA DE LA IMAGEN DEL FILE UPLOAD
            lblISBN.Text = "";
            lblErrorImagen.Text = "";

            HttpPostedFile imagenCargada = fupImagenPortada.PostedFile;
            LibroNegocio unLibroNegocio = new LibroNegocio();

            //VERIFICA SI LA IMAGEN CUMPLES LOS REQUISITOS O SINO CARGO NINGUNA IMAGEN

            if (VerificarUpload(imagenCargada) || VerificarImagen(imagenCargada))
            {
                Libro unNuevoLibro = new Libro();

                //ASIGNO A LA RUTA DE LA IMAGEN 
                imgPortada.ImageUrl = guardarImagen(imagenCargada, tboxIsbn.Text);
                imgPortada.DataBind();


                if (unLibroNegocio.ValidarISBN(tboxIsbn.Text) != 0)
                {
                    lblISBN.Text = "ISBN Repetido";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
                }

                else
                {

                    unNuevoLibro.setearLibro(tboxIsbn.Text, tboxTitulo.Text, Convert.ToInt32(ddlFormatos.SelectedItem.Value), tboxSinopsis.Text, Convert.ToInt32(AnioEdicion.Text),
                    Convert.ToInt32(ddlAutores.SelectedItem.Value), Convert.ToInt32(ddlEditorial.SelectedItem.Value), imgPortada.ImageUrl);
                    unLibroNegocio.AgregarLibro(unNuevoLibro);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalAccionesCompleta", "$('#modalAccionCompletada').modal({show:true});", true);
                    grillaLibros.DataSource = unLibroNegocio.ListadoLibros();
                    grillaLibros.DataBind();

                }

            }

            else
            {

                lblErrorImagen.Text = "La imagen no cumple con las condiciones";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);

            }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

            lblISBN.Text = "";
            lblErrorImagen.Text = "";

            HttpPostedFile imagenCargada = fupImagenPortada.PostedFile;
            LibroNegocio unLibroNegocio = new LibroNegocio();
            Libro unNuevoLibro = new Libro();
            //cumple condiciones o es la por defecto

            if (VerificarUpload(imagenCargada))
            {
                unNuevoLibro.setearLibro(tboxIsbn.Text, tboxTitulo.Text, Convert.ToInt32(ddlFormatos.SelectedItem.Value), tboxSinopsis.Text, Convert.ToInt32(AnioEdicion.Text),
                Convert.ToInt32(ddlAutores.SelectedItem.Value), Convert.ToInt32(ddlEditorial.SelectedItem.Value), imgPortada.ImageUrl);

                unLibroNegocio.ModificarLibro(unNuevoLibro);
            }

            else if (VerificarImagen(imagenCargada))
            {

                //ASIGNO A LA RUTA DE LA IMAGEN 
                imgPortada.ImageUrl = guardarImagen(imagenCargada, tboxIsbn.Text);

                unNuevoLibro.setearLibro(tboxIsbn.Text, tboxTitulo.Text, Convert.ToInt32(ddlFormatos.SelectedItem.Value), tboxSinopsis.Text, Convert.ToInt32(AnioEdicion.Text),
                Convert.ToInt32(ddlAutores.SelectedItem.Value), Convert.ToInt32(ddlEditorial.SelectedItem.Value), imgPortada.ImageUrl);
                unLibroNegocio.ModificarLibro(unNuevoLibro);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalAccionesCompletaModificar", "$('#modalAccionCompletada').modal({show:true});", true);
            }

            else
            {

                lblErrorImagen.Text = "La imagen no cumple con las condiciones";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
            }

            imgPortada.DataBind();
            grillaLibros.DataSource = unLibroNegocio.ListadoLibros();
            grillaLibros.DataBind();

        }

        protected string guardarImagen(HttpPostedFile imagenCargada, string nombreImagen)
        {

            string ruta = "";

            if (VerificarUpload(imagenCargada))
            {
                //IMAGEN POR DEFECTO
                ruta = "~/img/portadas/" + "imagen-no-disponible" + ".png";

            }
            else
            {

                //NOMBRE DE LA IMAGEN
                string NombreArchivo = Path.GetFileName(imagenCargada.FileName);
                //EXTENSION DE LA IMAGEN
                string fileExtension = Path.GetExtension(NombreArchivo);
                //SE GUARDA LA IMAGEN
                imagenCargada.SaveAs(Server.MapPath("~/img/portadas/") + nombreImagen + fileExtension);
                //RUTA DE IMAGEN
                ruta = "~/img/portadas/" + nombreImagen + fileExtension;
            }

            return ruta;

        }

        protected bool VerificarImagen(HttpPostedFile imagenCargada)
        {

            //NOMBRE DE LA IMAGEN
            string NombreArchivo = Path.GetFileName(imagenCargada.FileName);
            //EXTENSION DE LA IMAGEN
            string fileExtension = Path.GetExtension(NombreArchivo);
            //TAMAÑO DE IMAGEN
            int tamanioArchivo = imagenCargada.ContentLength;
            //DEFINO TAMAÑO MAXIMO DEL ARCHIVO (2MB)
            double tamanioMaximo = 2e+6;

            if (VerificarTamanioImagen(tamanioArchivo, tamanioMaximo) && VerificarExtensionImagen(fileExtension)) return true;
            else return false;

        }

        //VALIDACIONES
        protected bool VerificarTamanioImagen(double tamanioImagen, double tamanioPermitido)
        {

            if (tamanioImagen > tamanioPermitido) return false;
            else return true;
        }

        protected bool VerificarExtensionImagen(string extensionImagen)
        {

            if (extensionImagen.ToLower() == ".jpg" || extensionImagen.ToLower() == ".png" ||
                extensionImagen.ToLower() == ".jpeg" || extensionImagen.ToLower() == ".bmp") return true;

            else return false;
        }

        protected bool VerificarUpload(HttpPostedFile imagenCargada)
        {

            if (imagenCargada.ContentLength == 0) return true;
            else return false;

        }

        private void LimpiarFormulario()
        {

            LimpiarCombobox();
            LimpiarImagen();
            LimpiarInput();
        }

        private void LimpiarInput()
        {

            foreach (TextBox tbox in modal.Controls.OfType<TextBox>())
            {
                tbox.Text = "";
            }

        }

        private void LimpiarCombobox()
        {

            foreach (DropDownList lista in modal.Controls.OfType<DropDownList>())
            {
                lista.SelectedIndex = 0;
            }
        }

        private void LimpiarImagen()
        {
            imgPortada.ImageUrl = "~/img/imagen-no-disponible.png";
        }

        private void ResetearDDL()
        {

            foreach (DropDownList ddl in modal.Controls.OfType<DropDownList>())
            {
                ddl.SelectedIndex = -1;
            }
        }


        protected void btnEliminar_Click1(object sender, EventArgs e)
        {
            LibroNegocio unLibroNegocio = new LibroNegocio();
            unLibroNegocio.EliminarLibro(lblISBNEliminar.Text);
            grillaLibros.DataSource = unLibroNegocio.ListadoLibros();
            grillaLibros.DataBind();
        }

        protected void ddlFiltroLibros_SelectedIndexChanged(object sender, EventArgs e)
        {
            LibroNegocio unLibroNegocio = new LibroNegocio();
            List<Libro> ListadoLibros = (List<Libro>)Session["ListadoLibros"];

            if (tboxBusqueda.Text != "")
            {

                ordenarLibros(ddlFiltroLibros, ListadoLibros);

            }

            else
            {

                ListadoLibros = unLibroNegocio.ListadoLibros();
                ordenarLibros(ddlFiltroLibros, ListadoLibros);

            }

        }

        protected void btnBusqueda_Click(object sender, EventArgs e)
        {
            LibroNegocio unLibroNegocio = new LibroNegocio();
            List<Libro> ListadoAutores = new List<Libro>();
            ListadoAutores = unLibroNegocio.ListadoLibros();
            Session["ListadoLibros"] = ListadoAutores.FindAll(x => x.Titulo.ToLower().Contains(tboxBusqueda.Text.ToLower()));
            grillaLibros.DataSource = Session["ListadoLibros"];
            grillaLibros.DataBind();
        }

        protected void ordenarLibros(DropDownList ddlLibros, List<Libro> ListadoLibros)
        {


            if (ddlLibros.SelectedIndex == 1)
            {
                Session["ListadoLibros"] = ListadoLibros.OrderBy(x => x.Titulo).ToList<Libro>();
                grillaLibros.DataSource = Session["ListadoLibros"];
                grillaLibros.DataBind();
            }
            else if (ddlLibros.SelectedIndex == 2)
            {
                Session["ListadoLibros"] = ListadoLibros.OrderBy(x => x.Autor.Nombre).ToList<Libro>();
                grillaLibros.DataSource = Session["ListadoLibros"];
                grillaLibros.DataBind();
            }
        }
    }
}