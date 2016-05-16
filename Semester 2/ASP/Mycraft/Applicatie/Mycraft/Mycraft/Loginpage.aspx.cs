using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mycraft
{
    public partial class Loginpage : System.Web.UI.Page
    {
        private static Profiel profiel;
        public GebruikerController gebruikercontroller = new GebruikerController();

        public static Profiel Profiel
        {
            get { return profiel; }
            set { profiel = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoginTitle.InnerText = "Voer je login gegevens in!";

            if (Session["Email"] != null)
            {
                tbEmail.Text = Convert.ToString(Session["Email"]);
                tbEmail.Enabled = false;
                tbWachtwoord.Enabled = false;
                btnLogin.Text = "Logout";
                LoginTitle.InnerText = "Uitloggen";
                btnRegistreer.Enabled = false;
                btnRegistreer.Visible = false;
                TekstOf.Visible = false;
                btnWachtwoordVeranderen.Visible = false;
                TekstOf2.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (btnLogin.Text == "Logout")
            {
                LoginTitle.InnerText = "Voer je login gegevens in!";
                Session["Email"] = null;
                profiel = null;
                Response.Redirect("~/Home.aspx");
                tbEmail.Enabled = true;
                tbWachtwoord.Enabled = true;
                btnRegistreer.Enabled = true;
                btnRegistreer.Visible = true;
                TekstOf.Visible = true;
                btnWachtwoordVeranderen.Visible = true;
                TekstOf2.Visible = true;
            }
            else
            {
                try
                {
                    profiel = this.gebruikercontroller.Login(this.tbEmail.Text, this.tbWachtwoord.Text);
                }
                catch (Exception ex)
                {
                    LoginTitle.InnerText = ex.Message;
                    LoginTitle.Style.Add("color", "red");
                }

                if (profiel != null)
                {
                    Session["Email"] = tbEmail.Text;
                    Response.Redirect("~/Home.aspx");
                }
            }
        }

        protected void btnRegistreer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registratie.aspx");
        }

        protected void btnWachtwoordVeranderen_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WachtwoordVeranderenPagina.aspx");
        }
    }
}