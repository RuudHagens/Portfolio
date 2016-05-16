using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Drawing;

namespace Game_Project
{
    public class Board
    {
        public int movesMade = 0;
        public int Owins = 0;
        public int Xwins = 0;
        private Holder[,] holders = new Holder[3, 3];

        public const int X = 0;
        public const int O = 1;
        public const int B = 2;

        public int playersTurn = X;
        public int tie = 0;

        public int getPlayerForTurn()
        {
            return playersTurn;
        }

        public int getOWins()
        {
            return Owins;
        }

        public int getXWins()
        {
            return Xwins;
        }

        public int Oreset()
        {
            return Owins = 0;
        }

        public int Xreset()
        {
            return Xwins = 0;
        }

        public void initialiseBoard()
        {
            for (int x = 0; x < 3; x++)
            {
                for (int y = 0; y < 3; y++)
                {
                    holders[x, y] = new Holder();
                    holders[x, y].setValue(B);
                    holders[x, y].setLocation(new Point(x, y));
                }
            }
        }

        public void detectHit(Point loc)
        {
            // Checks if the board is clicked
            if (loc.Y <= 500)
            {
                int x = 0;
                int y = 0;

                if (loc.X < 167)
                {
                    x = 0;
                }
                else if (loc.X > 167 && loc.X < 334)
                {
                    x = 1;
                }
                else if (loc.X > 334)
                {
                    x = 2;
                }
                if (loc.Y < 167)
                {
                    y = 0;
                }
                else if (loc.Y > 167 && loc.Y < 334)
                {
                    y = 1;
                }
                else if (loc.Y > 334 && loc.Y < 500)
                {
                    y = 2;
                }
                if (movesMade % 2 == 0)
                {
                        graphics.drawX(new Point(x, y));
                        tie = tie + 1;
                        holders[x, y].setValue(X);
                        if (detectRow())
                        {
                            MessageBox.Show("You have won, X");
                            Xwins++;
                            reset();
                            graphics.setUpCanvas();
                        }
                        if (tie == 9)
                        {
                            MessageBox.Show("It's a tie game");
                            reset();
                            graphics.setUpCanvas();
                        }
                        playersTurn = O;
                }
                else
                {
                        graphics.drawO(new Point(x, y));
                        tie = tie + 1;
                        holders[x, y].setValue(O);
                        if (detectRow())
                        {
                            MessageBox.Show("You have won, O");
                            Owins++;
                            reset();
                            graphics.setUpCanvas();
                        }
                        if (tie == 9)
                        {
                            MessageBox.Show("It's a tie game");
                            reset();
                            graphics.setUpCanvas();
                        }

                    playersTurn = X;
                }

                movesMade++;
            }
        }

        public bool detectRow()
        {
            bool isWon = false;

            for (int x = 0; x < 3; x++)
            {
                //X vertical
                if (holders[x, 0].getValue() == X && holders[x, 1].getValue() == X && holders[x, 2].getValue() == X)
                {
                    return true;
                }
                //O vertical
                if (holders[x, 0].getValue() == O && holders[x, 1].getValue() == O && holders[x, 2].getValue() == O)
                {
                    return true;
                }

                switch (x)
                {
                    case 0:
                        //X diagonal
                        if (holders[x, 0].getValue() == X && holders[x + 1, 1].getValue() == X && holders[x + 2, 2].getValue() == X)
                        {
                            return true;
                        }
                        //O diagonal
                        if (holders[x, 0].getValue() == O && holders[x + 1, 1].getValue() == O && holders[x + 2, 2].getValue() == O)
                        {
                            return true;
                        }

                        break;

                    case 2:
                        //X horizontal
                        if (holders[x, 0].getValue() == X && holders[x - 1, 1].getValue() == X && holders[x - 2, 2].getValue() == X)
                        {
                            return true;
                        }
                        //O horizontal
                        if (holders[x, 0].getValue() == O && holders[x - 1, 1].getValue() == O && holders[x - 2, 2].getValue() == O)
                        {
                            return true;
                        }
                        break;
                }
            }

            for (int y = 0; y < 3; y++)
            {
                if (holders[0, y].getValue() == X && holders[1, y].getValue() == X && holders[2, y].getValue() == X)
                {
                    return true;
                }

                if (holders[0, y].getValue() == O && holders[1, y].getValue() == O && holders[2, y].getValue() == O)
                {
                    return true;
                }
            }
            return isWon;
        }

        public void reset()
        {
            holders = new Holder[3, 3];
            initialiseBoard();
            tie = 0;
        }
    }

    class Holder
    {
        private Point location;
        private int value = Board.B;

        public void setLocation(Point p)
        {
            location = p;
        }
        public Point getLocation()
        {
            return location;
        }

        public void setValue(int i)
        {
            value = i;
        }
        public int getValue()
        {
            return value;
        }
    }
}
