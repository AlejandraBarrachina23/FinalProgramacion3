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

            //CARGO GRID
            grillaLibros.DataSource = unLibroNegocio.ListadoLibros();
            grillaLibros.DataBind();

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
                ddlAutores.DataValueField = "CodigoEditorial";
                ddlAutores.DataTextField = "NombreEditorial";
                ddlEditorial.DataBind();

            }
           
            //OCULTO VENTANAS EMERGENTES
            modal.Visible = false;
        }

        protected void grillaLibros_SelectedIndexChanged(object sender, EventArgs e)
        {
            LibroNegocio unLibroNegocio = new LibroNegocio();

            // VARIABLE QUE ALMACENA EL INDICE DE LA FILA SELECCIONADA, SE AJUSTA CON LA PAGINACIÓN
            int IndexRow = grillaLibros.SelectedIndex + (grillaLibros.PageIndex * grillaLibros.PageSize);

            //precarga de datos
            Libro LibroSeleccionado = new Libro();
            LibroSeleccionado.Formato = new Formato();
            LibroSeleccionado.Editorial = new Editorial();
            LibroSeleccionado.Autor = new Autor();

            //SACO LOS DATOS DE LA FILA SELECCIONADA
            LibroSeleccionado = unLibroNegocio.ListadoLibros()[IndexRow];            

            //CARGO TEXTBOX
            tboxIsbn.Text = LibroSeleccionado.ISBN.ToString();
            tboxTitulo.Text = LibroSeleccionado.Titulo.ToString();
            tboxSinopsis.Text = LibroSeleccionado.Sinopsis;
            AnioEdicion.Text = LibroSeleccionado.AnioEdicion.ToString();
            
            //CARGO DROP DOWN LIST
            ddlFormatos.Items.FindByValue(LibroSeleccionado.Formato.CodigoFormato.ToString()).Selected = true;
            ddlAutores.Items.FindByValue(LibroSeleccionado.Autor.CodigoAutor.ToString()).Selected = true;
            ddlEditorial.Items.FindByValue(LibroSeleccionado.Editorial.CodigoEditorial.ToString()).Selected = true;
            
            //CARGO LA PORTADA
            imgPortada.ImageUrl = LibroSeleccionado.Portada;
            
            //HABILITO Y DESHABILITO LOS BOTONES
            btnAceptar.Visible = false;
            btnModificar.Visible = true;
            tboxIsbn.Enabled = false;
                     
        }

        protected void grillaLibros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LibroNegocio unLibroNegocio = new LibroNegocio();
            grillaLibros.PageIndex = e.NewPageIndex;
            grillaLibros.DataSource = unLibroNegocio.ListadoLibros();
            grillaLibros.DataBind();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            modal.Visible = false;
            LimpiarFormulario();
        }

        protected void grillaLibros_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            LibroNegocio unLibroNegocio = new LibroNegocio();
            unLibroNegocio.EliminarLibro(tboxIsbn.Text);
        }

        protected void grillaLibros_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Select") modal.Visible = true;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            
            LimpiarFormulario();
            modal.Visible = true;
            btnModificar.Visible = false;
            btnAceptar.Visible = true;
            tboxIsbn.Enabled = true;
        }

        protected void btnAceptar_Click1(object sender, EventArgs e)
        {
            /*HttpPostedFile -> La HttpFileCollection clase proporciona acceso a todos los archivos que se cargan 
            desde un cliente como una colección de archivos.*/

            //CAPTURA DE LA IMAGEN DEL FILE UPLOAD
            HttpPostedFile imagenCargada = fupImagenPortada.PostedFile;

            if (VerificarImagen(imagenCargada))
            {
                Libro unNuevoLibro = new Libro();
                LibroNegocio unLibroNegocio = new LibroNegocio();

                //ASIGNO A LA RUTA DE LA IMAGEN 
                imgPortada.ImageUrl = guardarImagen(imagenCargada, tboxIsbn.Text);
                imgPortada.DataBind();

                unNuevoLibro.setearLibro(tboxIsbn.Text, tboxTitulo.Text, Convert.ToInt32(ddlFormatos.SelectedItem.Value), tboxSinopsis.Text, Convert.ToInt32(AnioEdicion.Text), Convert.ToInt32(ddlAutores.SelectedItem.Value), Convert.ToInt32(ddlEditorial.SelectedItem.Value),imgPortada.ImageUrl);
                //unLibroNegocio.AgregarLibro(unNuevoLibro);

            }

            else
            {
            
            }
          
        }

        protected string guardarImagen(HttpPostedFile imagenCargada, string nombreImagen) {

            //NOMBRE DE LA IMAGEN
            string NombreArchivo = Path.GetFileName(imagenCargada.FileName);
            //EXTENSION DE LA IMAGEN
            string fileExtension = Path.GetExtension(NombreArchivo);
            //SE GUARDA LA IMAGEN
            imagenCargada.SaveAs(Server.MapPath("~/img/portadas/") + nombreImagen + fileExtension);
            //RUTA DE IMAGEN
            string ruta = "~/img/portadas/" + nombreImagen + fileExtension;

            return ruta;

        }

        protected bool VerificarImagen(HttpPostedFile imagenCargada) {

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
        protected bool VerificarTamanioImagen(double tamanioImagen, double tamanioPermitido) {

            if (tamanioImagen > tamanioPermitido) return false;
            else return true;
        }

        protected bool VerificarExtensionImagen(string extensionImagen) {

            if (extensionImagen.ToLower() == ".jpg" || extensionImagen.ToLower() == ".png" ||
                extensionImagen.ToLower() == ".jpeg" || extensionImagen.ToLower() == ".bmp") return true;

            else return false;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            HttpPostedFile imagenCargada = fupImagenPortada.PostedFile;
            int tamanioArchivo = imagenCargada.ContentLength;
            string NombreArchivo = Path.GetFileName(imagenCargada.FileName);
            string fileExtension = Path.GetExtension(NombreArchivo);
            

            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" ||
                fileExtension.ToLower() == ".jpeg" || fileExtension.ToLower() == ".bmp")
            {

                Libro unNuevoLibro = new Libro();
                LibroNegocio unLibroNegocio = new LibroNegocio();
                
                unNuevoLibro.Formato = new Formato();
                unNuevoLibro.ISBN = tboxIsbn.Text;
                unNuevoLibro.Titulo = tboxTitulo.Text;
                unNuevoLibro.Formato.CodigoFormato = ddlFormatos.SelectedIndex;
                unNuevoLibro.Sinopsis = tboxSinopsis.Text;
                unNuevoLibro.AnioEdicion = Convert.ToInt32(AnioEdicion.Text);
                                

                imagenCargada.SaveAs(Server.MapPath("~/img/portadas/") + unNuevoLibro.ISBN + fileExtension);
                imgPortada.ImageUrl = "~/img/portadas/" + unNuevoLibro.ISBN+ fileExtension;

                unNuevoLibro.Portada = imgPortada.ImageUrl;
                imgPortada.ImageUrl = unNuevoLibro.Portada;
                imgPortada.DataBind();

                
                unLibroNegocio.ModificarLibro(unNuevoLibro);
                

            }

            else
            {

                
            }
        }

        private void LimpiarFormulario() {

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
    }
}