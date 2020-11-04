using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Formato
    {
        public int CodigoFormato { get; set; }
        public string Medidas { get; set; }

        public override string ToString()
        {
            return Medidas;
        }
    }
}
