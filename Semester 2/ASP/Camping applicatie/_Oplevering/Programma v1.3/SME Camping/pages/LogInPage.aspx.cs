using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SME_Camping.Classes;

namespace SME_Camping
{
    public partial class LogInPage : System.Web.UI.Page
    {
        private DataConnection connection;
        private User loggedInUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IngelogdeUser"] != null)
            {
                loggedInUser = (User)Session["IngelogdeUser"];
            }
            CbChangePassword.AutoPostBack = true;
            connection = SME_Camping.Classes.DataConnection.GetInstance();
        }

        protected void CbChangePassword_CheckedChanged(object sender, EventArgs e)
        {
            if (CbChangePassword.Checked)
            {
                LblNewPassword.Visible = true;
                TbNewPassword.Visible = true;
                LblRepeatPassword.Visible = true;
                TbRepeatPassword.Visible = true;
            }
            
            else
            {
                LblNewPassword.Visible = false;
                TbNewPassword.Visible = false;
                LblRepeatPassword.Visible = false;
                TbRepeatPassword.Visible = false;
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if(CbChangePassword.Checked != true)
            {
                string userName = tbUserName.Text;
                string password = TbPassword.Text;
                loggedInUser = connection.LogIn(userName, password);

                if(loggedInUser == null)
                {
                    tbUserName.Text = "";
                    TbPassword.Text = "";
                    lblLoginFail.Visible = true;
                    return;
                }
                else
                {
                    Response.Redirect("Home.aspx");
                    lblLoginFail.Visible = false;
                    Session.Add("IngelogdeUser", loggedInUser);

                }
            }
        }
    }
}