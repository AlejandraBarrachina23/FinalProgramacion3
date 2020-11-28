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
            try
            {
                string Mensaje = Request.Form["tboxMensaje"];
                string NombreUsuario = Request.Form["tboxNombreUsuario"];
                string SubjectUsuario = "Ediciones Elemento - Mensaje";
                


                string email = Request.Form["tboxEmail"];
                prueba.Text = Mensaje + " " + NombreUsuario + " " + email;
                

                UsuarioNegocio unUsuarioNegocio = new UsuarioNegocio();
                unUsuarioNegocio.EnviarMail("alejandrabarrachina23@gmail.com", email, "barr1989Share.", Mensaje);
                                

            }
            catch (Exception)
            {

                throw;
            }
         


        }
    }
}