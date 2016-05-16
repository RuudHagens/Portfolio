using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Trekking
{
    class Trekking
    {
        private Random random;
        private int[] getallen;

        public int Maxwaarde { get; private set; } //maximum waarde van te trekken getal
        public int AantalGetrokken { get; private set; } //aantal getrokken getallen
        public int AantalGewenst { get; private set; } //aantal te trekken getallen
        public bool IsTenEinde { get; private set; } //true als alle getallen getrokken

        public Trekking(int maxwaarde, int aantalGewenst)
        {

            Maxwaarde = maxwaarde;
            AantalGewenst = aantalGewenst;
            AantalGetrokken = 0;
            IsTenEinde = false;

            random = new Random();
            getallen = new int[AantalGewenst];
        }

        public void TrekGetal()
        {
            int getal = random.Next(1, Maxwaarde + 1);
            bool bestaatGetal = InArray(getal, getallen, AantalGetrokken);
            if (bestaatGetal == false)
            {
                getallen[AantalGetrokken] = getal;
                AantalGetrokken++;
            }
            else
            {
                TrekGetal();
            }
        }

        public int GeefGetal(int number)
        {
            return getallen[number -1];
        }

        public void Sort()
        {
            Array.Sort(getallen);
        }

        private bool InArray(int getal, int[] getallen, int aantal)
        {
            for (int i = 0; i < aantal; i++)
            {
                if (getallen[i] == getal)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
