using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace AnimalShelter
{
    public partial class AdministrationForm : Form
    {
        /// <summary>
        /// The (only) animal in this administration (for now....)
        /// </summary>
        Administration administration = new Administration();

        /// <summary>
        /// Creates the form for doing adminstrative tasks
        /// </summary>
        public AdministrationForm()
        {
            InitializeComponent();
            
            foreach (Animal.Gender gender in Enum.GetValues(typeof(Animal.Gender)))
            {
                cbGender.Items.Add(gender);
            }
            cbAnimalType.SelectedIndex = 0;
            administration.Add(new Dog("91854", new SimpleDate(11, 09, 2001), "Billy", new SimpleDate(15, 09, 2014), Animal.Gender.male));
            administration.Add(new Dog("4200", new SimpleDate(03, 08, 1996), "Brian", new SimpleDate(27, 09, 2014), Animal.Gender.male));
            administration.Add(new Cat("666", new SimpleDate(06, 06, 2006), "Mittens", "Spawn of satan", Animal.Gender.male));
            administration.Add(new Cat("1", new SimpleDate(13, 02, 1996), "Harry", "thinks to much about the purrpose of life", Animal.Gender.male));
            UpdateListBoxes();
        }
        public void UpdateListBoxes()
        {
            foreach (Animal a in administration.Animals)
            {
                if (a.IsReserved)
                {
                    lbReserved.Items.Add(a);
                }
                else
                {
                    lbAvailable.Items.Add(a);
                }
            }
        }

        /// <summary>
        /// Create an Animal object and store it in the administration.
        /// If "Dog" is selected in the animalTypeCombobox then a Dog object should be created.
        /// If "Cat" is selected in the animalTypeCombobox then a Cat object should be created.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCreate_Click(object sender, EventArgs e)
        {
            // TODO: See method description

            if (cbAnimalType.GetItemText(cbAnimalType.SelectedItem) == "dog")
            {
                Dog d = new Dog(tbChipRegitrationNumber.Text, new SimpleDate(dtpDateOfBirth.Value.Day, dtpDateOfBirth.Value.Month, dtpDateOfBirth.Value.Year), tbName.Text, new SimpleDate(dtpLastWalkDate.Value.Day, dtpLastWalkDate.Value.Month, dtpLastWalkDate.Value.Year), (Animal.Gender)cbGender.SelectedItem);
                if (cbReserved.Checked)
                {
                    d.isReserved = true;
                }
                if (administration.Add(d))
                {
                    if (d.isReserved)
                    {
                        lbReserved.Items.Add(d);
                    }
                    else
                    {
                        lbAvailable.Items.Add(d);
                    }
                }
                else
                {
                    MessageBox.Show("Voer een ongebruikt chipnummer in");
                }
            }
            else
            {
                Cat c = new Cat(tbChipRegitrationNumber.Text, new SimpleDate(dtpDateOfBirth.Value.Day, dtpDateOfBirth.Value.Month, dtpDateOfBirth.Value.Year), tbName.Text, tbBadHabits.Text, (Animal.Gender)cbGender.SelectedItem);
                if (cbReserved.Checked)
                {
                    c.isReserved = true;
                }
                if (administration.Add(c))
                {
                    if (c.isReserved)
                    {
                        lbReserved.Items.Add(c);
                    }
                    else
                    {
                        lbAvailable.Items.Add(c);
                    }
                }
                else
                {
                    MessageBox.Show("Voer een ongebruikt chipnummer in");
                }
            }
        }
        /// <summary>
        /// Show the info of the animal referenced by the 'animal' field. 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (lbAvailable.SelectedItem != null)
            {
                Animal a = (Animal)lbAvailable.SelectedItem;
                if (administration.RemoveAnimal(a.chipRegistrationNumber))
                {
                    lbAvailable.Items.Remove(a);
                }
            }
            else if (lbReserved.SelectedItem != null)
            {
                Animal a = (Animal)lbReserved.SelectedItem;
                if (administration.RemoveAnimal(a.chipRegistrationNumber))
                {
                    lbReserved.Items.Remove(a);
                }
            }
        }

        private void btnSwitch_Click(object sender, EventArgs e)
        {
            if (lbAvailable.SelectedItem != null)
            {
                Animal a = (Animal)lbAvailable.SelectedItem;
                a.isReserved = true;
                lbAvailable.Items.Remove(a);
                lbReserved.Items.Add(a);
                MessageBox.Show(a.chipRegistrationNumber + " " + a.name + " is reserved");
            }
            else if (lbReserved.SelectedItem != null)
            {
                Animal a = (Animal)lbReserved.SelectedItem;
                a.isReserved = false;
                lbReserved.Items.Remove(a);
                lbAvailable.Items.Add(a);
                MessageBox.Show(a.chipRegistrationNumber + " " + a.name + "is available");
            }
        }

        private void btnForEach_Click(object sender, EventArgs e)
        {
            lbAvailable.Items.Clear();
            lbReserved.Items.Clear();
            foreach (Animal animal in administration.Animals)
            {
                if (animal is Dog)
                {
                    Dog d = animal as Dog;
                    lbAvailable.Items.Add(d.Name + " - " + d.LastWalkDate);
                }
                else if (animal is Cat)
                {
                    Cat c = animal as Cat;
                    lbReserved.Items.Add(c.Name + " - " + c.BadHabits);
                }
            }
        }

        private void btnSort_Click(object sender, EventArgs e)
        {
            administration.Animals.Sort();
            lbAvailable.Items.Clear();
            lbReserved.Items.Clear();
            UpdateListBoxes();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            Files f = new Files();
            f.Save(administration.Animals);
        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            Files f = new Files();
            lbAvailable.Items.Clear();
            lbReserved.Items.Clear();
            if (f.Load() != null)
            {
                foreach (Animal a in f.Load())
                {
                    if (a.IsReserved)
                    {
                        lbReserved.Items.Add(a);
                    }
                    else
                    {
                        lbAvailable.Items.Add(a);
                    }
                }
            }
        }
    }
}
