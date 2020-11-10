using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using DAO;

namespace Negocio
{
    public class EditorialNegocio
    {
        private AdministradorAccesoDatos AccederDatos = new AdministradorAccesoDatos();
        public List<Editorial>ListarEditoriales()
        {

            List<Editorial> ListadoEditoriales = new List<Editorial>();
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirProcedimientoAlmacenado("SP_ListarEditoriales");
            AccederDatos.EjecutarConsulta();

            while (AccederDatos.LectorDatos.Read())
            {
                Editorial unaEditorial = new Editorial();

                unaEditorial.CodigoEditorial = (int)AccederDatos.LectorDatos["ID_Editorial"];
                unaEditorial.NombreEditorial = (string)AccederDatos.LectorDatos["Nombre_Editorial"];
                ListadoEditoriales.Add(unaEditorial);
            }
            AccederDatos.CerrarConexion();
            return ListadoEditoriales;

        }

    }
}
