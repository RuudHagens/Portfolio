using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Drawing;

namespace ADayAtTheRaces
{
    class Grayhound
    {
        public int StartingPosition = 5;
        public int RacetrackLength = 600;
        public PictureBox MyPictureBox = null;
        public int Location = 0;
        public Random Randomizer;

        public bool Run()
        {
            Random Randomizer = new Random();
            Point p = MyPictureBox.Location;
            p.X += Randomizer.Next (1, 10);
            MyPictureBox.Location = p;
            if (p.X >= RacetrackLength)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public void TakeStartingPosition() 
        {      
            Point p  = MyPictureBox.Location;
            p.X = StartingPosition;
            MyPictureBox.Location = p;
        } 
    }
}
