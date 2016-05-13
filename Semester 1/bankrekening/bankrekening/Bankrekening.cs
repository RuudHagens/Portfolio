using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace bankrekening
{
    class Bankrekening
    {
        //datavelden
        private int rekeningnummer;
        private string naam;
        private decimal saldo;
        private static int volgendeVrijeRekeningnummer = 2001;

        //properties
        public int Rekeningnummer { get { return rekeningnummer; } }
        public string Naam { get { return naam; } }
        public decimal Saldo { get { return saldo; } }

        //bedrag in hele centen
        //negatieve getallen worden genegeerd.
        public void NeemOp( decimal bedrag)
        {
            if (bedrag >= 0)
            {
                if (bedrag >= saldo)
                {
                    MessageBox.Show("you don't have enough saldo.");
                }

                else
                {
                    saldo -= bedrag;
                }
            }
            else
            {
                MessageBox.Show("You can't deposit a negative number.");
            }
        }

        //bedrag in hele centen
        //negatieve getallen worden genegeerd.
        public void Stort( decimal bedrag)
        {
            if (bedrag >= 0)
            {
                saldo += bedrag;
            }

            else
            {
                MessageBox.Show("You can't deposit a negative number.");
            }
        }

        public void MaakOverNaar( Bankrekening andereRekening, decimal bedrag)
        {
            if (bedrag >= 0)
            {
                if (bedrag >= saldo)
                {
                    MessageBox.Show("you don't have enough saldo.");
                }

                else
                {
                    saldo -= bedrag;
                    andereRekening.saldo += bedrag;
                }
            }
            else
            {
                MessageBox.Show("You can't deposit a negative number.");
            }
        }
 
        //constructors
        public Bankrekening( string naam)
        {
            this.naam = naam;
            saldo = 0;
            //volgendeVrijeRekeningnummer is klassevariable,
            //je kunt this niet gebruiken
            rekeningnummer = volgendeVrijeRekeningnummer++;
        }

        public Bankrekening( string naam, decimal saldo)
        {
            this.naam = naam;
            this.saldo = saldo;
            rekeningnummer = volgendeVrijeRekeningnummer++;
        } 
    }
}
