using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Mycraft
{
    public partial class Profielpagina : System.Web.UI.Page
    {
        public ForumController forumcontroller = new ForumController();
        public GebruikerController gebruikercontroller = new GebruikerController();
        List<Post> Postlijst;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Profielnaam"] == null)
            {
                this.Response.Redirect("~/Home.aspx");
            }
            else 
            {
                //Hier wordt de profiel informatie geladen
                Profiel p = gebruikercontroller.HaalProfielGegevensOp(Convert.ToString(Session["Profielnaam"]));
                tbEmail.Text = p.Email;
                tbNaam.Text = p.Naam;
                tbSoortGebruiker.Text = p.SoortGebruiker;

                //Hier worden de posts bij het profiel geladen
                Postlijst = new List<Post>(gebruikercontroller.HaalPostProfielOp(Convert.ToString(Session["Profielnaam"])));

                foreach (Post post in Postlijst)
                {
                    Image profielfoto = new Image();
                    profielfoto.ImageUrl = "~/images/CreeperFace.png";
                    Image uploadsel = new Image();
                    uploadsel.Style.Add("float", "right");
                    uploadsel.ImageUrl = post.File;
                    uploadsel.Width = 500;
                    Label tekst = new Label();
                    tekst.Style.Add("float", "left");
                    tekst.Text = post.Tekst;
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

                    thc1.Text = post.Plaatser.Naam;
                    thc2.Text = post.Datum.ToString();
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
                    tabProfielPosts.Rows.Add(tr1);
                    tabProfielPosts.Rows.Add(tr2);
                    tabProfielPosts.Rows.Add(tr3);
                }

                //Hier worden de topics bij het profiel geplaatst
                if (!Page.IsPostBack)
                {
                    dt = new DataTable();
                    MakeDataTable();
                }
                else
                {
                    dt = (DataTable)ViewState["DataTable"];
                }
                ViewState["DataTable"] = dt;

                foreach (Topic t in this.gebruikercontroller.HaalTopicProfielOp(Convert.ToString(Session["Profielnaam"])))
                {
                    dt.Rows.Add(t.Naam, t.Maker.Naam, t.Aanmaakdatum, t.Views, forumcontroller.TelPostsPerTopic(t.Naam));
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        private void MakeDataTable()
        {
            dt.Columns.Add("Naam");
            dt.Columns.Add("Maker");
            dt.Columns.Add("AanmaakDatum");
            dt.Columns.Add("AantalKeer");
            dt.Columns.Add("AantalPosts");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "GaNaarTopic")
            {
                int Index = Convert.ToInt32(e.CommandArgument);
                GridViewRow Row = GridView1.Rows[Index];
                string topicnaam = Row.Cells[0].Text;
                Session["Topicnaam"] = topicnaam;
                forumcontroller.AddView(topicnaam);
                this.Response.Redirect("~/TopicPostPage.aspx");
            }
        }
    }
}