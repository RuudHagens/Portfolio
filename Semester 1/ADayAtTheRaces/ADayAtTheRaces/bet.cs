using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ADayAtTheRaces
{
    class bet
    {
        public int Amount;
        public int Dog;
        public guys Bettor;
        public bet(guys g)
        {
            Bettor = g;
        }

        public string GetDescription()
        {
            if (Amount > 0)
            {
            return Bettor.Name + " bets " + Amount + " bucks on dog #" + Dog;
            }
            else
            {
            return Bettor.Name + " " + " hasn't placed a bet";
            }
        }
        public int PayOut(int Winnaarbekend)
        {
            if (Winnaarbekend == Dog)
            {
                return Amount;
            }
            else
            {
                return -Amount;
            }
        }
    }
}