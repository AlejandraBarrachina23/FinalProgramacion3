using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Web;
using Dominio;

namespace Negocio
{
    public class MailNegocio
    {
        private MailMessage Email = new MailMessage();
        private SmtpClient Cliente = new SmtpClient();

        private void EnviarMail(string From, string To, string Password, string Mensaje, string Subject, string body)
        {

            Email.To.Add(To);
            Email.From = new MailAddress(From);
           
            Email.BodyEncoding = System.Text.Encoding.UTF8;
            Email.Subject = Subject;
            Email.SubjectEncoding = System.Text.Encoding.UTF8;

            Email.Body = body;
            Email.IsBodyHtml = true;
            Cliente.UseDefaultCredentials = false;
            Cliente.Credentials = new NetworkCredential(From, Password);

            Cliente.Port = 587;
            Cliente.EnableSsl = true;
            Cliente.Host = "smtp.gmail.com";

            //LinkedResource image = new LinkedResource(System.Web.HttpContext.Current.Server.MapPath("~/img/mailing"));
            //image.ContentId = "logo-completo";


            try
            {
                Cliente.Send(Email);

            }
            catch (System.Net.Mail.SmtpException ex)
            {

            }

        }

        private void generarMailingUsuario(Usuario destinatario)
        {

            string body = string.Empty;

            using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/mail-template.html")))
            {

                body = reader.ReadToEnd();

            }
            body = body.Replace("{nombreUsuario}", destinatario.NombreUsuario);

            EnviarMail("alejandrabarrachina23@gmail.com", destinatario.Email, "barr1989Share.", " ", "Ediciones-Elemento - Enviada", body);
        }

        public void generarMailing(Usuario unUsuario, string mensaje, Libro libroSolicitado, string medioContacto, string tipoMensaje)
        {

            string body = string.Empty;

            if (tipoMensaje == "consultaCompuesta")
            {
                using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/mail-template-admin.html")))
                {

                    body = reader.ReadToEnd();

                }

                body = body.Replace("{nombreUsuario}", unUsuario.NombreUsuario);
                body = body.Replace("{email}", unUsuario.Email);
                body = body.Replace("{celular}", unUsuario.Celular.ToString());
                body = body.Replace("{medioContacto}", medioContacto);
                body = body.Replace("{formato}", libroSolicitado.Formato.Medidas);
                body = body.Replace("{genero}", libroSolicitado.Genero);
                body = body.Replace("{cantidadCaracteres}", libroSolicitado.cantidadCaracteres.ToString());
                body = body.Replace("{cantidadEjemplares}", libroSolicitado.cantidadCaracteres.ToString());
                body = body.Replace("{cantidadImagenes}", libroSolicitado.cantidadImagenes.ToString());

            }

            else {

                using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/mail-template-admin-index.html")))
                {

                    body = reader.ReadToEnd();

                }

                body = body.Replace("{nombreUsuario}", unUsuario.NombreUsuario);
                body = body.Replace("{email}", unUsuario.Email);
                body = body.Replace("{celular}", mensaje);

            }

            EnviarMail("alejandrabarrachina23@gmail.com", "alejandrabarrachina23@gmail.com", "barr1989Share.", " ", "Ediciones-Elemento - Consulta", body);
            generarMailingUsuario(unUsuario);
            
        }

    }
}
