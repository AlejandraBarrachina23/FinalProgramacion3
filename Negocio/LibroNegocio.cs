using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using DAO;
using System.Data.SqlClient;

namespace Negocio
{
    public class LibroNegocio
    {

        private AdministradorAccesoDatos AccederDatos = new AdministradorAccesoDatos();

         public List<Libro> ListadoLibros() {
            
            List<Libro> ListadoLibros = new List<Libro>();
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirTipoComando("select Libros.ISBN,Titulo,Sinopsis,ID_Formato, Fecha_Edicion, Portada,Autores.ID_Autor,Autores.Nombre,Autores.Apellido from Libros INNER JOIN LibrosxAutores ON LibrosxAutores.ISBN = Libros.ISBN INNER JOIN Autores " +
                "ON Autores.ID_Autor = LibrosxAutores.ID_Autor");
            AccederDatos.EjecutarConsulta();

            while (AccederDatos.LectorDatos.Read())
            {
                Libro unLibro = new Libro();
                unLibro.CodigoFormato = new Formato();
                unLibro.CodigoAutor = new Autor();

                unLibro.ISBN = (string)AccederDatos.LectorDatos["ISBN"];
                unLibro.Titulo = (string)AccederDatos.LectorDatos["Titulo"];
                unLibro.AnioEdicion = (int)AccederDatos.LectorDatos["Fecha_Edicion"];
                unLibro.Sinopsis = (string)AccederDatos.LectorDatos["Sinopsis"];
                unLibro.CodigoAutor.CodigoAutor = (int)AccederDatos.LectorDatos["ID_Autor"];
                unLibro.CodigoAutor.Nombre = (string)AccederDatos.LectorDatos["Nombre"];
                unLibro.CodigoAutor.Apellido = (string)AccederDatos.LectorDatos["Apellido"];
                unLibro.CodigoFormato.CodigoFormato = (int)AccederDatos.LectorDatos["ID_Formato"];
                //unLibro.Portada = (string)AccederDatos.LectorDatos["Portada"];

                ListadoLibros.Add(unLibro);
            }

            AccederDatos.CerrarConexion();
            return ListadoLibros;
            
            
        }

        public void AgregarLibro(Libro unLibro)
        {
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_AgregarLibro");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@ISBN", unLibro.ISBN);
            AccederDatos.Comando.Parameters.AddWithValue("@Titulo", unLibro.Titulo);
            AccederDatos.Comando.Parameters.AddWithValue("@ID_Formato",3);
            AccederDatos.Comando.Parameters.AddWithValue("@Sinopsis", unLibro.Sinopsis);
            AccederDatos.Comando.Parameters.AddWithValue("@Fecha_Edicion", unLibro.AnioEdicion);
            AccederDatos.Comando.Parameters.AddWithValue("@Portada", unLibro.Portada);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();
        }

    }
}

