using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace whoAmI
{
    public partial class Form1 : Form
    {
        Elephant lloyd;
        Elephant lucinda;
        

        public Form1()
        { 
            InitializeComponent();
            lucinda = new Elephant() { Name = "Lucinda", EarSize = 33 };
            lloyd = new Elephant() { Name = "Lloyd", EarSize = 40 };
        }


        private void btnLloyd_Click(object sender, EventArgs e)
        {
            lloyd.WhoAmI();
        }

        private void btnLucinda_Click(object sender, EventArgs e)
        {
            lucinda.WhoAmI();
        }

        private void btnSwap_Click(object sender, EventArgs e)
        {
            Elephant holder;
            holder = lloyd;
            lloyd = lucinda;
            lucinda = holder;
            MessageBox.Show("Objects swapped"); 
        }

        private void btnRandom_Click(object sender, EventArgs e)
        {
               lloyd = lucinda;
               lloyd.EarSize = 4321;
               lloyd.WhoAmI();
        }


    }
}
