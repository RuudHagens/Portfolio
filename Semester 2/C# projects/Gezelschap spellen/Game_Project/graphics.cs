﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.Windows.Forms;

namespace Game_Project
{
    public class graphics
    {
        private static Graphics gObject;

        public graphics(Graphics g)
        {
            gObject = g;
            setUpCanvas();
        }

        public static void setUpCanvas()
        {
            Brush background = new SolidBrush(Color.White);
            Pen lines = new Pen(Color.Black, 5);

            gObject.FillRectangle(background, new Rectangle(0, 0, 500, 600));

            gObject.DrawLine(lines, new Point(167, 0), new Point(167, 500));
            gObject.DrawLine(lines, new Point(334, 0), new Point(334, 500));
            gObject.DrawLine(lines, new Point(0, 167), new Point(500, 167));
            gObject.DrawLine(lines, new Point(0, 334), new Point(500, 334));
            gObject.DrawLine(lines, new Point(0, 500), new Point(500, 500));
        }

        public static void drawX(Point loc)
        {
            Pen xPen = new Pen(Color.Red, 5);
            int xAbs = loc.X * 167;
            int yAbs = loc.Y * 167;

            gObject.DrawLine(xPen, xAbs + 10, yAbs + 10, xAbs + 157, yAbs + 157);
            gObject.DrawLine(xPen, xAbs + 157, yAbs + 10, xAbs + 10, yAbs + 157);
        }

        public static void drawO(Point loc)
        {
            Pen oPen = new Pen(Color.Blue, 5);
            int xAbs = loc.X * 167;
            int yAbs = loc.Y * 167;

            gObject.DrawEllipse(oPen, xAbs + 10, yAbs + 10, 147, 147);
        }
    }
}