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
                unAutor.Apellido = (string)AccederDatos.LectorDatos["Apellido"];

                ListadoAutores.Add(unAutor);
            }

            return ListadoAutores;


        }
    }
}
