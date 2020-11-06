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
            grillaLibros.DataSource = unLibroNegocio.ListadoLibros();
            grillaLibros.DataBind();
            ddlFormatos.DataSource = unFormatoNegocio.ListadoFormato();
            ddlFormatos.DataBind();
            ddlAutores.DataSource = unAutorNegocio.ListadoAutores();
            ddlAutores.DataBind();
            modal.Visible = false;

        }

        protected void btnEditar_Click(object sender, EventArgs e) {


            
            modal.Visible = true;

            // se obtiene el indice de la fila seleccionada y con se ajusta segun la paginacion

            LibroNegocio unLibroNegocio = new LibroNegocio();

            //precarga de datos
            Libro LibroSeleccionado = unLibroNegocio.ListadoLibros()[IndexRow];
            tboxIsbn.Text = LibroSeleccionado.ISBN.ToString();
            tboxTitulo.Text = LibroSeleccionado.Titulo.ToString();
            tboxSinopsis.Text = LibroSeleccionado.Sinopsis;
            AnioEdicion.Text = LibroSeleccionado.AnioEdicion.ToString();
            ddlFormatos.SelectedIndex = (LibroSeleccionado.CodigoFormato.CodigoFormato - 1);
            ddlAutores.SelectedIndex = (LibroSeleccionado.CodigoAutor.CodigoAutor - 1);

        }

        protected void grillaLibros_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            int IndexRow = grillaLibros.SelectedIndex + (grillaLibros.PageIndex * grillaLibros.PageSize);
            // se obtiene el indice de la fila seleccionada y con se ajusta segun la paginacion
            /* 
             LibroNegocio unLibroNegocio = new LibroNegocio();

             //precarga de datos
             Libro LibroSeleccionado = unLibroNegocio.ListadoLibros()[IndexRow];
             tboxIsbn.Text = LibroSeleccionado.ISBN.ToString();
             tboxTitulo.Text = LibroSeleccionado.Titulo.ToString();
             tboxSinopsis.Text = LibroSeleccionado.Sinopsis;
             AnioEdicion.Text = LibroSeleccionado.AnioEdicion.ToString();
             ddlFormatos.SelectedIndex = (LibroSeleccionado.CodigoFormato.CodigoFormato - 1);
             ddlAutores.SelectedIndex = (LibroSeleccionado.CodigoAutor.CodigoAutor - 1);
             modal.Visible = true;

             byte[] bitmap = LibroSeleccionado.Portada;


             string strBase64 = Convert.ToBase64String(LibroSeleccionado.Portada);
             imgPortada.ImageUrl = "data:Image/jpg;base64,{0}" + strBase64;
           
            lblIndex.Text = strBase64;
             */
        }

        protected void grillaLibros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LibroNegocio unLibroNegocio = new LibroNegocio();
            grillaLibros.PageIndex = e.NewPageIndex;
            grillaLibros.DataSource = unLibroNegocio.ListadoLibros();
            grillaLibros.DataBind();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            try
            {
                /*HttpPostedFile -> La HttpFileCollection clase proporciona acceso a todos los archivos que se cargan 
                desde un cliente como una colección de archivos. La HttpPostedFile clase proporciona propiedades y 
                métodos para obtener información sobre un archivo individual y para leer y guardar el archivo.*/
                HttpPostedFile imagenCargada = fupImagenPortada.PostedFile;
                
                int tamanioArchivo = imagenCargada.ContentLength;
                //2MB MAXIMO
                ValidarTamanioImagen(2e+6, tamanioArchivo);
                            
               

                //if (imagenCargada.ContentLength > tamanioMaximoValido) { 
                //        lblIndex.Text = imagenCargada.ContentLength + "MUY GRANDE";
                //        fupImagenPortada.Dispose();

                //    }
                //else
                //        lblIndex.Text = imagenCargada.ContentLength + "PERFECTO";

                string NombreArchivo = Path.GetFileName(imagenCargada.FileName);
                string fileExtension = Path.GetExtension(NombreArchivo);

                //FORMATOS VALIDOS
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" ||
                    fileExtension.ToLower() == ".jpeg" || fileExtension.ToLower() == ".bmp")
                {

                    Libro unNuevoLibro = new Libro();
                    LibroNegocio unLibroNegocio = new LibroNegocio();
                    unNuevoLibro.CodigoFormato = new Formato();
                    unNuevoLibro.ISBN = tboxIsbn.Text;
                    unNuevoLibro.Titulo = tboxTitulo.Text;
                    unNuevoLibro.CodigoFormato.CodigoFormato = ddlFormatos.SelectedIndex;
                    unNuevoLibro.Sinopsis = tboxSinopsis.Text;
                    unNuevoLibro.AnioEdicion = Convert.ToInt32(AnioEdicion.Text);

                    imagenCargada.SaveAs(Server.MapPath("~/img") + NombreArchivo + fileExtension);
                    imgPortada.ImageUrl = "~/img" + NombreArchivo + fileExtension;
                    unNuevoLibro.Portada = imgPortada.ImageUrl;
                    imgPortada.DataBind();

                    unLibroNegocio.AgregarLibro(unNuevoLibro);
                }

                else
                {


                }
            }
            catch (Exception)
            {

                throw;
            }
  

        }

        protected void ValidarTamanioImagen(double tamanioPermitido, double tamanioImagen) {

            if (tamanioImagen > tamanioPermitido) throw new Exception("Tamaño de Imagen inválido. Ingrese una imagen menor a 2mb");
               
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            imgPortada.ImageUrl = "~/img/libro1.png";
        }

        protected void grillaLibros_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
            
            
                
        }

        protected void grillaLibros_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
            LibroNegocio unLibroNegocio = new LibroNegocio();
            unLibroNegocio.EliminarLibro(tboxIsbn.Text);
        }
    }
}