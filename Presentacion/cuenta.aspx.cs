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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            UsuarioNegocio unUsuarioNegocio = new UsuarioNegocio();
            Usuario usuarioIngresado = new Usuario();
            usuarioIngresado.NombreUsuario = tboxUsuarioInicio.Text.ToLower();
            usuarioIngresado.Contrasenia = tboxConstrasenia.Text.ToLower();
            usuarioIngresado = unUsuarioNegocio.UsuarioLogeado(usuarioIngresado);

            if (usuarioIngresado.NombreUsuario != null) {

                lblEstadoLogeo.Text = usuarioIngresado.Nombre + usuarioIngresado.NombreUsuario + usuarioIngresado.Contrasenia;
                Session["UsuarioLogeado"] = usuarioIngresado;
                //ME GUARDO LOS DATOS DEL USUARIO Y REDIRECCIONO A LA SIGUIENTE SECCIÓN
                if (usuarioIngresado.TipoUsuario) Response.Redirect("cuenta-home.aspx");
                else Response.Redirect("index.aspx");

            }

            else lblEstadoLogeo.Text = "El usuario/contraseña ingresado no existen";
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            lblErrorRegistroUsuario.Text = "";
            lblErrorRegistroEmail.Text = "";

            UsuarioNegocio unUsuarioNegocio = new UsuarioNegocio();
            Usuario usuarioIngresado = new Usuario();
            usuarioIngresado.NombreUsuario = tboxUsuarioRegistro.Text.ToLower();
            usuarioIngresado.Email = tboxEmailRegistro.Text;
            usuarioIngresado.Celular = tboxCelularRegistro.Text;
            usuarioIngresado.Contrasenia = tboxContraseniaRegistro.Text;

            if (unUsuarioNegocio.VerificarUsuarioExistente(usuarioIngresado.NombreUsuario) != 1)
            {

                if (unUsuarioNegocio.VerificarMailExistente(usuarioIngresado.Email) != 1) {

                    Mail notificacion = new Mail();
                    MailNegocio unMail = new MailNegocio();
                    notificacion.DetalleUsuario = new Usuario();

                    usuarioIngresado.NombreUsuario = tboxUsuarioRegistro.Text;
                    usuarioIngresado.Contrasenia = tboxContraseniaRegistro.Text;
                    usuarioIngresado.Celular = tboxCelularRegistro.Text;
                    usuarioIngresado.Email = tboxEmailRegistro.Text;
                    usuarioIngresado.Nombre = "No definido";
                    usuarioIngresado.Apellido = "No definido";
                    notificacion.DetalleUsuario = usuarioIngresado;
                    unUsuarioNegocio.AgregarUsuario(usuarioIngresado);
                    unMail.EnviarMail(notificacion, "alta usuario");

                }

                else lblErrorRegistroEmail.Text = "El mail ingresado ya esta en uso";

            }

            else {
                
                lblErrorRegistroUsuario.Text = "El nombre de usuario ingresado ya esta en uso";

            }
                

            
      
        }
    }
}