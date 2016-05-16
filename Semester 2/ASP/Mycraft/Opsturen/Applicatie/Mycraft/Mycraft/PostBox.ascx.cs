using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mycraft
{
    public partial class PostBox : System.Web.UI.UserControl
    {
        List<Post> Postlijst;

        protected void Page_Load(object sender, EventArgs e)
        {
            

            Postlijst = new List<Post>();
            Postlijst.Add(new Post(1, "Poep", new DateTime(2011, 6, 10), "egtrh", new Profiel(1, "Pieter", "pieter@pieter.com", "Admin")));
            Postlijst.Add(new Post(1, "bla", new DateTime(2011, 6, 10), "egtrh", new Profiel(1, "Pieter", "pieter@pieter.com", "Admin")));

            foreach (Post p in Postlijst)
            {
                lblGebruikernaam.Text = p.Plaatser.Naam;
                lblDatumPost.Text = p.Datum.ToString();
                lblPostTekst.Text = p.Tekst;
            }
        }
    }
}