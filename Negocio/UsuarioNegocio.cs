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
        public int VerificarUsuarioCargado(Usuario usuarioIngresado)
        {

            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_VerificarUsuario");
            AccederDatos.Comando.Parameters.Clear();
            AccederDatos.Comando.Parameters.AddWithValue("@usuario", usuarioIngresado.NombreUsuario);
            AccederDatos.Comando.Parameters.AddWithValue("@contrasenia", usuarioIngresado.Contrasenia);
            var respuesta = AccederDatos.ejecutarAccionReturn();
            AccederDatos.CerrarConexion();
            return respuesta;

        }

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
            }

            return usuarioLogeado;

        }
    }
}
