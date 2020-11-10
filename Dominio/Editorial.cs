using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Editorial
    {
        public int CodigoEditorial { get; set; }
        public string NombreEditorial { get; set; }

        public override string ToString()
       
        {
            return NombreEditorial;
        }
    }

    
}
