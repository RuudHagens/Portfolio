using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace SharedFunctions.Objects
{
    public class Mail
    {
        //SharedFunctions.Objects.Mail test = new SharedFunctions.Objects.Mail("mailserversme@gmail.com", "s21vcs21vc", 587, "smtp.gmail.com");
        //test.Send("chiel@sprangers.org", "sub", "inhoud");
        private string EmailAdress;
        private string Password;
        private int Port;
        private string SmtpHost;

        public Mail()
        {
            this.EmailAdress = "admin@s21ma.local";
            this.Password = "Welkom01";
            this.Port = 587;
            this.SmtpHost = smtp.s21ma.local;
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

            client.EnableSsl = true;
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
