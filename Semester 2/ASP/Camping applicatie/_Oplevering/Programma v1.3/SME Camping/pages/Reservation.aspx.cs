using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SME_Camping.Classes;

namespace SME_Camping.pages
{
    public partial class Reservation : System.Web.UI.Page
    {
        private ReservationSystem reservationSystem;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            CbMainBooker.AutoPostBack = true;
            reservationSystem = ReservationSystem.GetInstance();
            FillDropdownList();
        }

        public void EmptyTextboxes()
        {
            TbFirstName.Text = "";
            TbInsertion.Text = "";
            TbAchternaam.Text = "";
            TbWoonplaats.Text = "";
            TbStraat.Text = "";
            TbHuisnummer.Text = "";
            TbRekeningNr.Text = "";
            TbEmail.Text = "";
        }

        public void RefreshListbox()
        {
            LbReservering.Items.Clear();

            MainBooker m = null;
            foreach(User u in reservationSystem.ReturnList())
            {
                m = u as MainBooker;
                if(m != null)
                {
                    LbReservering.Items.Add(m.ToString());
                }
                else
                {
                    LbReservering.Items.Add(u.ToString());
                }
            }
        }

        public void FillDropdownList()
        {
            List<Spot> freeSpots = reservationSystem.GetFreeSpots();

            foreach(Spot s in freeSpots)
            {
                DdlPlaatsnr.Items.Add(s.ToString());
            }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            string firstName = TbFirstName.Text;
            string insertion = TbInsertion.Text;
            string lastName = TbAchternaam.Text;
            string email = TbEmail.Text;

            bool cbChecked = CbMainBooker.Checked;
            if(cbChecked)
            {

                string residence = TbWoonplaats.Text;
                string street = TbStraat.Text;
                string bankNr = TbRekeningNr.Text;
                int streetnumber;
                if (!Int32.TryParse(TbHuisnummer.Text, out streetnumber))
                {
                    LbStreetNumberWarning.Visible = true;
                    return;
                }

                if(insertion != "")
                {
                    reservationSystem.AddUserToReservation(new MainBooker(firstName, lastName, residence, street, streetnumber, bankNr, email));
                }
                else
                {
                    reservationSystem.AddUserToReservation(new MainBooker(firstName, insertion, lastName, residence, street, streetnumber, bankNr, email));
                }
                RefreshListbox();
                CbMainBooker.Checked = false;
                CbMainBooker.Enabled = false;
                CbMainBooker_CheckedChanged(sender, e);
            }
            else
            {
                if(insertion != "")
                {
                    reservationSystem.AddUserToReservation(new User(firstName + insertion + lastName, email, 2));
                }
                else
                {
                    reservationSystem.AddUserToReservation(new User(firstName + lastName, email, 2));
                }
                RefreshListbox();
            }
            EmptyTextboxes();
        }

        protected void CbMainBooker_CheckedChanged(object sender, EventArgs e)
        {
            bool cbChecked = CbMainBooker.Checked;
            if(cbChecked)
            {
                TbStraat.Visible = true;
                TbHuisnummer.Visible = true;
                TbWoonplaats.Visible = true;
                TbRekeningNr.Visible = true;
                LblStraat.Visible = true;
                LblHuisnr.Visible = true;
                LblWoonplaats.Visible = true;
                LblRekeningnr.Visible = true;
            }
            else
            {
                TbStraat.Visible = false;
                TbHuisnummer.Visible = false;
                TbWoonplaats.Visible = false;
                TbRekeningNr.Visible = false;
                LblStraat.Visible = false;
                LblHuisnr.Visible = false;
                LblWoonplaats.Visible = false;
                LblRekeningnr.Visible = false;
            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            ListItem lItem = LbReservering.SelectedItem;
            if(lItem == null)
            {
                //bmelding geven dat er niets is geselecteerd.
                return;
            }

            int index = LbReservering.SelectedIndex;
            int mainbookerRemoved = reservationSystem.RemoveUserFromReservation(index);       
            if(mainbookerRemoved != 0)
            {
                CbMainBooker.Enabled = true;
            }
            RefreshListbox();
        }
    }
}