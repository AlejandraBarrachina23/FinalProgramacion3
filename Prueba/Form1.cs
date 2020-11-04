using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAO;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace Prueba
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection conexion = new SqlConnection("data source = localhost; initial catalog = EdicionesElemento; integrated security = sspi");

            SqlCommand comando = new SqlCommand("select Libros.ISBN,Titulo, Fecha_Edicion,Autores.Nombre,Autores.Apellido from Libros INNER JOIN LibrosxAutores ON LibrosxAutores.ISBN = Libros.ISBN INNER JOIN Autores " +
                "ON Autores.ID_Autor = LibrosxAutores.ID_Autor", conexion);
            conexion.Open();

            SqlDataReader rdr = comando.ExecuteReader();
            dgrid.DataSource = rdr;
                   
       
            conexion.Close();
        }   
    }
}
