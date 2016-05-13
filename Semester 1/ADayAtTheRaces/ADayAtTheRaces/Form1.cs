using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ADayAtTheRaces
{
    public partial class Form1 : Form
    {
        Grayhound[] Dog;
        guys[] Bettor;
        guys currentPlayer;
        int WinnendeHond = 0;


        public Form1()
        {
            InitializeComponent();
            Random Randomizer = new Random();

            Dog = new Grayhound[4];
            Bettor = new guys[3];

            Bettor[0] = new guys()
            {
                Name = "Joe",
                MyRadioButton = rbtnJoe,
                MyLabel = lblJoebet,
                Cash = 100,
            };


            Bettor[1] = new guys()
            {
                Name = "Bob",
                MyRadioButton = rbtnBob,
                MyLabel = lblBobBet,
                Cash = 100,
            };


            Bettor[2] = new guys()
            {
                Name = "Al",
                MyRadioButton = rbtnAl,
                MyLabel = lblAlBet,
                Cash = 100,
            };

            Bettor[0].UpdateLabels();
            Bettor[1].UpdateLabels();
            Bettor[2].UpdateLabels();


            Dog[0] = new Grayhound()
            {
                MyPictureBox = pbDog1,
                StartingPosition = pbDog1.Left,
                RacetrackLength = pbTrack.Width - pbDog1.Width,
                Randomizer = Randomizer
            };

            Dog[1] = new Grayhound()
           {
               MyPictureBox = pbDog2,
               StartingPosition = pbDog2.Left,
               RacetrackLength = pbTrack.Width - pbDog2.Width,
               Randomizer = Randomizer
           };

            Dog[2] = new Grayhound()
           {
               MyPictureBox = pbDog3,
               StartingPosition = pbDog3.Left,
               RacetrackLength = pbTrack.Width - pbDog3.Width,
               Randomizer = Randomizer
           };

            Dog[3] = new Grayhound()
           {
               MyPictureBox = pbDog4,
               StartingPosition = pbDog4.Left,
               RacetrackLength = pbTrack.Width - pbDog4.Width,
               Randomizer = Randomizer
           };

            currentPlayer = Bettor[0];

        }



        private void btnBet_Click(object sender, EventArgs e)
        {
            if (rbtnJoe.Checked == true)
            {
                Bettor[0].PlaceBet((int)nudBet.Value, (int)nudDog.Value);
                Bettor[0].UpdateLabels();
            }

            if (rbtnBob.Checked == true)
            {
                Bettor[1].PlaceBet((int)nudBet.Value, (int)nudDog.Value);
                Bettor[1].UpdateLabels();
            }

            if (rbtnAl.Checked == true)
            {
                Bettor[2].PlaceBet((int)nudBet.Value, (int)nudDog.Value);
                Bettor[2].UpdateLabels();
            }


        }

        private void btnRace_Click(object sender, EventArgs e)
        {
            int Winnaarbekend = 0;
            
            while (Winnaarbekend == 0)
            {
                for (int x = 0; x < 4; x++)
                {
                    if (Dog[x].Run())
                    {
                        WinnendeHond = x + 1;
                        MessageBox.Show("De winnaar is hond #" + WinnendeHond + " Gefeliciteerd!");
                        Winnaarbekend++;

                        for (int i = 0; i < 4; i++)
                        {
                            Dog[i].TakeStartingPosition();
                        }
                    }


                    pbTrack.Refresh();
                    System.Threading.Thread.Sleep(2);

                }
            }
                for (int i = 0; i < Bettor.Length; i++)
                {
                    Bettor[i].Collect(WinnendeHond);
                    Bettor[i].ClearBet();
                    Bettor[i].UpdateLabels();
                }

                nudBet.Value = nudBet.Minimum;
                nudDog.Value = nudDog.Minimum;

            }
        

        private void rbtnJoe_CheckedChanged(object sender, EventArgs e)
        {
            lblName.Text = "Joe";
        }

        private void rbtnBob_CheckedChanged(object sender, EventArgs e)
        {
            lblName.Text = "Bob";
        }

        private void rbtnAl_CheckedChanged(object sender, EventArgs e)
        {
            lblName.Text = "Al";
        }



    }
}

