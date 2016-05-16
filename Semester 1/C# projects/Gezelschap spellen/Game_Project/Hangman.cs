using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;

namespace Game_Project
{
    public partial class Hangman : Form
    {
        public Hangman()
        {
            InitializeComponent();
        }

        string word = "";
        List<Label> labels = new List<Label>();
        int amount = 0;

        enum Bodyparts
        {
            Head,
            Left_eye,
            Right_eye,
            Mouth,
            Body,
            Left_arm,
            Right_arm,
            Left_leg,
            Right_leg
        }

        void DrawGallow()
        {
            Graphics g = pnGallow.CreateGraphics();
            Pen p = new Pen(Color.Black, 5);
            g.DrawLine(p, new Point(130, 213), new Point(5, 213));
            g.DrawLine(p, new Point(5, 216), new Point(5, 5));
            g.DrawLine(p, new Point(5, 7), new Point(75, 7));
            g.DrawLine(p, new Point(75, 5), new Point(75, 40));
            MakeLabels();
        }

        void DrawBodyParts(Bodyparts bp)
        {
            Graphics g = pnGallow.CreateGraphics();
            Pen p = new Pen(Color.Black, 2);
            if (bp == Bodyparts.Head)
                g.DrawEllipse(p, 50, 40, 50, 50);

            else if (bp == Bodyparts.Left_eye)
            {
                SolidBrush s = new SolidBrush(Color.Black);
                g.FillEllipse(s, 61, 55, 5, 5);
            }
            else if (bp == Bodyparts.Right_eye)
            {
                SolidBrush s = new SolidBrush(Color.Black);
                g.FillEllipse(s, 82, 55, 5, 5);
            }
            else if (bp == Bodyparts.Mouth)
            {
                g.DrawArc(p, 61, 55, 25, 25, 20, 140);
            }
            else if (bp == Bodyparts.Body)
            {
                g.DrawLine(p, new Point(75, 90), new Point(75, 160));
            }
            else if (bp == Bodyparts.Left_arm)
            {
                g.DrawLine(p, new Point(75, 95), new Point(55, 130));
            }
            else if (bp == Bodyparts.Right_arm)
            {
                g.DrawLine(p, new Point(75, 95), new Point(95, 130));
            }
            else if (bp == Bodyparts.Left_leg)
            {
                g.DrawLine(p, new Point(75, 159), new Point(55, 195));
            }
            else if (bp == Bodyparts.Right_leg)
            {
                g.DrawLine(p, new Point(75, 159), new Point(95, 195));
            }
        }

        void MakeLabels()
        {
            word = GetRandomWord();
            char[] chars = word.ToCharArray();
            int between = 330 / chars.Length -1;
            for (int i = 0; i <= chars.Length - 1; i++)
            {
                labels.Add(new Label());
                labels[i].Location = new Point((i * between) + 10, 80);
                labels[i].Text = "_";
                labels[i].Parent = gbWord;
                labels[i].BringToFront();
                labels[i].CreateControl();
            }
            lblLength.Text = "Word length: " + (chars.Length).ToString();
        }

        string GetRandomWord()
        {
            WebClient wc = new WebClient();
            string wordlist = wc.DownloadString("https://raw.githubusercontent.com/Tom25/Hangman/master/wordlist.txt");
            string[] words = wordlist.Split('\n');
            Random Randomizer = new Random();
            return words[Randomizer.Next(0, words.Length -1)];
        }

        private void Hangman_Shown_1(object sender, EventArgs e)
        {
            DrawGallow();
        }

        private void btnLetter_Click_1(object sender, EventArgs e)
        {
            char letter = tbLetter.Text.ToLower().ToCharArray()[0];
            if (!char.IsLetter(letter))
            {
                MessageBox.Show("You will have to type a letter");
                return;
            }
            if (word.Contains(letter))
            {
                char[] letters = word.ToCharArray();
                for (int i = 0; i < letters.Length; i++)
                {
                    if (letters[i] == letter)
                        labels[i].Text = letter.ToString();
                }
                foreach (Label l in labels)
                    if (l.Text == "_") return;
                MessageBox.Show("You've won!", "Congratz");
                ResetGame();
            }

            else
            {
                MessageBox.Show("The word does not contain the letter: " + letter, "Sorry");
                lblMiss.Text += " " + letter.ToString() + ",";
                DrawBodyParts((Bodyparts)amount);
                amount++;
                if (amount == 9)
                {
                    MessageBox.Show("You lost", "Sorry");
                    MessageBox.Show("The word was: " + word);
                    ResetGame();
                }
            }

        }

        void ResetGame()
        {
            Graphics g = pnGallow.CreateGraphics();
            g.Clear(pnGallow.BackColor);
            amount = 0;
            GetRandomWord();
            MakeLabels();
            DrawGallow();
            lblMiss.Text = "Miss:";
            tbLetter.Text = "";
            tbWord.Text = "";
        }

        private void btnWoord_Click_1(object sender, EventArgs e)
        {
            word = word.Remove(word.Length - 1, 1);
            if (tbWord.Text == word)
            {
                MessageBox.Show("You've won!", "Congratz");
                ResetGame();
            }
            else
            {
                MessageBox.Show("The word isn't: " + tbWord.Text);
                DrawBodyParts((Bodyparts)amount);
                amount++;
                if (amount == 9)
                {
                    MessageBox.Show("You lost", "Sorry");
                    MessageBox.Show("The word was: " + word);
                    ResetGame();
                }
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Form1 menu = new Form1();
            menu.Show();
            this.Close();
        }

        private void btnInstruction_Click(object sender, EventArgs e)
        {
            MessageBox.Show("This game is all about guessing the right words.\nYou can either guess the word by picking a letter one at the time,\nor you can try to guess the whole word by typing it in the second textbox.\nAll these words are written in english.\nYou have to guess the word before your player hangs down from the gallow.\nGood luck.");
        }
    }
}
