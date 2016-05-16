using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ADVoorbeeld
{
    public partial class Form1 : Form
    {
        public ADFuncties aDFuncties = new ADFuncties();
        public Mail mail;
        public Form1()
        {
            mail = new Mail();
            InitializeComponent();

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            bool authenticated = false;

            authenticated = aDFuncties.Authenticate(tbNaam.Text, tbWachtwoord.Text);

            if (authenticated)
            {
                lblLoginStatus.Text = "Ingelogd";
                
            }
            else
            {
                lblLoginStatus.Text = "Niet Ingelogd";
            }
        }

        private void btnVraagInfo_Click(object sender, EventArgs e)
        {
            //lbInfo.Items.AddRange(aDFuncties.GetADUserInfo(tbNaamInfo.Text).ToArray());
            //lblTitel.Text = aDFuncties.GetUserInfo(tbNaamInfo.Text);
            //label1.Text = aDFuncties.HaalEmailOp(tbNaamInfo.Text);
            string ontvanger = "mick@s21ma.local";
            string subject = "test";
            string body = "Test, dit is een test";
            try
            {
                mail.Send(ontvanger, subject, body);
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
