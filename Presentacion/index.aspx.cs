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
    public partial class WebForm1 : System.Web.UI.Page
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

        protected void btnEnviarConsulta_Click(object sender, EventArgs e)
        {
            MailNegocio mail = new MailNegocio();
            Mail detalleMail = new Mail();
            detalleMail.DetalleUsuario = new Usuario();
           
            detalleMail.DetalleUsuario.NombreUsuario = Request.Form["tboxNombreUsuario"];
            detalleMail.Destinatario = Request.Form["tboxEmail"];
            detalleMail.DetalleUsuario.Email = detalleMail.Destinatario;
            detalleMail.Mensaje = Request.Form["tboxMensaje"];
            
            mail.EnviarMail(detalleMail,"sencilla");

            
        }
    }
}