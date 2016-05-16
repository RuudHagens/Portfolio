using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Mycraft
{
    public partial class ZoekPagina : System.Web.UI.Page
    {
        private ForumController forumcontroller = new ForumController();
        DataTable dtprofielen;
        DataTable dttopics;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dtprofielen = new DataTable();
                dttopics = new DataTable();
                MakeDataTableProfielen();
                MakeDataTableTopics();
            }
            else
            {
                dtprofielen = (DataTable)ViewState["DataTableProfielen"];
                dttopics = (DataTable)ViewState["DataTableTopics"];
            }
            ViewState["DataTableProfielen"] = dtprofielen;
            ViewState["DataTableTopics"] = dttopics;

            foreach (string s in this.forumcontroller.ZoekProfielen(Convert.ToString(Session["Zoekfunctie"])))
            {
                dtprofielen.Rows.Add(s);
            }

            foreach (string s in this.forumcontroller.Zoektopics(Convert.ToString(Session["Zoekfunctie"])))
            {
                dttopics.Rows.Add(s);
            }
            gvProfielen.DataSource = dtprofielen;
            gvProfielen.DataBind();
            gvTopics.DataSource = dttopics;
            gvTopics.DataBind();
        }

        private void MakeDataTableProfielen()
        {
            dtprofielen.Columns.Add("Profiel");
        }

        private void MakeDataTableTopics()
        {
            dttopics.Columns.Add("Topic");
        }

        protected void gvProfielen_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "GaNaarGevondenProfiel")
            {
                int Index = Convert.ToInt32(e.CommandArgument);
                GridViewRow Row = gvProfielen.Rows[Index];
                string profielnaam = ((LinkButton)(Row.Cells[0].Controls[0])).Text;
                Session["Profielnaam"] = profielnaam;
                this.Response.Redirect("~/Profielpagina.aspx");
            }
        }

        protected void gvTopics_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "GaNaarGevondenTopic")
            {
                int Index = Convert.ToInt32(e.CommandArgument);
                GridViewRow Row = gvTopics.Rows[Index];
                string topicnaam = ((LinkButton)(Row.Cells[0].Controls[0])).Text;
                Session["Topicnaam"] = topicnaam;
                forumcontroller.AddView(topicnaam);
                this.Response.Redirect("~/TopicPostPage.aspx");
            }
        }
    }
}