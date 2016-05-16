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
    public partial class Snake : Form
    {
        private List<Circle> s = new List<Circle>();
        private Circle food = new Circle();

        public Snake()
        {
            InitializeComponent();

            //Set settings to default
            new Settings();

            //Set game speed and start timer
            tmGame.Interval = 1000 / Settings.Speed;
            tmGame.Tick += UpdateScreen;
            tmGame.Start();

        }

        private void StartGame()
        {
            lblGameOver.Visible = false;

            //Set settings to default
            new Settings();

            //Create new player object
            s.Clear();
            Circle head = new Circle();
            head.X = 10;
            head.Y = 5;
            s.Add(head);


            lblScore.Text = Settings.Score.ToString();
            GenerateFood();

        }

        //Place random food object
        private void GenerateFood()
        {
            int maxXPos = pbCanvas.Size.Width / Settings.Width;
            int maxYPos = pbCanvas.Size.Height / Settings.Height;

            Random random = new Random();
            food = new Circle();
            food.X = random.Next(0, maxXPos);
            food.Y = random.Next(0, maxYPos);
        }


        private void UpdateScreen(object sender, EventArgs e)
        {
            //Check for Game Over
            if (Settings.GameOver == true)
            {
                btnStart.Enabled = true;
                btnInstructions.Enabled = true;
                btnExit.Enabled = true;
                radioButton1.Enabled = true;
                radioButton2.Enabled = true;
                radioButton3.Enabled = true;
                radioButton4.Enabled = true;
            }
            else
            {
                MovePlayer();
            }

            pbCanvas.Invalidate();

        }

        private void pbCanvas_Paint_1(object sender, PaintEventArgs e)
        {
            Graphics canvas = e.Graphics;

            if (!Settings.GameOver != false)
            {
                //Set colour of snake
                Brush snakeColour;

                //Draw snake
                for (int i = 0; i < s.Count; i++)
                {

                    if (i == 0)
                        snakeColour = Brushes.Black;     //Draw head
                    else
                        snakeColour = Brushes.DarkBlue;    //Rest of body

                    //Draw snake
                    canvas.FillEllipse(snakeColour,
                        new Rectangle(s[i].X * Settings.Width,
                                      s[i].Y * Settings.Height,
                                      Settings.Width, Settings.Height));


                    //Draw Food
                    canvas.FillEllipse(Brushes.Red,
                        new Rectangle(food.X * Settings.Width,
                             food.Y * Settings.Height, Settings.Width, Settings.Height));

                }
            }
            else
            {
                string gameOver = "Game over \nYour final score is: " + Settings.Score + "\nPress Start to try again";
                lblGameOver.Text = gameOver;
                lblGameOver.Visible = true;
            }
        }

        private void Die()
        {
            Settings.GameOver = true;
        }

        private void Eat()
        {
            Circle food = new Circle();
            food.X = s[s.Count - 1].X;
            food.Y = s[s.Count - 1].Y;

            s.Add(food);

            Settings.Score += Settings.Points;
            lblScore.Text = Settings.Score.ToString();

            GenerateFood();
        }

        private void MovePlayer()
        {
            for (int i = s.Count - 1; i >= 0; i--)
            {
                //Move head
                if (i == 0)
                {
                    switch (Settings.direction)
                    {
                        case Direction.Right:
                            s[i].X++;
                            break;
                        case Direction.Left:
                            s[i].X--;
                            break;
                        case Direction.Up:
                            s[i].Y--;
                            break;
                        case Direction.Down:
                            s[i].Y++;
                            break;
                    }

                    int MaxXpos = pbCanvas.Size.Width / Settings.Width;
                    int MaxYpos = pbCanvas.Size.Height / Settings.Height;

                    if (s[i].X < 0 || s[i].Y < 0 || s[i].X >= MaxXpos || s[i].Y >= MaxYpos)
                    {
                        Die();
                    }

                    for (int j = 1; j < s.Count; j++)
                    {
                        if (s[i].X == s[j].X && s[i].Y == s[j].Y)
                        {
                            Die();
                        }
                    }

                    if (s[0].X == food.X && s[0].Y == food.Y)
                    {
                        Eat();
                    }
                }

                else
                {
                    //Move body
                    s[i].X = s[i - 1].X;
                    s[i].Y = s[i - 1].Y;
                }
            }
        }

        private void Snake_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Right && Settings.direction != Direction.Left)
            {
                Settings.direction = Direction.Right;
            }

            if (e.KeyCode == Keys.Left && Settings.direction != Direction.Right)
            {
                Settings.direction = Direction.Left;
            }

            if (e.KeyCode == Keys.Down && Settings.direction != Direction.Up)
            {
                Settings.direction = Direction.Down;
            }

            if (e.KeyCode == Keys.Up && Settings.direction != Direction.Down)
            {
                Settings.direction = Direction.Up;
            }
        }

        private void radioButton1_CheckedChanged_1(object sender, EventArgs e)
        {
            Settings.Speed = 5;
            Settings.Points = 25;
            tmGame.Interval = 1000 / Settings.Speed;
        }

        private void radioButton2_CheckedChanged_1(object sender, EventArgs e)
        {
            Settings.Speed = 10;
            Settings.Points = 50;
            tmGame.Interval = 1000 / Settings.Speed;
        }

        private void radioButton3_CheckedChanged_1(object sender, EventArgs e)
        {
            Settings.Speed = 15;
            Settings.Points = 75;
            tmGame.Interval = 1000 / Settings.Speed;
        }

        private void radioButton4_CheckedChanged_1(object sender, EventArgs e)
        {
            Settings.Speed = 20;
            Settings.Points = 100;
            tmGame.Interval = 1000 / Settings.Speed;
        }

        private void btnStart_Click_1(object sender, EventArgs e)
        {
            StartGame();
            btnStart.Enabled = false;
            btnExit.Enabled = false;
            btnInstructions.Enabled = false;
            radioButton1.Enabled = false;
            radioButton2.Enabled = false;
            radioButton3.Enabled = false;
            radioButton4.Enabled = false;
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Form1 menu = new Form1();
            menu.Show();
            this.Close();
        }

        private void btnInstructions_Click(object sender, EventArgs e)
        {
            MessageBox.Show("This game is all about getting your snake as long as possible without dying.\nIf you hit the border, you die!\nIf you hit your body, you die!\nyou can collect point and length by eating the red dot.\nYou can control the snake with the arrows on your key board.\nGood luck.");
        }
    }
}

