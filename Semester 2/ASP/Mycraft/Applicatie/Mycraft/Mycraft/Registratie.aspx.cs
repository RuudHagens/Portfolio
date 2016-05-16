using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mycraft
{
    public partial class Registratie : System.Web.UI.Page
    {
        public GebruikerController gebruikercontroller = new GebruikerController();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistreer_Click(object sender, EventArgs e)
        {
            if (tbWachtwoord.Text != tbHerhaalWachtwoord.Text)
            {
                RegistratieTitle.InnerText = "Wachtwoord is niet correct herhaald";
            }
            else
            {
                try
                {
                    Loginpage.Profiel = this.gebruikercontroller.RegistreerNieuweGebruiker(this.tbNaam.Text, this.tbEmail.Text, this.tbWachtwoord.Text);
                }
                catch (Exception ex)
                {
                    RegistratieTitle.InnerText = ex.Message;
                    RegistratieTitle.Style.Add("color", "red");
                }

                if (Loginpage.Profiel != null)
                {
                    Session["Email"] = tbEmail.Text;
                    Response.Redirect("~/Home.aspx");
                }
            }
        }
    }
}