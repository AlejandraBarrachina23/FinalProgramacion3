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
            AccederDatos.DefinirProcedimientoAlmacenado("SP_ListarLibros");
            AccederDatos.EjecutarConsulta();

            while (AccederDatos.LectorDatos.Read())
            {
                Libro unLibro = new Libro();
                unLibro.Formato = new Formato();
                unLibro.Autor = new Autor();
                unLibro.Editorial = new Editorial();

                unLibro.ISBN = (string)AccederDatos.LectorDatos["ISBN"];
                unLibro.Titulo = (string)AccederDatos.LectorDatos["Titulo"];
                unLibro.AnioEdicion = (int)AccederDatos.LectorDatos["Fecha_Edicion"];
                unLibro.Sinopsis = (string)AccederDatos.LectorDatos["Sinopsis"];
                unLibro.Autor.CodigoAutor = (int)AccederDatos.LectorDatos["ID_Autor"];
                unLibro.Autor.Nombre = (string)AccederDatos.LectorDatos["Nombre"];
                unLibro.Autor.Apellido = (string)AccederDatos.LectorDatos["Apellido"];
                unLibro.Formato.CodigoFormato = (int)AccederDatos.LectorDatos["ID_Formato"];
                unLibro.Editorial.CodigoEditorial = (int)AccederDatos.LectorDatos["ID_Editorial"];
                unLibro.Editorial.NombreEditorial = (string)AccederDatos.LectorDatos["Nombre_Editorial"];
                unLibro.Portada = (string)AccederDatos.LectorDatos["Portada"];
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
            AccederDatos.Comando.Parameters.AddWithValue("@ID_Formato",unLibro.Formato.CodigoFormato);
            AccederDatos.Comando.Parameters.AddWithValue("@Sinopsis", unLibro.Sinopsis);
            AccederDatos.Comando.Parameters.AddWithValue("@Fecha_Edicion", unLibro.AnioEdicion);
            AccederDatos.Comando.Parameters.AddWithValue("@Portada", unLibro.Portada);
            AccederDatos.Comando.Parameters.AddWithValue("@Editorial", unLibro.Editorial.CodigoEditorial);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();
            AgregarLibroxAutor(unLibro);
        }

        private void AgregarLibroxAutor(Libro unLibro) {

            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_AgregarLibroxAutor");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@ISBN", unLibro.ISBN);
            AccederDatos.Comando.Parameters.AddWithValue("@Autor", unLibro.Autor.CodigoAutor);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();

        }

        public void ModificarLibro(Libro unLibro)
        {
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_ModificarLibro");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@ISBN", unLibro.ISBN);
            AccederDatos.Comando.Parameters.AddWithValue("@Titulo", unLibro.Titulo);
            AccederDatos.Comando.Parameters.AddWithValue("@ID_Formato", 3);
            AccederDatos.Comando.Parameters.AddWithValue("@Sinopsis", unLibro.Sinopsis);
            AccederDatos.Comando.Parameters.AddWithValue("@Fecha_Edicion", unLibro.AnioEdicion);
            AccederDatos.Comando.Parameters.AddWithValue("@Portada", unLibro.Portada);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();
        }

        public void EliminarLibro(string ISBN)
        {
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_EliminarLibro");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@ISBN", ISBN);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();
        }

    }
}

