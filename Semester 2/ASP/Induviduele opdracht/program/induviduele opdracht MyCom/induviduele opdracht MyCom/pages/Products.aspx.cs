using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace induviduele_opdracht_MyCom.pages
{
    public partial class Products : System.Web.UI.Page
    {
        Product productClass = new Product();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void GvProducten_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        //Selecteerd producten van het gekozen merk
        protected void DdlMerk_SelectedIndexChanged(object sender, EventArgs e)
        {
            product.SelectCommand = productClass.GetProductsByMerk(Convert.ToString(DdlMerk.SelectedItem));
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        //zoek producten met ingetypte tekst
        protected void btnZoek_Click(object sender, EventArgs e)
        {
            product.SelectCommand = productClass.ZoekProduct(tbZoek.Text);
        }

        //voegt/verwijderd producten toe/uit winkelwagen en veranderd konp naam in gridview
        protected void GvProducten_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "AddToCart")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GvProducten.Rows[index];
            }


            if (Session ["Email"] == null)
            {
                Response.Redirect("~/pages/Login.aspx");
            }
            if (e.CommandName == "AddToCart")
            {
                int Index = Convert.ToInt32(e.CommandArgument);
                GridViewRow Row = GvProducten.Rows[Index];
                string productName = Row.Cells[1].Text;
                Button b = null;
                b = (Button)GvProducten.Rows[Index].Cells[6].Controls[0];
                b.Text = "Verwijder";


                if (ddlShoppingCart.Items.Contains(new ListItem(Row.Cells[2].Text)))
                {

                    ddlShoppingCart.Items.Remove(Row.Cells[2].Text);
                    Button b2 = null;
                    b2 = (Button)GvProducten.Rows[Index].Cells[6].Controls[0];
                    b2.Text = "Kopen";
                }
                else
                {
                    ddlShoppingCart.Items.Add(Row.Cells[2].Text);
                }
            }
        }
    }
}