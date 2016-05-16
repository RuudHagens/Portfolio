using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mycraft
{
    public partial class WachtwoordVeranderenPagina : System.Web.UI.Page
    {
        public GebruikerController gebruikercontroller = new GebruikerController();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerander_Click(object sender, EventArgs e)
        {
            if (tbWachtwoord.Text != tbHerhaalWachtwoord.Text)
            {
                WachtwoordTitle.InnerText = "Wachtwoord is niet correct herhaald";
                WachtwoordTitle.Style.Add("color", "red");
            }
            else
            {
                try
                {
                    this.gebruikercontroller.WachtwoordVeranderen(tbEmail.Text, tbWachtwoord.Text);
                    this.Response.Redirect("~/Loginpage.aspx");
                }
                catch (Exception ex)
                {
                    WachtwoordTitle.InnerText = ex.Message;
                    WachtwoordTitle.Style.Add("color", "red");
                }
            }
        }
    }
}