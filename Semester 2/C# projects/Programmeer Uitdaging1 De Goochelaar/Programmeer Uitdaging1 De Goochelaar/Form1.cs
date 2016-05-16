using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Programmeer_Uitdaging1_De_Goochelaar
{
    public partial class Form1 : Form
    {
        int rondenr = 1;
        int startregel = 2;
        public List<string> uitgelezentekst;

        public Form1()
        {
            InitializeComponent();
            uitgelezentekst = new List<string>();            
        }

        public List<string> HaalRondeDataOp()
        {
            string txtfile = "input_goochelaaropdracht.txt";
            int aantalregels = 10;
            foreach (string s in System.IO.File.ReadAllLines(txtfile).Skip((startregel - 1)).Take(aantalregels))
            {
                uitgelezentekst.Add(s);
            }
            return uitgelezentekst;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (startregel == 2)
            {
                VulForm();
                CheckOvereenkomsten();
            }
        }

        public void VulForm()
        {
            HaalRondeDataOp();
            lblRonde1GekozenRij.Text = uitgelezentekst.ElementAt(0);
            for (int i = 1; i < 5; i++)
            {
                string regelnummerrij = uitgelezentekst.ElementAt(i);
                string[] split = regelnummerrij.Split(' ');
                dgvRonde1.Rows.Add(split.ElementAt(0), split.ElementAt(1), split.ElementAt(2), split.ElementAt(3));
            }
            lblRonde2GekozenRij.Text = uitgelezentekst.ElementAt(5);
            for (int i = 6; i < 10; i++)
            {
                string regelnummerrij = uitgelezentekst.ElementAt(i);
                string[] split = regelnummerrij.Split(' ');
                dgvRonde2.Rows.Add(split.ElementAt(0), split.ElementAt(1), split.ElementAt(2), split.ElementAt(3));
            }
        }

        private void btnVorige_Click(object sender, EventArgs e)
        {
            if(rondenr > 1)
            {
                uitgelezentekst.Clear();
                dgvRonde1.Rows.Clear();
                dgvRonde2.Rows.Clear();
                startregel -= 10;
                VulForm();
                rondenr -= 1;
                lblHuidigeRonde.Text = "Ronde: " + rondenr.ToString();
                CheckOvereenkomsten();
                this.Refresh();
            }
            else
            {
                MessageBox.Show("Je kan niet lager dan ronde 1 gaan");
            }
        }

        private void btnVolgende_Click(object sender, EventArgs e)
        {
            if (rondenr < 100)
            {
                uitgelezentekst.Clear();
                dgvRonde1.Rows.Clear();
                dgvRonde2.Rows.Clear();
                startregel += 10;
                VulForm();
                rondenr += 1;
                lblHuidigeRonde.Text = "Ronde: " + rondenr.ToString();
                CheckOvereenkomsten();
                this.Refresh();
            }
            else
            {
                MessageBox.Show("Je kan niet hoger dan ronde 100 gaan");
            }
        }

        public void CheckOvereenkomsten()
        {
            int overeenkomsten = 0;
            lblOvereenkomend.Text = "";
            DataGridViewRow dgv1Row = dgvRonde1.Rows[Convert.ToInt32(lblRonde1GekozenRij.Text)-1];
            DataGridViewRow dgv2Row = dgvRonde2.Rows[Convert.ToInt32(lblRonde2GekozenRij.Text)-1];
            for (int x = 0; x < 4; x++)
            {
                for (int y = 0; y < 4; y++)
			    {
                    string w = dgv1Row.Cells[x].Value.ToString();
                    string z = dgv2Row.Cells[y].Value.ToString();

                    if (w == z)
                    {
                        lblOvereenkomend.Text += w + " ";
                        overeenkomsten += 1;
                    }
			    }
            }
            if (overeenkomsten == 0)
            {
                lblGelukt.Text = "de vrijwilliger speelde vals";
            }
            if (overeenkomsten == 1)
            {
                lblGelukt.Text = "De kaart van de vrijwilliger is " +lblOvereenkomend.Text;
            }
            if (overeenkomsten > 1)
            {
                lblGelukt.Text = "slechte goochelaar!";
            }
        }
    }
}
