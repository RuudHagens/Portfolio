using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Student_Comparor
{
    public partial class Form1 : Form
    {
        private List<Student> students;
        public Form1()
        {
            InitializeComponent();
            students = new List<Student>()
            {
                  new Student("Bilbo", "Hobbitton 12", "242324"),
                  new Student("Harold", "Peteruslaan 5", "458"),
                  new Student("Kees", "Peteruslaan 3", "8963"),
                  new Student("Dave", "Worltelstraat 120", "12"),
                  new Student("Jake", "Kaassteeg 7", "2098")
            };
            lbStudent.Items.AddRange(students.ToArray());
        }

        private void btnToevoegen_Click(object sender, EventArgs e)
        {
            if (tbNummer.Text == "")
            {
                MessageBox.Show("Je moet wel een nummer invullen");
            }
            if (tbNaam.Text == "")
            {
                MessageBox.Show("Je moet wel een naam invullen");
            }
            if (tbAddres.Text == "")
            {
                MessageBox.Show("Je moet wel een addres invullen");
            }
            else
            {
                lbStudent.Items.Clear();
                Student s = new Student(tbNaam.Text, tbAddres.Text, tbNummer.Text);
                s.ToString();
                students.Add(s);
                lbStudent.Items.AddRange(students.ToArray());

            }
        }

        private void tbNummer_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
        }

        private void btnNummer_Click(object sender, EventArgs e)
        {
            NumberCompare NC = new NumberCompare();
            students.Sort(NC);
            lbStudent.Items.Clear();
            lbStudent.Items.AddRange(students.ToArray());
        }

        private void btnNaam_Click(object sender, EventArgs e)
        {
            students.Sort();
            lbStudent.Items.Clear();
            lbStudent.Items.AddRange(students.ToArray());
        }

        private void btnAddres_Click(object sender, EventArgs e)
        {
            AddresCompare AC = new AddresCompare();
            students.Sort(AC);
            lbStudent.Items.Clear();
            lbStudent.Items.AddRange(students.ToArray());
        }
    }
}
