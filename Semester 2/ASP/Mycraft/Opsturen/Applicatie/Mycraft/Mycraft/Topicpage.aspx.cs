using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Mycraft
{
    public partial class Topicpage : System.Web.UI.Page
    {
        private ForumController forumcontroller = new ForumController();
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
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

            foreach (Topic t in this.forumcontroller.HaalTopicLijstOp())
            {
                dt.Rows.Add(t.Naam, t.Maker.Naam, t.Aanmaakdatum, t.Views, forumcontroller.TelPostsPerTopic(t.Naam));
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
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

        protected void btnMaakTopicAan_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("~/Loginpage.aspx");
                }
                else
                {
                    forumcontroller.MaakTopic(tbNieuwTopic.Text);
                    this.Response.Redirect("~/TopicPage.aspx");
                }
            }
            catch (Exception ex)
            {
                PlaatsTopicTitle.InnerText = ex.Message;
                PlaatsTopicTitle.Style.Add("color", "red");
            }
        }
    }
}