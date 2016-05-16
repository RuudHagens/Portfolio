using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SME_Camping.Classes;

namespace SME_Camping.pages
{
    public partial class Products : System.Web.UI.Page
    {
        private DataConnection connection;
        private ReservationSystem reservationSystem;

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = DataConnection.GetInstance();
            reservationSystem = ReservationSystem.GetInstance();
            RefreshAvailableItems();
        }

        public void RefreshAvailableItems()
        {
            List<Item_Edition> itemEditions = reservationSystem.GetAllItemEditions();

            foreach(Item_Edition i in itemEditions)
            {
                LbAvailable.Items.Add(i.ToString());
            }
        }
    }
}