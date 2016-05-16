using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace dinnerparty
{
    public partial class Form1 : Form
    {
        DinnerParty dinnerParty;
        public Form1()
        {
            InitializeComponent();
            dinnerParty = new DinnerParty() { NumberOfPeople = 5 };
            dinnerParty.SetHealthyOption(false);
            dinnerParty.CalculateCostOfDecorations(true);
            DisplayDinnerPartyCost();
        }

        private void DisplayDinnerPartyCost()
        { 
            decimal Cost = dinnerParty.CalculateCost(cbHealty.Checked);
            lblCost.Text = Cost.ToString("c");
        }

        private void nudPeople_ValueChanged(object sender, EventArgs e)
        {
            dinnerParty.NumberOfPeople = (int)nudPeople.Value;
            DisplayDinnerPartyCost();
        }

        private void cbFancy_CheckedChanged(object sender, EventArgs e)
        {
            dinnerParty.CalculateCostOfDecorations(cbFancy.Checked);
            DisplayDinnerPartyCost();
        }

        private void cbHealty_CheckedChanged(object sender, EventArgs e)
        {
            dinnerParty.SetHealthyOption(cbHealty.Checked);
            DisplayDinnerPartyCost();
        }

    }
}
