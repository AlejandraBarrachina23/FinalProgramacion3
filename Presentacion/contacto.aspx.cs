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

        }

        protected void btnSubmitFormContacto_Click(object sender, EventArgs e)
        {
            UsuarioNegocio unUsuarioNegocio = new UsuarioNegocio();
            Usuario usuarioConsulta = new Usuario();
            Libro libroSolicitado = new Libro();
            libroSolicitado.Formato = new Formato();
            MailNegocio unNuevoMail = new MailNegocio();

            usuarioConsulta.NombreUsuario = Request.Form["tboxNombre"] + " " + Request.Form["tboxApellido"];
            usuarioConsulta.Email = Request.Form["tboxMail"];
            usuarioConsulta.Celular = Convert.ToInt32(Request.Form["tboxCelular"]);
            string PreferenciaContacto = Request.Params["rbtnPreferenciaContacto"];

            libroSolicitado.Formato.Medidas = Request.Params["cboxFormato"] + " " + Request.Form["tboxFormatoOtros"];
            libroSolicitado.Genero = Request.Params["cboxGenero"] + " " + Request.Form["tboxGeneroOtros"];
            libroSolicitado.cantidadCaracteres = Convert.ToInt32(Request.Form["tboxCaracteres"]);
            libroSolicitado.cantidadEjemplares = Convert.ToInt32(Request.Form["tboxCantidadEjemplares"]);
            libroSolicitado.cantidadImagenes = Convert.ToInt32(Request.Form["tboxCantidadImagenes"]);

            unNuevoMail.generarMailing(usuarioConsulta, "", libroSolicitado, PreferenciaContacto, "consultaCompuesta");

        }

    }
}