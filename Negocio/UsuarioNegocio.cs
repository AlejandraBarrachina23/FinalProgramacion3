using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;


namespace Negocio
{
   public class UsuarioNegocio
    {
                
        private MailMessage Email = new MailMessage();
        private SmtpClient Cliente = new SmtpClient();

        public void EnviarMail(string From, string To, string Password, string Mensaje, string Subject)
        {

            Email.To.Add(To);
            Email.From = new MailAddress(From);
            Email.Body = Mensaje;
            Email.BodyEncoding = System.Text.Encoding.UTF8;
            Email.Subject = Subject;
            Email.SubjectEncoding = System.Text.Encoding.UTF8;
            Email.IsBodyHtml = true;

            Cliente.UseDefaultCredentials = false;
            Cliente.Credentials = new NetworkCredential(From, Password);

            Cliente.Port = 587;
            Cliente.EnableSsl = true;
            Cliente.Host = "smtp.gmail.com";

            try
            {
                Cliente.Send(Email);
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                
            }

        }

        
    }
}
