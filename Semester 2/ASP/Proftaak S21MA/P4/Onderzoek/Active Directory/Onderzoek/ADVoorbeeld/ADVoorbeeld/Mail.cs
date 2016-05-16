using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace ADVoorbeeld
{
    public class Mail
    {
        private string EmailAdress;
        private string Password;
        private int Port;
        private string SmtpHost;

        public Mail()
        {
            this.EmailAdress = "admin@s21ma.local";
            this.Password = "Welkom01";
            this.Port = 25;
            this.SmtpHost = "192.168.20.146";
        }

        public void Send(string Reciever, string Subject, string Body)
        {

            MailMessage mail = new MailMessage();
            mail.To.Add(Reciever);
            mail.From = new MailAddress(EmailAdress, EmailAdress, System.Text.Encoding.UTF8);
            mail.Subject = Subject;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = Body;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;

            SmtpClient client = new SmtpClient();

            client.EnableSsl = false;
            client.Credentials = new System.Net.NetworkCredential(EmailAdress, Password);

            client.Port = Port;
            client.Host = SmtpHost;
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
