using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Dominio;

namespace Negocio
{
    public class FormatoNegocio
    {

        private AdministradorAccesoDatos AccederDatos = new AdministradorAccesoDatos();

       
        public List<Formato> ListadoFormato()
        {

            List<Formato> ListadoFormato = new List<Formato>();
            AccederDatos.AbrirConexion();
            AccederDatos.DefinirTipoComando("select ID_Formato, Medidas_Formato from Formatos");
            AccederDatos.EjecutarConsulta();

            while (AccederDatos.LectorDatos.Read())
            {
                Formato unFormato = new Formato();
    

                unFormato.CodigoFormato = (int)AccederDatos.LectorDatos["ID_Formato"];
                unFormato.Medidas = (string)AccederDatos.LectorDatos["Medidas_Formato"];


                ListadoFormato.Add(unFormato);
            }

            return ListadoFormato;

        }
    }
}
