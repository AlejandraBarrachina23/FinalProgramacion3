using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAO
{
   
      

        public class AdministradorAccesoDatos
       
        {
            public static string RutaBaseDatos = "data source =.; initial catalog= EdicionesElemento; integrated security=sspi";
            private SqlConnection conexionSQL;
            private SqlCommand comandoSQL;
            private SqlDataReader lectorDatos;

            public AdministradorAccesoDatos()
            {
            conexionSQL = new SqlConnection(RutaBaseDatos);
            }

            public SqlCommand Comando
            {
                get { return comandoSQL; }
            }

            public SqlDataReader LectorDatos
            {
                get { return lectorDatos; }
            }

            public void DefinirTipoComando(string consulta)
            {
                comandoSQL = new SqlCommand();
                comandoSQL.CommandType = System.Data.CommandType.Text;
                comandoSQL.CommandText = consulta;
            }

            public void DefinirProcedimientoAlmacenado(string procedimeintoAlmacenado)
            {
                comandoSQL = new SqlCommand();
                comandoSQL.CommandType = System.Data.CommandType.StoredProcedure;
                comandoSQL.CommandText = procedimeintoAlmacenado;
            }

            public void AbrirConexion()
            {

                conexionSQL.Open();
            }

            public void CerrarConexion()
            {

                conexionSQL.Close();
            }

            public void EjecutarAccion()
            {

                comandoSQL.Connection = conexionSQL;
                comandoSQL.ExecuteNonQuery();
            }

            public void EjecutarConsulta()
            {
                comandoSQL.Connection = conexionSQL;
                lectorDatos = comandoSQL.ExecuteReader();
            }

            public void CerrarReader()
            {

                lectorDatos.Close();
            }

            public int ejecutarAccionReturn()
            {
                try
                {
                    comandoSQL.Connection = conexionSQL;
                    return (int)comandoSQL.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            public decimal ejecutarAccionReturnDouble()
            {
                try
                {
                    comandoSQL.Connection = conexionSQL;
                    var resultado = comandoSQL.ExecuteScalar();

                    if (resultado == DBNull.Value)
                    {
                        return 0;
                    }

                    return (decimal)resultado;

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }

    }

