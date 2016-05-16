using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace induviduele_opdracht_MyCom.pages
{
    public partial class Registratie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        //kijkt of ingevulde gegevens kloppen en roept dan registreer methode aan
        //regstreren als particulier werkt niet door onbekende reden
        protected void btnRegistreer_Click(object sender, EventArgs e)
        {
                if (rbtnParticulier.Checked == true)
                {
                    if (!String.IsNullOrEmpty(tbEmail.Text) && !String.IsNullOrEmpty(tbWachtwoord.Text) && !String.IsNullOrEmpty(TbNaam.Text) && !String.IsNullOrEmpty(tbTelefoon.Text) &&
                        !String.IsNullOrEmpty(TbGeboorteDatum.Text) && !String.IsNullOrEmpty(TbAdres.Text) && !String.IsNullOrEmpty(tbLand.Text) &&
                        !String.IsNullOrEmpty(TbSocial.Text) && !String.IsNullOrEmpty(tbNickname.Text))
                    {
                        Gebruiker.Register(tbEmail.Text, TbNaam.Text, tbWachtwoord.Text,
                        Convert.ToInt32(tbTelefoon.Text), TbGeboorteDatum.Text, TbAdres.Text, tbLand.Text, TbSocial.Text,
                        rbtnParticulier.Text, tbBedrijfsnaam.Text, Convert.ToInt32(TbOndernemingsnummer.Text), TbBtwnr.Text, tbNickname.Text);
                        lblError.Visible = false;
                        Response.Redirect("~/pages/Login.aspx");
                    }
                    else
                    {
                        lblError.Visible = true;
                    }
                }
                else if (rbtnZakelijk.Checked == true)
                {
                    if (!String.IsNullOrEmpty(tbEmail.Text) && !String.IsNullOrEmpty(tbWachtwoord.Text) && !String.IsNullOrEmpty(TbNaam.Text) && !String.IsNullOrEmpty(tbTelefoon.Text) &&
                        !String.IsNullOrEmpty(TbGeboorteDatum.Text) && !String.IsNullOrEmpty(TbAdres.Text) && !String.IsNullOrEmpty(tbLand.Text) &&
                        !String.IsNullOrEmpty(TbSocial.Text) && !String.IsNullOrEmpty(tbBedrijfsnaam.Text) && !String.IsNullOrEmpty(TbOndernemingsnummer.Text) &&
                        !String.IsNullOrEmpty(TbBtwnr.Text))
                    {
                        Gebruiker.Register(tbEmail.Text, TbNaam.Text, tbWachtwoord.Text, 
                        Convert.ToInt32(tbTelefoon.Text),TbGeboorteDatum.Text, TbAdres.Text, tbLand.Text, TbSocial.Text, 
                        rbtnZakelijk.Text, tbBedrijfsnaam.Text, Convert.ToInt32(TbOndernemingsnummer.Text), TbBtwnr.Text, tbNickname.Text);
                        lblError.Visible = false;
                        Response.Redirect("~/pages/Login.aspx");
                    }
                    else
                    {
                        lblError.Visible = true;
                    }                   
                }
        }

        //maakt de gegevens zichtbaar die relevant zijn bij particulier
        protected void rbtnParticulier_CheckedChanged(object sender, EventArgs e)
        {
            rbtnZakelijk.Checked = false;
            lblBedrijfsnaam.Visible = false;
            tbBedrijfsnaam.Visible = false;
            lblBtwnr.Visible = false;
            TbBtwnr.Visible = false;
            lblOndernemingsnummer.Visible = false;
            TbOndernemingsnummer.Visible = false;
            lblNickname.Visible = true;
            tbNickname.Visible = true;
        }

        //maakt de gegevens zichtbaar die relevant zijn bij particulier
        protected void rbtnZakelijk_CheckedChanged(object sender, EventArgs e)
        {
            rbtnParticulier.Checked = false;
            lblBedrijfsnaam.Visible = true;
            tbBedrijfsnaam.Visible = true;
            lblBtwnr.Visible = true;
            TbBtwnr.Visible = true;
            lblOndernemingsnummer.Visible = true;
            TbOndernemingsnummer.Visible = true;
            lblNickname.Visible = false;
            tbNickname.Visible = false;
        }
    }
}