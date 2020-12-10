using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace Presentacion
{
    public partial class recuperar_contrasenia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecuperarContrasenia_Click(object sender, EventArgs e)
        {
            UsuarioNegocio unUsuarioNegocio = new UsuarioNegocio();
            MailNegocio mailRestauracion = new MailNegocio();
            Usuario usuarioMail = unUsuarioNegocio.ReestablecerConstrasenia(tboxEmailRecuperacion.Text);
            
            if (usuarioMail.NombreUsuario != null)
            {
                Mail solicitudContrasenia = new Mail();
                solicitudContrasenia.DetalleUsuario = new Usuario();
                solicitudContrasenia.DetalleUsuario = usuarioMail;
                mailRestauracion.EnviarMail(solicitudContrasenia, "restauracion");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ConfirmacionRestauracion", "$('#confirmacionRestauracion').modal({show:true});", true);
            }

            else {
                
                lblErrorEmailRecuperacion.Text = "El correo ingresado no existe";
            }
           
            
        }
    }
}