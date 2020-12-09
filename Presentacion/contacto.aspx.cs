using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Presentacion
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioActivo = (Usuario)Session["UsuarioLogeado"];

            if (Session["UsuarioLogeado"] != null)
            {
                HyperLink linkPerfil = (HyperLink)Master.FindControl("hplnkLogin");
                linkPerfil.Text = usuarioActivo.NombreUsuario;
                linkPerfil.NavigateUrl = "~/cuenta-home.aspx";
            }
        }

        protected void btnSubmitFormContacto_Click(object sender, EventArgs e)
        {
            UsuarioNegocio unUsuarioNegocio = new UsuarioNegocio();
            MailNegocio unNuevoMail = new MailNegocio();

            Mail mail = new Mail();
            mail.DetalleUsuario = new Usuario();
            mail.DetalleLibro = new Libro();
            mail.DetalleLibro.Formato = new Formato();
            
            mail.DetalleUsuario.NombreUsuario = Request.Form["tboxNombre"] + " " + Request.Form["tboxApellido"];
            mail.DetalleUsuario.Email = Request.Form["tboxMail"];
            mail.Destinatario = mail.DetalleUsuario.Email;
            mail.DetalleUsuario.Celular = Request.Form["tboxCelular"];
            mail.MedioContacto = Request.Params["rbtnPreferenciaContacto"];

            mail.DetalleLibro.Formato.Medidas = Request.Params["cboxFormato"] + " " + Request.Form["tboxFormatoOtros"];
            mail.DetalleLibro.Genero = Request.Params["cboxGenero"] + " " + Request.Form["tboxGeneroOtros"];
            mail.DetalleLibro.cantidadCaracteres = Convert.ToInt32(Request.Form["tboxCaracteres"]);
            mail.DetalleLibro.cantidadEjemplares = Convert.ToInt32(Request.Form["tboxCantidadEjemplares"]);
            mail.DetalleLibro.cantidadImagenes = Convert.ToInt32(Request.Form["tboxCantidadImagenes"]);

            unNuevoMail.EnviarMail(mail, "compleja");


        }

    }
}