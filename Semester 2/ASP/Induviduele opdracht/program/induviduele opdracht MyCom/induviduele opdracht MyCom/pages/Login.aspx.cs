using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace induviduele_opdracht_MyCom.pages
{
    public partial class Login : System.Web.UI.Page
    {
        int result = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //roept login methode aan en maakt session van de ingelode gebruiker
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            result = Gebruiker.login(tbEmail.Text, TbPassword.Text);

            if (result.ToString() == "1")
            {
                Session["Email"] = tbEmail.Text;
                Session["Wachtwoord"] = TbPassword.Text;
                lblLoginFailed.Visible = false;
                Response.Redirect("~/pages/Home.aspx");
            }

            else
            {
                lblLoginFailed.Visible = true;
            }
        }
    }
}