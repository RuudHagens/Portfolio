using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo_Sorteren
{
    public class Boek
    {
        //fields
        private string titel;
        private string auteur;
        private int aantalPaginas;

        //properties
        public string Titel { get { return titel; } }
        public string Auteur { get { return auteur; } }
        public int AantalPaginas { get { return aantalPaginas; } }

        //constructor
        public Boek(string titel, string auteur, int aantalPaginas)
        {
            this.titel = titel;
            this.auteur = auteur;
            this.aantalPaginas = aantalPaginas;
        }

        //methods

        public override string ToString()
        {
            return "Titel: " + titel + " - Auteur: " + auteur + " - Aantal pagina's: " + aantalPaginas;
        }
    }

    public class Boek_SorteerOpTitel : IComparer<Boek>
    {
        public int Compare(Boek x, Boek y)
        {
            return string.Compare(x.Titel, y.Titel);
        }
    }

    public class Boek_SorteerOpAuteur : IComparer<Boek>
    {
        public int Compare(Boek x, Boek y)
        {
            return string.Compare(x.Auteur, y.Auteur);
        }
    }

    public class Boek_SorteerOpAantalPaginasDesc : IComparer<Boek>
    {
        public int Compare(Boek x, Boek y)
        {
            if (x.AantalPaginas < y.AantalPaginas) return 1;
            else if (x.AantalPaginas > y.AantalPaginas) return -1;
            else return 0;
        }
    }
}
