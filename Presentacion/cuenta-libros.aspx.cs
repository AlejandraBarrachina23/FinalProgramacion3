using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using Negocio;
using Dominio;


namespace Presentacion
{
    public partial class cuenta_libros : System.Web.UI.Page
    {
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

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            
           
        }

        protected void grillaLibros_SelectedIndexChanged(object sender, EventArgs e)
        {
            // se obtiene el indice de la fila seleccionada y con se ajusta segun la paginacion
            int indice = grillaLibros.SelectedIndex + (grillaLibros.PageIndex * grillaLibros.PageSize);
            LibroNegocio unLibroNegocio = new LibroNegocio();

            //precarga de datos
            Libro LibroSeleccionado = unLibroNegocio.ListadoLibros()[indice];
            tboxIsbn.Text = LibroSeleccionado.ISBN.ToString();
            tboxTitulo.Text = LibroSeleccionado.Titulo.ToString();
            tboxSinopsis.Text = LibroSeleccionado.Sinopsis;
            AnioEdicion.Text = LibroSeleccionado.AnioEdicion.ToString();
            ddlFormatos.SelectedIndex = (LibroSeleccionado.CodigoFormato.CodigoFormato - 1);
            ddlAutores.SelectedIndex = (LibroSeleccionado.CodigoAutor.CodigoAutor - 1);
            modal.Visible = true;


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
            HttpPostedFile postedFile = fupImagenPortada.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedFile.ContentLength;

            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png") {

                Libro unNuevoLibro = new Libro();
                unNuevoLibro.CodigoFormato = new Formato();
                Stream stream = postedFile.InputStream;
                BinaryReader binaryreader = new BinaryReader(stream);
                byte[] bytesportada = binaryreader.ReadBytes((int)stream.Length);
                unNuevoLibro.ISBN = tboxIsbn.Text;
                unNuevoLibro.Titulo = tboxTitulo.Text;
                unNuevoLibro.CodigoFormato.CodigoFormato = ddlFormatos.SelectedIndex;
                unNuevoLibro.Sinopsis = tboxSinopsis.Text;
                unNuevoLibro.AnioEdicion = Convert.ToInt32(AnioEdicion.Text);
                unNuevoLibro.Portada = bytesportada;

                lblIndex.Text = unNuevoLibro.ISBN.ToString() + unNuevoLibro.Titulo + unNuevoLibro.CodigoFormato.CodigoFormato
                    .ToString() + unNuevoLibro.Sinopsis + unNuevoLibro.AnioEdicion.ToString() + unNuevoLibro.Portada.ToString();

                LibroNegocio unLibroNegocio = new LibroNegocio();
                unLibroNegocio.AgregarLibro(unNuevoLibro);
            }

            else{

                
            }
            
        

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
          
        }
    }
}