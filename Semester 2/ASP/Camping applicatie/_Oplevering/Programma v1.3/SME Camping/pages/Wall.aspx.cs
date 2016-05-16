using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SME_Camping.Classes;

namespace SME_Camping.pages
{
    public partial class Wall : System.Web.UI.Page
    {
        private static List<Message> MessageList;

        public static List<Message> GetListInstance()
        {
            if (MessageList == null)
            {
                MessageList = new List<Message>();
            }
            return MessageList;
        }


        protected int NumberOfControls
        {
            get { return (int)ViewState["NumControls"]; }
            set { ViewState["NumControls"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                this.NumberOfControls = 0;
            else
                LoadPage();
            GetListInstance();
        }

        private void LoadPage()
        {
            Panel1.Controls.Clear();
            foreach (Message m in MessageList)
            {
                this.createControls(m);
            }
        }

        private void createControls(Message message)
        {
            Panel pn = new Panel();
            TextBox tb = new TextBox();
            pn.ID = "pnPostBox" + message.PostID.ToString();
            tb.ID = "tbPostText" + message.PostID.ToString();
            pn.GroupingText = message.MesTitle;
            tb.Text = message.MesText;
            tb.Enabled = false;
            pn.Controls.Add(tb);
            Panel1.Controls.Add(pn);
        }

        protected void BtnFileSharing_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.location.href='FileSharing.aspx'", true);
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            Panel pn = new Panel();
            TextBox tb = new TextBox();
            pn.ID = "pnPostBox" + NumberOfControls.ToString();
            tb.ID = "tbPostText" + NumberOfControls.ToString();
            pn.GroupingText = TbTitle.Text;
            tb.Text = TbPost.Text;
            tb.Enabled = false;
            pn.Controls.Add(tb);
            Panel1.Controls.Add(pn);
            User b = new User("testUser", "test@testemail.com", 2); //ingelogde user
            MessageList.Add(new Message(TbTitle.Text, TbPost.Text, b, TbTitle.Text, TbPost.Text, NumberOfControls, 0, 0, 0, 0));
            NumberOfControls++;
        }
    }
}