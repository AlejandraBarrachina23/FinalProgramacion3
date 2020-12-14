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
            AutorNegocio unAutor = new AutorNegocio();

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

            if (!IsPostBack) { 
                
                Session["ListadoAutores"] = unAutor.ListarAutores();
                grillaAutores.DataSource = Session["ListadoAutores"];
                grillaAutores.DataBind();
            }

        }

        protected void grillaAutores_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //PRECARGA DE DATOS EN EL FORMULARIO OCULTO
                AutorNegocio unAutorNegocio = new AutorNegocio();

                // VARIABLE QUE ALMACENA EL INDICE DE LA FILA SELECCIONADA, SE AJUSTA CON LA PAGINACIÓN

                GridViewRow rowSeleccionada = grillaAutores.SelectedRow;
                int idAutor = Convert.ToInt32(rowSeleccionada.Cells[0].Text);

                Autor AutorSeleccionado = unAutorNegocio.AutorSeleccionado(idAutor);

                //CARGO TEXTBOX
                tboxCodigoAutor.Text = AutorSeleccionado.CodigoAutor.ToString();
                tboxNombre.Text = AutorSeleccionado.Nombre;
                tboxApellido.Text = AutorSeleccionado.Apellido;
                tboxCelular.Text = AutorSeleccionado.Celular;
                tboxEmail.Text = AutorSeleccionado.Email;

            }
            catch (Exception exc)
            {

                throw;
            }

        }

        protected void grillaAutores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            AutorNegocio unAutorNegocio = new AutorNegocio();
            lblEstado.Text = e.NewPageIndex.ToString();
            
            grillaAutores.PageIndex = e.NewPageIndex;
            grillaAutores.DataSource = Session["ListadoAutores"];
            grillaAutores.DataBind();
        }

        protected void grillaAutores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //TOMO EL VALOR DEL LIBRO A ELIMINAR
            lblAutorEliminar.Text = e.Values[1].ToString();
            lblAutorApellidoEliminar.Text = e.Values[2].ToString();
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
                lblErrorNombreAutor.Text = "";
                lblErrorEmail.Text = "";

            }

            if (e.CommandName == "Delete")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EliminarModal", "$('#exampleModalCenter').modal({show:true});", true);
            }

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            lblErrorNombreAutor.Text = "";
            lblErrorEmail.Text = "";
            AutorNegocio unAutor = new AutorNegocio();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
            LimpiarFormulario();
            btnModificar.Visible = false;
            btnAceptar.Visible = true;
            tboxCodigoAutor.Text = unAutor.IDAutor().ToString();

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            
            AutorNegocio unAutorNegocio = new AutorNegocio();
            Autor unNuevoAutor = new Autor();
            unNuevoAutor.Nombre = tboxNombre.Text;
            unNuevoAutor.Apellido = tboxApellido.Text;
            unNuevoAutor.Celular = tboxCelular.Text;
            unNuevoAutor.Email = tboxEmail.Text;

            if (unAutorNegocio.VerificarMail(unNuevoAutor.Email, tboxCodigoAutor.Text) != 1)
            {

                unAutorNegocio.AgregarAutor(unNuevoAutor);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalAccionesCompletaActores", "$('#modalAccionCompletadaActores').modal({show:true});", true);

                grillaAutores.DataSource = unAutorNegocio.ListarAutores();
                grillaAutores.DataBind();
            }

            else {

                lblErrorEmail.Text = "El mail ingresado ya esta en uso";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
            }
    

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
            string autorIngresado = unAutor.Nombre + " " + unAutor.Apellido;
            List<Autor> ListadoAutoresDisponibles = unAutorNegocio.ListadoAutores();


            if (!VerificarAutor(ListadoAutoresDisponibles, autorIngresado, unAutor.CodigoAutor))
            {

                if (unAutorNegocio.VerificarMail(unAutor.Email, tboxCodigoAutor.Text) != 1)
                {

                    unAutorNegocio.ModificarAutor(unAutor);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "modalAccionesCompletaActores", "$('#modalAccionCompletadaActores').modal({show:true});", true);
                    grillaAutores.DataSource = unAutorNegocio.ListarAutores();
                    grillaAutores.DataBind();
                }

                else {

                    lblErrorEmail.Text = "El mail ingresado ya esta en uso";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
                }
               
            }

            else
            {

                lblErrorNombreAutor.Text = "El autor ingresado ya existe";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AbrirModal", "$('#mymodal').modal({show:true});", true);
            }
        }

        private bool VerificarAutor(List<Autor> ListadoAutoresDisponibles, string NombreAutor, int CodigoAutor)
        {


            foreach (var autor in ListadoAutoresDisponibles)
            {
                if (autor.Nombre.ToString().ToLower() == NombreAutor.ToLower() && CodigoAutor != autor.CodigoAutor)
                {
                    return true;
                }
            }

            return false;

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

        protected void cboxOrdenarLibros_SelectedIndexChanged(object sender, EventArgs e)
        {
            AutorNegocio unAutorNegocio = new AutorNegocio();
            List<Autor> ListadoAutores = (List<Autor>)Session["ListadoAutores"];


            if (tboxBusqueda.Text != "")
            {
                ordenarAutores(ddlFiltros, ListadoAutores);
            }

            else {

                ListadoAutores = unAutorNegocio.ListarAutores();
                ordenarAutores(ddlFiltros, ListadoAutores);
            }
        }

        protected void tboxBusqueda_TextChanged(object sender, EventArgs e)
        {
            AutorNegocio unAutorNegocio = new AutorNegocio();
            List<Autor> ListadoAutores = new List<Autor>();
            ListadoAutores = unAutorNegocio.ListarAutores();
            Session["ListadoAutores"] = ListadoAutores.FindAll(x => x.Nombre.ToLower().Contains(tboxBusqueda.Text.ToLower()));
            grillaAutores.DataSource = Session["ListadoAutores"];
            grillaAutores.DataBind();
            
        }

        protected void ordenarAutores(DropDownList ddlFiltro, List<Autor> ListadoAutores)
        {

            if (ddlFiltro.SelectedIndex == 1)
            {
                Session["ListadoAutores"] = ListadoAutores.OrderBy(x => x.Nombre).ToList<Autor>();
                grillaAutores.DataSource = Session["ListadoAutores"];
                grillaAutores.DataBind();
            }
            else if (ddlFiltro.SelectedIndex == 2)
            {
                Session["ListadoAutores"] = ListadoAutores.OrderBy(x => x.Apellido).ToList<Autor>();
                grillaAutores.DataSource = Session["ListadoAutores"];
                grillaAutores.DataBind();
            }

            else if (ddlFiltro.SelectedIndex == 3)
            {
                Session["ListadoAutores"] = ListadoAutores.OrderBy(x => x.Email).ToList<Autor>();
                grillaAutores.DataSource = Session["ListadoAutores"];
                grillaAutores.DataBind();
            }
        }
    }
    
}