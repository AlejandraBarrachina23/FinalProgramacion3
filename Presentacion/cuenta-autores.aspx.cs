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
    public partial class cuenta_categoria : System.Web.UI.Page
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

            else {
                Response.Redirect("error404.aspx");
            }

            AutorNegocio unAutor = new AutorNegocio();
            grillaAutores.DataSource = unAutor.ListarAutores();
            grillaAutores.DataBind();
        }

        protected void grillaAutores_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //PRECARGA DE DATOS EN EL FORMULARIO OCULTO
                AutorNegocio unAutorNegocio = new AutorNegocio();

                // VARIABLE QUE ALMACENA EL INDICE DE LA FILA SELECCIONADA, SE AJUSTA CON LA PAGINACIÓN
                int IndexRow = grillaAutores.SelectedIndex + (grillaAutores.PageIndex * grillaAutores.PageSize);

                //precarga de datos
                Autor AutorSeleccionado = new Autor();


                //SACO LOS DATOS DE LA FILA SELECCIONADA
                AutorSeleccionado = unAutorNegocio.ListarAutores()[IndexRow];

                //CARGO TEXTBOX
                tboxCodigoAutor.Text = AutorSeleccionado.CodigoAutor.ToString();
                tboxNombre.Text = AutorSeleccionado.Nombre;
                tboxApellido.Text = AutorSeleccionado.Apellido;
                tboxCelular.Text = AutorSeleccionado.Celular;
                tboxEmail.Text = AutorSeleccionado.Email;

                //HABILITO Y DESHABILITO LOS BOTONES
                tboxCodigoAutor.Enabled = false;
            }
            catch (Exception exc)
            {

                throw;
            }

        }

        protected void grillaAutores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            AutorNegocio unAutorNegocio = new AutorNegocio();
            grillaAutores.PageIndex = e.NewPageIndex;
            grillaAutores.DataSource = unAutorNegocio.ListarAutores();
            grillaAutores.DataBind();
        }

        protected void grillaAutores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //TOMO EL VALOR DEL LIBRO A ELIMINAR
            lblAutorEliminar.Text = e.Values[1].ToString();
            lblCodigoAutorEliminar.Text = e.Values[0].ToString();


        }

        protected void grillaAutores_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            //VERIFICO QUE COMANDO ACTIVO EL EVENTO PARA PODER DESPLEGAR LA VENTANA EMERGENTE ASOCIADA

            if (e.CommandName == "Select")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
                btnModificar.Visible = true;
                btnAceptar.Visible = false;


            }

            if (e.CommandName == "Delete")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EliminarModal", "$('#exampleModalCenter').modal({show:true});", true);
            }

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            AutorNegocio unAutor = new AutorNegocio();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
            LimpiarFormulario();
            tboxCodigoAutor.Enabled = true;
            btnModificar.Visible = false;
            btnAceptar.Visible = true;
            tboxCodigoAutor.Text = unAutor.IDAutor().ToString();

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            tboxCodigoAutor.Enabled = true;

            AutorNegocio unAutorNegocio = new AutorNegocio();
            Autor unNuevoAutor = new Autor();
            unNuevoAutor.Nombre = tboxNombre.Text;
            unNuevoAutor.Apellido = tboxApellido.Text;
            unNuevoAutor.Celular = tboxCelular.Text;
            unNuevoAutor.Email = tboxEmail.Text;

            unAutorNegocio.AgregarAutor(unNuevoAutor);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalAccionesCompletaActores", "$('#modalAccionCompletadaActores').modal({show:true});", true);

            grillaAutores.DataSource = unAutorNegocio.ListarAutores();
            grillaAutores.DataBind();

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

            AutorNegocio unAutorNegocio = new AutorNegocio();
            Autor unAutor = new Autor();
            unAutor.CodigoAutor = Convert.ToInt32(tboxCodigoAutor.Text);
            unAutor.Nombre = tboxNombre.Text;
            unAutor.Apellido = tboxApellido.Text;
            unAutor.Celular = tboxCelular.Text;
            unAutor.Email = tboxEmail.Text;
            unAutorNegocio.ModificarAutor(unAutor);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalAccionesCompletaActores", "$('#modalAccionCompletadaActores').modal({show:true});", true);
            grillaAutores.DataSource = unAutorNegocio.ListarAutores();
            grillaAutores.DataBind();
        }

        private void LimpiarFormulario()
        {

            LimpiarCombobox();
            LimpiarInput();
        }

        private void LimpiarInput()
        {

            foreach (TextBox tbox in modal.Controls.OfType<TextBox>())
            {
                tbox.Text = "";
            }

        }

        private void LimpiarCombobox()
        {

            foreach (DropDownList lista in modal.Controls.OfType<DropDownList>())
            {
                lista.SelectedIndex = 0;
            }
        }

        private void ResetearDDL()
        {

            foreach (DropDownList ddl in modal.Controls.OfType<DropDownList>())
            {
                ddl.SelectedIndex = -1;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            AutorNegocio unAutorNegocio = new AutorNegocio(); 
            unAutorNegocio.EliminarAutor(Convert.ToInt32(lblCodigoAutorEliminar.Text));
            grillaAutores.DataSource = unAutorNegocio.ListarAutores();
            grillaAutores.DataBind();
        }
    }
}