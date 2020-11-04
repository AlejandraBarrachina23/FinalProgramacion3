using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Presentacion
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conexion = new SqlConnection("data source = localhost; initial catalog = EdicionesElemento; integrated security = sspi");

            SqlCommand comando = new SqlCommand("select Libros.ISBN,Titulo, Fecha_Edicion,Autores.Nombre,Autores.Apellido from Libros INNER JOIN LibrosxAutores ON LibrosxAutores.ISBN = Libros.ISBN INNER JOIN Autores " +
                "ON Autores.ID_Autor = LibrosxAutores.ID_Autor", conexion);
            conexion.Open();

            SqlDataReader rdr = comando.ExecuteReader();
            

            conexion.Close();
        }
    }
}