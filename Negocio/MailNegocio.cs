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

        private void GenerarMail(Mail unMail, string body)
        {
            Email.To.Clear();
            Email.To.Add(unMail.Destinatario);
            Email.From = new MailAddress("code.test.aspx@gmail.com");

            Email.BodyEncoding = System.Text.Encoding.UTF8;
            Email.Subject = unMail.Asunto ;
            Email.SubjectEncoding = System.Text.Encoding.UTF8;

            Email.Body = body;
            Email.IsBodyHtml = true;
            Cliente.UseDefaultCredentials = false;
            Cliente.Credentials = new NetworkCredential("code.test.aspx@gmail.com", "codetest1234");

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

        public void EnviarMail(Mail unMail, string tipoConsulta) {

            if (tipoConsulta == "sencilla")
            {

                unMail.Asunto = "Ediciones Elemento - Consulta Recibida";
                GenerarMail(unMail, generarNotificacionUsuario(unMail));
                unMail.Destinatario = "code.test.aspx@gmail.com";
                unMail.Asunto = "Ediciones Elemento - Consulta Usuario";
                GenerarMail(unMail, generarMailingAdministrador(unMail, "Consulta Sencilla"));
            }

            else if (tipoConsulta == "compleja")
            {

                unMail.Asunto = "Ediciones Elemento - Consulta Recibida";
                GenerarMail(unMail, generarNotificacionUsuario(unMail));
                unMail.Destinatario = "code.test.aspx@gmail.com";
                unMail.Asunto = "Ediciones Elemento - Consulta Usuario";
                GenerarMail(unMail, generarMailingAdministrador(unMail, "Consulta Compleja"));

            }

            else if (tipoConsulta == "restauracion")
            {

                unMail.Asunto = "Ediciones Elemento - Restauración Contraseña";
                unMail.Destinatario = unMail.DetalleUsuario.Email;
                unMail.Mensaje = "Estimado cliente ha solicitado sus datos personales para poder iniciar sesión. A continuación se los detallamos, recuerde no compartirlos.";
                GenerarMail(unMail, generarMailingAdministrador(unMail, "Notificacion-Alta-Restauracion"));

            }

            else if (tipoConsulta == "alta usuario") {

                unMail.Asunto = "Ediciones Elemento - Alta usuario";
                unMail.Destinatario = unMail.DetalleUsuario.Email;
                unMail.Mensaje = "Estimado, su usuario y contraseña han sido dada de alta. A continuación dejamos sus datos para iniciar sesión.";
                GenerarMail(unMail, generarMailingAdministrador(unMail, "Notificacion-Alta-Restauracion"));
            }

            
            
        }


        private string generarMailingAdministrador(Mail MailEnviar, string TipoMail)
        {
            string bodyHTML = string.Empty;

            if (TipoMail == "Consulta Sencilla")
            {
                using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/mail-notificacion-admin.html")))
                {
                    bodyHTML = reader.ReadToEnd();
                }

                bodyHTML = bodyHTML.Replace("{nombreUsuario}", MailEnviar.DetalleUsuario.NombreUsuario);
                bodyHTML = bodyHTML.Replace("{email}", MailEnviar.DetalleUsuario.Email);
                bodyHTML = bodyHTML.Replace("{mensaje}", MailEnviar.Mensaje);

            }

            else if (TipoMail == "Consulta Compleja")
            {

                using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/mail-notificacion-admin-contacto.html")))
                {

                    bodyHTML = reader.ReadToEnd();

                }

                bodyHTML = bodyHTML.Replace("{nombreUsuario}", MailEnviar.DetalleUsuario.NombreUsuario);
                bodyHTML = bodyHTML.Replace("{email}", MailEnviar.DetalleUsuario.Email);
                bodyHTML = bodyHTML.Replace("{celular}", MailEnviar.DetalleUsuario.Celular.ToString());
                bodyHTML = bodyHTML.Replace("{medioContacto}", MailEnviar.MedioContacto);
                bodyHTML = bodyHTML.Replace("{formato}", MailEnviar.DetalleLibro.Formato.Medidas);
                bodyHTML = bodyHTML.Replace("{genero}", MailEnviar.DetalleLibro.Genero);
                bodyHTML = bodyHTML.Replace("{cantidadCaracteres}", MailEnviar.DetalleLibro.cantidadCaracteres.ToString());
                bodyHTML = bodyHTML.Replace("{cantidadEjemplares}", MailEnviar.DetalleLibro.cantidadEjemplares.ToString());
                bodyHTML = bodyHTML.Replace("{cantidadImagenes}", MailEnviar.DetalleLibro.cantidadImagenes.ToString());
            }

            else if (TipoMail == "Notificacion-Alta-Restauracion") {

                using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/mail-notificacion-restauracion.html")))
                {

                    bodyHTML = reader.ReadToEnd();

                }

                bodyHTML = bodyHTML.Replace("{nombreUsuario}", MailEnviar.DetalleUsuario.NombreUsuario);
                bodyHTML = bodyHTML.Replace("{email}", MailEnviar.DetalleUsuario.Email);
                bodyHTML = bodyHTML.Replace("{contrasenia}", MailEnviar.DetalleUsuario.Contrasenia.ToString());
                bodyHTML = bodyHTML.Replace("{Nombre}", MailEnviar.DetalleUsuario.Nombre.ToString());
                bodyHTML = bodyHTML.Replace("{Apellido}", MailEnviar.DetalleUsuario.Apellido.ToString());
                bodyHTML = bodyHTML.Replace("{mensaje}", MailEnviar.Mensaje);

            }
            
            return bodyHTML;
        }

        private string generarNotificacionUsuario(Mail unMail) {

            string bodyHTML = string.Empty;

            using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/mail-notificacion-usuario.html")))
            {

                bodyHTML = reader.ReadToEnd();
            }

            bodyHTML = bodyHTML.Replace("{nombreUsuario}", unMail.DetalleUsuario.NombreUsuario);

            return bodyHTML;
        }

    }
}
