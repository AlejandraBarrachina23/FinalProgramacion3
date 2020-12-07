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

        }

        protected void btnEnviarConsulta_Click(object sender, EventArgs e)
        {
            UsuarioNegocio unUsuarioNegocio = new UsuarioNegocio();
            string NombreUsuario = Request.Form["tboxNombreUsuario"];
            string CorreoElectronico = Request.Form["tboxEmail"];
            string Mensaje = Request.Form["tboxMensaje"];
            //unUsuarioNegocio.EnviarMail("alejandrabarrachina23@gmail.com", CorreoElectronico, "barr1989Share.", "", "Ediciones-Elemento");

        }
    }
}