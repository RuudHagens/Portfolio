using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Trekking
{
    public partial class TrekkingForm : Form
    {
        private Trekking trekking;
        private int animationCounter;

        public TrekkingForm()
        {
            InitializeComponent();

            btnStop.Enabled = false;
            btnTrek.Enabled = false;
            btnSorteer.Enabled = false;
            btnLaatZien.Enabled = false;
            btnSerie.Enabled = false;
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            lbNummers.Items.Clear();

            if (tbMaxwaarde.Text == "" || tbAantalGewenst.Text == "")
            {
                MessageBox.Show("Je moet wel wat invullen!");
            }
            else
            {
                trekking = new Trekking(Convert.ToInt32(tbMaxwaarde.Text), Convert.ToInt32(tbAantalGewenst.Text));

                if (trekking.Maxwaarde >= 2 * trekking.AantalGewenst)
                {
                    btnStop.Enabled = true;
                    btnTrek.Enabled = true;
                    btnSerie.Enabled = true;
                    btnStart.Enabled = false;
                }
                else
                {
                    MessageBox.Show("maxwaarde is niet 2x zo veel als Aantal Gewenst");
                }
            }
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            btnStop.Enabled = false;
            btnTrek.Enabled = false;
            btnSorteer.Enabled = false;
            btnLaatZien.Enabled = false;
            btnSerie.Enabled = false;
            btnStart.Enabled = true;
        }

        private void btnLaatZien_Click(object sender, EventArgs e)
        {
            animationCounter = 1;
            animationTimer.Start();
        }

        private void btnSorteer_Click(object sender, EventArgs e)
        {
            trekking.Sort();
            RefreshListbox();
        }

        private void btnSerie_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < Convert.ToInt32(tbAantalGewenst.Text); i++)
            {
                trekking.TrekGetal();
                btnTrek.Enabled = false;

                if (trekking.AantalGetrokken == Convert.ToInt32(tbAantalGewenst.Text))
                {
                    btnSerie.Enabled = false;
                    btnLaatZien.Enabled = true;
                    btnSorteer.Enabled = true;
                }
                lbNummers.Items.Add(GetTrekkingData());
            }
        }

        private void btnTrek_Click(object sender, EventArgs e)
        {

            if (trekking.AantalGetrokken < Convert.ToInt32(tbAantalGewenst.Text))
            {
                trekking.TrekGetal();
                btnSerie.Enabled = false;
                lbNummers.Items.Add(GetTrekkingData());
                if (trekking.AantalGetrokken == Convert.ToInt32(tbAantalGewenst.Text))
                {
                    btnTrek.Enabled = false;
                    btnLaatZien.Enabled = true;
                    btnSorteer.Enabled = true;
                }
            }
            
            
        }

        private string GetTrekkingData()
        {
            int getal = trekking.GeefGetal(trekking.AantalGetrokken);
            string getalString = Convert.ToString(getal);
            return getalString;
        }

        private void RefreshListbox()
        {
            lbNummers.Items.Clear();
            for (int i = 1; i <= trekking.AantalGetrokken; i++)
            {
                lbNummers.Items.Add(trekking.GeefGetal(i));
            }
            
        }

        private void animationTimer_Tick(object sender, EventArgs e)
        {
            int getal = trekking.GeefGetal(animationCounter);
            pbGetal.Image = animationImageList.Images[getal];
            animationCounter++;
            if (animationCounter > trekking.AantalGetrokken)
            {
                animationTimer.Stop();
                pbGetal.Image = animationImageList.Images[100];
            }
        }

        
    }
}
