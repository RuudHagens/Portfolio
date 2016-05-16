using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mycraft
{
    public partial class Home : System.Web.UI.Page
    {
        private ForumController forumcontroller = new ForumController();
        List<Post> Postlijst; 

        protected void Page_Load(object sender, EventArgs e)
        {
            Postlijst = new List<Post>(forumcontroller.HaalPostHomepageOp());

            foreach (Post p in Postlijst)
            {
                Image profielfoto = new Image();
                profielfoto.ImageUrl = "~/images/CreeperFace.png";
                Image uploadsel = new Image();
                uploadsel.Style.Add("float", "right");
                uploadsel.ImageUrl = p.File;
                uploadsel.Width = 500;
                Label tekst = new Label();
                tekst.Style.Add("float", "left");
                tekst.Text = p.Tekst;
                tekst.Width = 300;

                TableRow tr1 = new TableRow();
                TableRow tr2 = new TableRow();
                tr2.CssClass = "info table-bordered";
                TableRow tr3 = new TableRow();
                tr3.CssClass = "table-bordered";
                TableHeaderCell thc1 = new TableHeaderCell();
                TableHeaderCell thc2 = new TableHeaderCell();
                thc2.Style.Add("text-align", "right");
                TableHeaderCell thc3 = new TableHeaderCell();
                TableCell tc1 = new TableCell();
                TableCell tc2 = new TableCell();
                TableCell tc3 = new TableCell();
                TableCell tc4 = new TableCell();

                thc1.Text = p.Plaatser.Naam;
                thc2.Text = p.Datum.ToString();
                thc3.Text = "";
                tc2.Controls.Add(profielfoto);
                tc3.Controls.Add(tekst);
                tc4.Controls.Add(uploadsel);
                tr1.Cells.Add(tc1);
                tr2.Cells.Add(thc1);
                tr2.Cells.Add(thc3);
                tr2.Cells.Add(thc2);
                tr3.Cells.Add(tc2);
                tr3.Cells.Add(tc3);
                tr3.Cells.Add(tc4);
                PostTable.Rows.Add(tr1);
                PostTable.Rows.Add(tr2);
                PostTable.Rows.Add(tr3);
            }
        }
    }
}