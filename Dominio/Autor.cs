using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Autor
    {
        public int CodigoAutor { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Celular { get; set; }

        public override string ToString()
        {
            return Nombre + " " + Apellido;
        }
    }

    
}
