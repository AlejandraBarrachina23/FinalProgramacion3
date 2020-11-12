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
        public Formato Formato { get; set; }
        public string Sinopsis { get; set; }
        public int AnioEdicion { get; set; }
        public double Precio { get; set; }
        public Autor Autor { get; set; }
        public Editorial Editorial { get; set; }

        public string Portada { get; set; }

        public void setearLibro(string ISBN, string Titulo, int CodigoFormato, string Sinopsis,
            int AnioEdicion, int CodigoAutor, int CodigoEditorial, string Portada)
        {
            Formato = new Formato();
            Autor = new Autor();
            Editorial = new Editorial();

            this.ISBN = ISBN;
            this.Titulo = Titulo;
            Formato.CodigoFormato = CodigoFormato;            
            this.Sinopsis = Sinopsis;
            this.AnioEdicion = AnioEdicion;
            Autor.CodigoAutor = CodigoAutor;
            Editorial.CodigoEditorial = CodigoEditorial;
            this.Portada = Portada;
        }
    }

}
