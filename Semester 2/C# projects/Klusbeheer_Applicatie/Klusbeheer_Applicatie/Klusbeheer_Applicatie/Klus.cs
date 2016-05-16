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
    class Klus
    {
        private DateTime startDatum;
        private DateTime eindDatum;
        private string typeWerk;
        private List<Gereedschap> gereedschapsLijst = new List<Gereedschap>();
        private Adres adres;

        public enum KlusType
        {
            Literals,
            Elektriciteit,
            Loodgieterswerk,
            Schilderwerk,
            Timmerwerk
        };

        public DateTime StartDatum
        {
            get { return startDatum; }
        }
        public DateTime EindDatum
        {
            get { return eindDatum; }
        }
        public string TypeWerk
        {
            get { return typeWerk; }
        }
        public Adres Adres
        {
            get { return adres;}
        }
        public Klus (DateTime startDatum, DateTime eindDatum, string typeWerk, Adres adres)
        {
            this.startDatum = startDatum;
            this.eindDatum = eindDatum;
            this.typeWerk = typeWerk;
            this.adres = adres;
        }
        public void MaakGereedschapsLijst (List<Gereedschap> gereedschapslijst)
        {

        }
        public void SlaKlusOp() // Sla de klus op in een text file.
        {
            FileStream file = null;
            StreamReader reader = null;
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.FileName = startDatum + "_klus.txt";
            sfd.ShowDialog();
            try
            {
                string path = sfd.FileName;
                file = new FileStream(path, FileMode.Create, FileAccess.ReadWrite);
                StreamWriter writer = new StreamWriter(file);
                writer.WriteLine("Type klus: "  + typeWerk + "\n\nAdres\nStraat: " + adres.Straat + "\nHuisnummer: " + adres.Huisnummer + "\nPlaats: " + adres.Plaats + "\n\nStart datum: " + startDatum + "\nEind datum: " + eindDatum + "\n" + gereedschapsLijst);
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
                reader.Close();
                file.Close();
            }
        }
        }
    }
