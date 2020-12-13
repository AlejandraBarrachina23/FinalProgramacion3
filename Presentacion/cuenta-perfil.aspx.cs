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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioActivo = (Usuario)Session["UsuarioLogeado"];

            if (Session["UsuarioLogeado"] != null && usuarioActivo.TipoUsuario)
            {
                HyperLink linkPerfil = (HyperLink)Master.FindControl("hplnkLogin");
                linkPerfil.Text = usuarioActivo.NombreUsuario;
                linkPerfil.NavigateUrl = "~/cuenta-home.aspx";
            }

            else
            {
                Response.Redirect("error404.aspx");
            }

            if (!Page.IsPostBack) { 
                tboxNombre.Text = usuarioActivo.Nombre;
                tboxApellido.Text = usuarioActivo.Apellido;
                tboxConstrasenia.Text = usuarioActivo.Contrasenia;
                tboxRepetirContrasenia.Text = usuarioActivo.Contrasenia;
                tboxCelular.Text = usuarioActivo.Celular;
                tboxEmail.Text = usuarioActivo.Email;
                DeshabilitarHabilitarTextBoxes(false);
            
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

            DeshabilitarHabilitarTextBoxes(true);
            btnAceptar.Visible = true;
            
        }


        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            btnAceptar.Visible = false;
           
            Usuario usuarioModificado = new Usuario();
            UsuarioNegocio unUsuarioNegocio = new UsuarioNegocio();
            usuarioModificado = (Usuario)Session["UsuarioLogeado"];

            if (unUsuarioNegocio.VerificarMailExistente(tboxEmail.Text,usuarioModificado.NombreUsuario) != 1)
            {
                
                usuarioModificado.Nombre = tboxNombre.Text;
                usuarioModificado.Apellido = tboxApellido.Text;
                usuarioModificado.Contrasenia = tboxConstrasenia.Text;
                usuarioModificado.Celular = tboxCelular.Text;
                usuarioModificado.Email = tboxEmail.Text;
                usuarioModificado.NombreUsuario = ((Usuario)Session["UsuarioLogeado"]).NombreUsuario;
                usuarioModificado.TipoUsuario = true;
                Session["UsuarioLogeado"] = usuarioModificado;
                unUsuarioNegocio.ModificarUsuario(usuarioModificado);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ModalModificarUsuario", "$('#modalUsuarioModificacion').modal({show:true});", true);
                DeshabilitarHabilitarTextBoxes(false);
            }

            else {

                lblErrorEmail.Text = "El mail ingresado ya está en uso";
            }
        }

        protected void DeshabilitarHabilitarTextBoxes(bool estado)
        {

            if (estado) HabilitarTextBox(); else DeshabilitarTextBox();

        }

        protected void HabilitarTextBox()
        {

            foreach (TextBox tbox in pnlDatosUsuario.Controls.OfType<TextBox>())
            {
                tbox.Enabled = true;
            }
        }


        protected void DeshabilitarTextBox()
        {

            foreach (TextBox tbox in pnlDatosUsuario.Controls.OfType<TextBox>())
            {
                tbox.Enabled = false;
            }
        }
    }
}