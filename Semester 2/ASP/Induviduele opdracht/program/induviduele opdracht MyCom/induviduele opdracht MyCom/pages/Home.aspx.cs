using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace induviduele_opdracht_MyCom.pages
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        //haalt subcategoriën bij hoofd categorie op
        protected void LbHoofdCategegorie_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategorieData.SelectCommand = "SELECT cat_naam FROM categorie WHERE parent_cat_id= (SELECT cat_id FROM categorie WHERE cat_naam ='" + LbHoofdCategegorie.SelectedItem + "')";
        }

        protected void LbSubArtikel_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        
        //haalt artikelen bij subcategorie op
        protected void LbSubcategorie_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProductFromCat.SelectCommand = "SELECT naam FROM artikel WHERE cat_id = (SELECT cat_id FROM categorie WHERE cat_naam ='" + LbSubcategorie.SelectedItem + "')";
        }
    }
}