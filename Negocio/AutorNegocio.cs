using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Dominio;

namespace Negocio
{
    public class AutorNegocio
    {

        private AdministradorAccesoDatos AccederDatos = new AdministradorAccesoDatos();

        public List<Autor> ListadoAutores()
        {

            List<Autor> ListadoAutores = new List<Autor>();
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirTipoComando("select ID_Autor,Nombre,apellido from Autores;");
            AccederDatos.EjecutarConsulta();

            while (AccederDatos.LectorDatos.Read())
            {
                Autor unAutor = new Autor();

                unAutor.CodigoAutor = (int)AccederDatos.LectorDatos["ID_Autor"];
                unAutor.Nombre = (string)AccederDatos.LectorDatos["Nombre"];
                unAutor.Nombre += " ";
                unAutor.Nombre += (string)AccederDatos.LectorDatos["Apellido"];

                ListadoAutores.Add(unAutor);
            }
            AccederDatos.CerrarConexion();
            return ListadoAutores;


        }

        public List<Autor> ListarAutores()
        {

            List<Autor> ListadoAutores = new List<Autor>();
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_ListadoAutores");
            AccederDatos.EjecutarConsulta();

            while (AccederDatos.LectorDatos.Read())
            {
                Autor unAutor = new Autor();

                unAutor.CodigoAutor = (int)AccederDatos.LectorDatos["ID_Autor"];
                unAutor.Nombre = (string)AccederDatos.LectorDatos["Nombre"];
                unAutor.Apellido = (string)AccederDatos.LectorDatos["Apellido"];
                unAutor.Celular = (string)AccederDatos.LectorDatos["Celular"];
                unAutor.Email = (string)AccederDatos.LectorDatos["Email"];
                ListadoAutores.Add(unAutor);
            }
            AccederDatos.CerrarConexion();
            return ListadoAutores;

        }


        public void AgregarAutor(Autor unAutor)
        {
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_AgregarAutor");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@Nombre", unAutor.Nombre);
            AccederDatos.Comando.Parameters.AddWithValue("@apellido", unAutor.Apellido);
            AccederDatos.Comando.Parameters.AddWithValue("@celular", unAutor.Celular);
            AccederDatos.Comando.Parameters.AddWithValue("@email", unAutor.Email);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();

        }

        public void ModificarAutor(Autor unAutor)
        {
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_ModificarAutor");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@CodigoAutor", unAutor.CodigoAutor);
            AccederDatos.Comando.Parameters.AddWithValue("@nombre", unAutor.Nombre);
            AccederDatos.Comando.Parameters.AddWithValue("@apellido", unAutor.Apellido);
            AccederDatos.Comando.Parameters.AddWithValue("@celular", unAutor.Celular);
            AccederDatos.Comando.Parameters.AddWithValue("@email", unAutor.Email);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();

        }

        public void EliminarAutor(int CodigoAutor)
        {
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_EliminarAutor");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@CodigoAutor", CodigoAutor);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();
        }

        public int IDAutor() {

            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_UltimoIdAutores");
            AccederDatos.Comando.Parameters.Clear();
            var respuesta = AccederDatos.ejecutarAccionReturn();
            AccederDatos.CerrarConexion();
            return respuesta+1;
        }

        public Autor AutorSeleccionado(int codigoAutor) {

            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_AutorSeleccionado");
            AccederDatos.Comando.Parameters.AddWithValue("@CodigoAutor", codigoAutor);
            AccederDatos.EjecutarConsulta();
            Autor unAutor = new Autor();

            while (AccederDatos.LectorDatos.Read())
            {
                unAutor.CodigoAutor = (int)AccederDatos.LectorDatos["ID_Autor"];
                unAutor.Nombre = (string)AccederDatos.LectorDatos["Nombre"];
                unAutor.Apellido = (string)AccederDatos.LectorDatos["Apellido"];
                unAutor.Celular = (string)AccederDatos.LectorDatos["Celular"];
                unAutor.Email = (string)AccederDatos.LectorDatos["Email"];
            }

            AccederDatos.CerrarConexion();
            return unAutor;
        }
    }
}
