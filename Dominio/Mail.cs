using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Mail
    {
        public string Destinatario { get; set; }
        public string Remitente { get; set; }
        public string Mensaje { get; set; }
        public string Asunto { get; set; }
        public string MedioContacto { get; set; }
        public Usuario DetalleUsuario { get; set; }

        public Libro DetalleLibro { get; set; }
       
    }
}
