using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Libro
    {
        public string ISBN { get; set; }
        public  string Titulo { get; set; }
        public Formato CodigoFormato { get; set; }
        public string Sinopsis { get; set; }
        public int AnioEdicion { get; set; }
        public double Precio { get; set; }
        public Autor CodigoAutor { get; set; }
        public Editorial CodigoEditorial { get; set; }

        public string Portada { get; set; }

        public void setearLibro(string ISBN, string Titulo, Formato CodigoFormato, string Sinopsis,
            int AnioEdicion, Autor CodigoAutor, Editorial CodigoEditorial, string Portada)
        {
            this.ISBN = ISBN;
            this.Titulo = Titulo;
            this.CodigoFormato = CodigoFormato;
            this.Sinopsis = Sinopsis;
            this.AnioEdicion = AnioEdicion;
            this.CodigoAutor = CodigoAutor;
            this.CodigoEditorial = CodigoEditorial;
        }
    }

}
