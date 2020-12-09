using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Web;
using DAO;
using Dominio;


namespace Negocio
{
    public class UsuarioNegocio
    {

        private AdministradorAccesoDatos AccederDatos = new AdministradorAccesoDatos();
        
        public Usuario UsuarioLogeado(string NombreUsuario) {

            Usuario usuarioLogeado = new Usuario();
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_UsuarioLogeado");
            AccederDatos.Comando.Parameters.AddWithValue("@usuario", NombreUsuario);
            AccederDatos.EjecutarConsulta();
            while (AccederDatos.LectorDatos.Read())
            {
                usuarioLogeado.NombreUsuario = NombreUsuario;
                usuarioLogeado.Nombre = AccederDatos.LectorDatos["nombre"].ToString();
                usuarioLogeado.Apellido = AccederDatos.LectorDatos["apellido"].ToString();
                usuarioLogeado.TipoUsuario = (bool)AccederDatos.LectorDatos["TipoUsuario"];
            }

            return usuarioLogeado;

        }

        public int VerificarUsuarioExistente(string NombreUsuario) {

            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_VerificarUsuarioExistente");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@usuario", NombreUsuario);
            var respuesta = AccederDatos.ejecutarAccionReturn();
            AccederDatos.CerrarConexion();
            return respuesta;

        }

        public int VerificarMailExistente(string Email)
        {

            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_VerificarEmailExistente");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@email", Email);
            var respuesta = AccederDatos.ejecutarAccionReturn();
            AccederDatos.CerrarConexion();
            return respuesta;

        }

        public void AgregarUsuario(Usuario unNuevoUsuario) {

            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_AgregarUsuario");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@NombreUsuario", unNuevoUsuario.NombreUsuario);
            AccederDatos.Comando.Parameters.AddWithValue("@Contrasenia", unNuevoUsuario.Contrasenia);
            AccederDatos.Comando.Parameters.AddWithValue("@Email", unNuevoUsuario.Email);
            AccederDatos.Comando.Parameters.AddWithValue("@Celular", unNuevoUsuario.Celular);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();
        }


    }
}
