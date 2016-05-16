using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mycraft
{
    public partial class MycraftMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                navProfiel.InnerText = Loginpage.Profiel.Naam;
                navLogin.InnerText = "Logout";
                Session["Profielnaam"] = navProfiel.InnerText;
            }
            else
            {
                navProfiel.Visible = false;
            }
        }

        protected void btnZoek_Click(object sender, EventArgs e)
        {
            Session["Zoekfunctie"] = tbZoek.Text;
            this.Response.Redirect("~/ZoekPagina.aspx");
        }
    }
}