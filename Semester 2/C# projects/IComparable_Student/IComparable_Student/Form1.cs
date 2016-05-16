using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IComparable_Student
{
    public partial class Form1 : Form
    {
        List<Student> students; 
        Student student;

        public Form1()
        {
            InitializeComponent();
            students = new List<Student>()
            {
                  new Student("Piet", "laan1", 4),
                  new Student("Jan", "laan2", 8),
                  new Student("Henk", "laan3", 3),
                  new Student("Ronald", "laan4", 12),
                  new Student("Koen", "laan5", 2)
            };
            FillListBox();
        }

        private void btnAddStudent_Click(object sender, EventArgs e)
        {
            student = new Student(txtName.Text, txtAddress.Text, Convert.ToInt32(txtNumber.Text));
            lbxStudents.Items.Add(student);
            students.Add(student);
        }

        public void FillListBox()
        {
            foreach(Student s in students)
            {
                lbxStudents.Items.Add(s);
            }
        }

        private void btnSort_Click(object sender, EventArgs e)
        {
            Student_SortByNumber studentSort = new Student_SortByNumber();
            students.Sort(studentSort);

            lbxStudents.Items.Clear();
            FillListBox();
        }
    }
}
