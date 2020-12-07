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

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            UsuarioNegocio unUsuarioNegocio = new UsuarioNegocio();
            Usuario usuarioIngresado = new Usuario();

            usuarioIngresado.NombreUsuario = Request.Form["tboxUsuarioInicio"].ToLower();
            usuarioIngresado.Contrasenia = Request.Form["tboxConstrasenia"].ToLower();

            if (unUsuarioNegocio.VerificarUsuarioCargado(usuarioIngresado) == 1) {

                
                usuarioIngresado = unUsuarioNegocio.UsuarioLogeado(usuarioIngresado.NombreUsuario);
                lblEstadoLogeo.Text = "Exito" + usuarioIngresado.NombreUsuario + usuarioIngresado.Nombre + usuarioIngresado.Apellido;


            }

            else lblEstadoLogeo.Text = "Incorrecto";

        }
    }
}