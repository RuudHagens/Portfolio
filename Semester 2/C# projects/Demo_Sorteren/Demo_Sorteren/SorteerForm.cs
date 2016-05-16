using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Demo_Sorteren
{
    public partial class SorteerForm : Form
    {
        //lijsten declareren
        List<string> groenteLijst;
        List<Vak> vakkenLijst;
        List<Boek> boekenLijst;
        public SorteerForm()
        {
            InitializeComponent();
            VulGroenteLijst();
            VulVakkenLijst();
            VulBoekenLijst();
            VulGroenteListBox();
            VulVakkenListBox();
            VulBoekenListBox();
        }

        /// <summary>
        /// Deze methode vult de lijst met groente
        /// </summary>
        public void VulGroenteLijst()
        {
            groenteLijst = new List<string>();
            groenteLijst.Add("spinazie");
            groenteLijst.Add("andijvie");
            groenteLijst.Add("bloemkool");
            groenteLijst.Add("wortel");
            groenteLijst.Add("paksoi");
        }

        /// <summary>
        /// Deze methode vult de lijst met vakken
        /// </summary>
        public void VulVakkenLijst()
        {
            vakkenLijst = new List<Vak>();
            vakkenLijst.Add(new Vak("SE12", 4, 1));
            vakkenLijst.Add(new Vak("SE2", 6, 1));
            vakkenLijst.Add(new Vak("IN2", 5, 1));
            vakkenLijst.Add(new Vak("GSO3", 5, 2));
            vakkenLijst.Add(new Vak("JSF31", 3, 2));
        }

        /// <summary>
        /// Deze methode vult de lijst met boeken
        /// </summary>
        public void VulBoekenLijst()
        {
            boekenLijst = new List<Boek>();
            boekenLijst.Add(new Boek("Lord of the Rings", "Tolkien, J.R.R", 1000));
            boekenLijst.Add(new Boek("Hungergames", "Collins, Suzanne", 420));
            boekenLijst.Add(new Boek("Ship of Magic", "Hobb, Robin", 868));
            boekenLijst.Add(new Boek("Pillars of the Earth", "Follett, Ken", 1124));
        }

        /// <summary>
        /// Deze methode vult de listbox met groente
        /// </summary>
        public void VulGroenteListBox()
        {
            lbGroente.Items.Clear();
            foreach (string g in groenteLijst)
            {
                lbGroente.Items.Add(g);
            }
        }

        /// <summary>
        /// Deze methode vult de listbox met vakken
        /// </summary>
        public void VulVakkenListBox()
        {
            lbVakken.Items.Clear();
            foreach (Vak v in vakkenLijst)
            {
                lbVakken.Items.Add(v.ToString());
            }
        }

        /// <summary>
        /// Deze methode vult de listbox met boeken
        /// </summary>
        public void VulBoekenListBox()
        {
            lbBoeken.Items.Clear();
            foreach (Boek b in boekenLijst)
            {
                lbBoeken.Items.Add(b.ToString());
            }
        }

        private void btSorteerGroente_Click(object sender, EventArgs e)
        {
            groenteLijst.Sort();
            VulGroenteListBox();
        }

        private void btSorteerVakken_Click(object sender, EventArgs e)
        {
            vakkenLijst.Sort();
            VulVakkenListBox();
        }

        private void btSorteerOpTitel_Click(object sender, EventArgs e)
        {
            //maak een instantie van de class die IComparer implementeert.
            Boek_SorteerOpTitel opTitel = new Boek_SorteerOpTitel();
            boekenLijst.Sort(opTitel);
            VulBoekenListBox();
        }

        private void btSorteerOpAuteur_Click(object sender, EventArgs e)
        {
            Boek_SorteerOpAuteur opAuteur = new Boek_SorteerOpAuteur();
            boekenLijst.Sort(opAuteur);
            VulBoekenListBox();
        }

        private void btSorteerOpAantalPaginas_Click(object sender, EventArgs e)
        {
            Boek_SorteerOpAantalPaginasDesc opAantalPaginas = new Boek_SorteerOpAantalPaginasDesc();
            boekenLijst.Sort(opAantalPaginas);
            VulBoekenListBox();
        }



     
    }
}
