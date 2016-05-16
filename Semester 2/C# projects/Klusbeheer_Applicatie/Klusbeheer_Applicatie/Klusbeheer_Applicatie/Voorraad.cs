using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows.Forms;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
namespace Klusbeheer_Applicatie
{
    class Voorraad
    {
        private List<Gereedschap> gereedschappen = new List<Gereedschap>();
        public List<Gereedschap> Gereedschappen
        {
            get { return gereedschappen; }
        }
        public Voorraad ()
        {

        }
        public void LaadGereedschappen() // Laad alle gereedschappen uit een binary file. (zie map voor voorbeeld file)
        {
            FileStream file = null;
            BinaryFormatter formatter;
            gereedschappen.Clear();
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.ShowDialog();
            try
            {
                file = new FileStream(ofd.FileName, FileMode.Open, FileAccess.Read);
                formatter = new BinaryFormatter();
                gereedschappen = (List<Gereedschap>)formatter.Deserialize(file);
            }
            catch (IOException exc)
            {
                MessageBox.Show(exc.Message);
            }
            catch (SerializationException exc)
            {
                MessageBox.Show(exc.Message);
            }
            finally
            {
                if (file != null)
                {
                    file.Close();
                }
            }
        }
        public void SlaGereedschappenOp() // Sla alle gereedschappen op in een binary file.
        {
            FileStream file = null;
            BinaryFormatter formatter;
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.FileName = "Gereedschappen.bin";
            sfd.ShowDialog();
            try
            {
                file = new FileStream(sfd.FileName, FileMode.Create, FileAccess.Write);
                formatter = new BinaryFormatter();
                formatter.Serialize(file, gereedschappen);
                MessageBox.Show("De lijst met gereedschappen is geëxporteerd naar: " + sfd.FileName);
            }
            catch (IOException exc)
            {
                MessageBox.Show(exc.Message);
            }
            catch (SerializationException exc)
            {
                MessageBox.Show(exc.Message);
            }
            finally
            {
                file.Close();
            }
        }
        public void SorteerOpAanschafDatum()
        {
            Gereedschappen.Sort();
        }
        public List<HandGereedschap> SorteerOpPrijsMerk() // Sorteer op prijs of merk, zie SorteerPrijsMerkComparer.
        {
            SorteerPrijsMerkComparer sPrijsMerk = new SorteerPrijsMerkComparer();
            List<HandGereedschap> sorteerdHandGereedschap = new List<HandGereedschap>();
            foreach (HandGereedschap handGereedschap in Gereedschappen)
            {
                sorteerdHandGereedschap.Add(handGereedschap);
            }
            sorteerdHandGereedschap.Sort(sPrijsMerk);
            return sorteerdHandGereedschap;
        }
        public void VoegToe(Gereedschap gereedschap)
        {
            gereedschappen.Add(gereedschap);
        }
        public List<Gereedschap> ZoekGereedschap(DateTime keuringsDatum) // Doorloop alle gereedschappen en voeg alle machines toe die dezelfde keurdatum hebben als de opgegeven datum.
        {
            List<Gereedschap> keuringGereedschap = new List<Gereedschap>();
            foreach (Machine machine in gereedschappen)
            {
                if (machine.KeuringsDatum == keuringsDatum)
                {
                    keuringGereedschap.Add(machine);
                }
            }
            return keuringGereedschap;
        }
        public Gereedschap ZoekGereedschap(int nummer) // Doorloop alle gereedschappen en kijk of het nummer overeen komt met het opgegeven nummer.
        {
            Gereedschap gevondenGereedschap = null;
            foreach (Gereedschap gereedschap in gereedschappen)
            {
                if (gereedschap.ArtikelNummer == nummer)
                {
                    gevondenGereedschap = gereedschap;
                }
            }
            return gevondenGereedschap;
        }
        public Gereedschap ZoekGereedschap(string naam)
        {
            return null;
        }
    }
}
