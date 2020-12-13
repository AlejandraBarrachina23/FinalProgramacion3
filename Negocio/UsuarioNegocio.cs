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

        public Usuario UsuarioLogeado(Usuario usuarioIngresado) {

            Usuario usuarioLogeado = new Usuario();
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_UsuarioLogeado");
            AccederDatos.Comando.Parameters.AddWithValue("@usuario", usuarioIngresado.NombreUsuario);
            AccederDatos.Comando.Parameters.AddWithValue("@contrasenia", usuarioIngresado.Contrasenia);
            AccederDatos.EjecutarConsulta();
            while (AccederDatos.LectorDatos.Read())
            {
                usuarioLogeado.NombreUsuario = usuarioIngresado.NombreUsuario;
                usuarioLogeado.Nombre = AccederDatos.LectorDatos["nombre"].ToString();
                usuarioLogeado.Apellido = AccederDatos.LectorDatos["apellido"].ToString();
                usuarioLogeado.TipoUsuario = (bool)AccederDatos.LectorDatos["TipoUsuario"];
                usuarioLogeado.Contrasenia = AccederDatos.LectorDatos["contrasenia"].ToString();
                usuarioLogeado.Email = AccederDatos.LectorDatos["email"].ToString();
                usuarioLogeado.Celular = AccederDatos.LectorDatos["celular"].ToString();

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

        public int VerificarMailExistente(string Email,string NombreUsuario)
        {

            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_VerificarEmailExistente");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@email", Email);
            AccederDatos.Comando.Parameters.AddWithValue("@nombreUsuario", NombreUsuario);
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

        public Usuario ReestablecerConstrasenia(string correoElectronico) {

            Usuario usuarioLogeado = new Usuario();
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_RestablecerContrasenia");
            AccederDatos.Comando.Parameters.AddWithValue("@email", correoElectronico);
            AccederDatos.EjecutarConsulta();
            while (AccederDatos.LectorDatos.Read())
            {
                usuarioLogeado.NombreUsuario = AccederDatos.LectorDatos["Usuario"].ToString();
                usuarioLogeado.Contrasenia = AccederDatos.LectorDatos["contrasenia"].ToString();
                usuarioLogeado.Nombre = AccederDatos.LectorDatos["nombre"].ToString();
                usuarioLogeado.Apellido = AccederDatos.LectorDatos["apellido"].ToString();
                usuarioLogeado.Email = AccederDatos.LectorDatos["email"].ToString();
            }

            AccederDatos.CerrarConexion();

            return usuarioLogeado;
        }

        public void ModificarUsuario(Usuario usuarioModificado)
        {
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_ModificarUsuario");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@NombreUsuario", usuarioModificado.NombreUsuario);
            AccederDatos.Comando.Parameters.AddWithValue("@Nombre", usuarioModificado.Nombre);
            AccederDatos.Comando.Parameters.AddWithValue("@Apellido", usuarioModificado.Apellido);
            AccederDatos.Comando.Parameters.AddWithValue("@celular", usuarioModificado.Celular);
            AccederDatos.Comando.Parameters.AddWithValue("@email", usuarioModificado.Email);
            AccederDatos.Comando.Parameters.AddWithValue("@contrasenia", usuarioModificado.Contrasenia);
            AccederDatos.EjecutarAccion();
            AccederDatos.CerrarConexion();

        }

    }
}
