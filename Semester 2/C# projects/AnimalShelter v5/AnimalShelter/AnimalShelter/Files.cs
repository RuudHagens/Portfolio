using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.Windows.Forms;

namespace AnimalShelter
{
    [Serializable]
    class Files
    {
        public Files()
        {

        }

        public void Save(List<Animal> animals)
        {
            FileStream file = null;
            try
            {
                file = new FileStream("Animals.bin", FileMode.Create, FileAccess.Write);
                BinaryFormatter formatter = new BinaryFormatter();
                formatter.Serialize(file, animals);
                MessageBox.Show("Animals are saved");
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

        public List<Animal> Load()
        {
            FileStream file = null;
            BinaryFormatter formatter;
            List<Animal> animals = null;
            try
            {
                if (new FileInfo("Animals.bin").Length == 0)
                {
                    throw new MyException("Het bestand is leeg.");
                }
                file = new FileStream("Animals.bin", FileMode.Open, FileAccess.Read);
                formatter = new BinaryFormatter();
                animals = (List<Animal>)formatter.Deserialize(file);
            }
            catch (IOException exc)
            {
                MessageBox.Show(exc.Message);
            }
            catch (SerializationException exc)
            {
                MessageBox.Show(exc.Message);
            }
            catch (MyException exc)
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
            return animals;
        }
    }
}
