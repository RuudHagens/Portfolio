using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Paint_1(object sender, PaintEventArgs e)
        {
            Graphics graphics = e.Graphics;

            graphics = this.CreateGraphics();
            graphics.DrawEllipse(Pens.Blue, 0, 0, 75, 75);
            graphics.DrawEllipse(Pens.Red,ClientRectangle.Width-76, 0, 75, 75);
            graphics.DrawLine(Pens.Black, new Point(0, 0), new Point(ClientRectangle.Width,ClientRectangle.Height));
            graphics.DrawLine(Pens.Black, new Point(0, 260), new Point(ClientRectangle.Width,ClientRectangle.Height-262));
            graphics.DrawEllipse(Pens.Green, ClientRectangle.Width-76, 185, 75, 75);
            graphics.DrawEllipse(Pens.Purple, 0, 185, 75, 75);
            graphics.DrawEllipse(Pens.Black, ClientRectangle.Width-180, 93, 75, 75);
        }
    }
}
