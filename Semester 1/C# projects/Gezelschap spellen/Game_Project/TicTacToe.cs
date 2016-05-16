using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Game_Project
{
    public partial class TicTacToe : Form
    {
        public graphics engine;
        public Board theBoard;

        public TicTacToe()
        {
            InitializeComponent();
        }


        private void panel1_Paint_1(object sender, PaintEventArgs e)
        {
            Graphics toPass = panel1.CreateGraphics();
            engine = new graphics(toPass);

            theBoard = new Board();
            theBoard.initialiseBoard();

            refreshLabel();
        }

        private void panel1_Click_1(object sender, EventArgs e)
        {
            Point mouse = Cursor.Position;
            mouse = panel1.PointToClient(mouse);
            theBoard.detectHit(mouse);
            refreshLabel();
        }

        private void btnRestart_Click_1(object sender, EventArgs e)
        {
            theBoard.reset();
            graphics.setUpCanvas();
            theBoard.Oreset();
            theBoard.Xreset();
            refreshLabel();
        }

        private void btnExit_Click_1(object sender, EventArgs e)
        {
            Form1 menu = new Form1();
            menu.Show();
            this.Close();
        }

        public void refreshLabel()
        {
            String newText = "It is ";
            if (theBoard.getPlayerForTurn() == Board.X)
            {
                newText += "X";
            }
            else
            {
                newText += "O";
            }

            newText += "'s Turn\n";
            newText += "X has won " + theBoard.getXWins() + " times.\nO has won " + theBoard.getOWins() + " times.";

            label1.Text = newText;
        }

        private void btnInstructions_Click(object sender, EventArgs e)
        {
            MessageBox.Show("This game is made for two players.\nThe objective is to get three sign of the same kind in a row.\nYou can choose by yourself which on you want to be.\nIf someone has won, you will get a message of who has one and the score counter will go up.\nIf ther's a tie game a message pops up and the game will reset.\nIf you want to reset the score then you can click the reste button.\nGood luck.");
        }
    }
}

