using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace Presentacion
{
    public partial class WebForm4 : System.Web.UI.Page
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

        protected void ddlOrden_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}