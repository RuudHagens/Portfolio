using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ADayAtTheRaces
{
    class guys
    {
        public string Name;
        public bet MyBet = null;
        public int Cash; 
        public RadioButton MyRadioButton;
        public Label MyLabel;

        public guys()
        {
            MyBet = new bet(this); 
        }

        public void UpdateLabels()
        {
            if (MyBet == null)
            {
                MyLabel.Text = Name + " hasn't placed a bet";
            }
            else
            {
                MyLabel.Text = MyBet.GetDescription();
                MyRadioButton.Text = Name + " has " + Cash + " bucks";
            }
        }

        public void ClearBet()
        {
            MyBet.Amount = 0;
        }

        public bool PlaceBet(int Amount, int Dog)
        {

            if (Cash >= Amount)
            {
                //Cash = Cash - Amount;
                MyBet.Amount = Amount;
                MyBet.Dog = Dog;
                MyBet.Bettor = this;
                UpdateLabels();
                return true;
            }
            else
            {
                MessageBox.Show("You have not enough cash to bet.");
                return false;
            }
        }

        public void Collect(int Winnaarbekend)
        {
            if (MyBet != null)
            {
                Cash += MyBet.PayOut(Winnaarbekend);
            }
        }
    }
}