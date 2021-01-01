package brickbreaker;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import javax.swing.JPanel;
import javax.swing.Timer;

public class gameplay extends JPanel implements KeyListener, ActionListener {

    public boolean play = false;
    public int sliderX = 200, sliderY = 600;  //slider
    private int ballx = 300 + (int) (Math.random() * 100), bally = 300 + (int) (Math.random() * 100), ballxdir = -3, ballydir = -3;
    private Timer timer;
    private int delay = 1;
    private bricks bricks;
    private int score = 0;
    private int level = 1;

    public gameplay() {
        bricks = new bricks(5, 5);
        System.out.println("in a gameplay");
        setFocusable(true);
        setFocusTraversalKeysEnabled(false);
        timer = new Timer(delay, this);

        timer.start();

        addKeyListener(this);
        System.out.println("key listener added");
    }

    @Override
    public void paint(Graphics g) {

        g.setColor(Color.ORANGE);
        System.out.println("color set");
        g.fillRect(0, 0, 700, 700);//setting background

        // draw bricks
        // drawing bricks
        g.setColor(Color.blue);
        g.fillRect(sliderX, sliderY, 100, 10);  //making slider

        g.setColor(Color.red);
        g.fillOval(ballx, bally, 30, 30); // making ball

        //display score
        g.setColor(Color.BLACK);
        g.setFont(new Font("serif", Font.ITALIC, 30));
        g.drawString("SCORE-" + score, 500, 30);

        //displauing level
        g.setColor(Color.black);
        g.setFont(new Font("serif", Font.ITALIC, 30));
        g.drawString("LEVEL-" + level, 30, 30);

        if (level == 2) {
            g.setColor(Color.BLUE);
            System.out.println("color set");
            g.fillRect(0, 0, 700, 700);

            g.setColor(Color.green);
            g.fillOval(ballx, bally, 30, 30);

            g.setColor(Color.cyan);
            g.fillRect(sliderX, sliderY, 100, 10);

            g.setColor(Color.BLACK);
            g.setFont(new Font("serif", Font.ITALIC, 30));
            g.drawString("SCORE-" + score, 500, 30);

            //displauing level
            g.setColor(Color.black);
            g.setFont(new Font("serif", Font.ITALIC, 30));
            g.drawString("LEVEL-" + level, 30, 30);
        }

        bricks.draw((Graphics2D) g);

        //game  over
        if (bally > 640) {
            play = false;
            g.setColor(Color.red);
            g.setFont(new Font("serif", Font.BOLD, 30));
            g.drawString("OOPS...GAME OVER", 50, 350);
            g.setFont(new Font("serif", Font.BOLD, 40));
            g.drawString("press ENTER to RESTART", 50, 450);
        }
        if (level == 1 && score == 125) {
            play = false;
            g.setColor(Color.red);
            g.setFont(new Font("serif", Font.BOLD, 30));
            g.drawString("Conratulations", 50, 350);
            g.setFont(new Font("serif", Font.BOLD, 40));
            g.drawString("press N to proceed", 50, 450);
        }

        if (level == 2 && score == 150) {
            play = false;
            g.setColor(Color.white);
            g.setFont(new Font("serif", Font.BOLD, 30));
            g.drawString("Conratulations..YoU WoN", 50, 350);
            g.setFont(new Font("serif", Font.BOLD, 40));
            g.drawString("press N to proceed", 50, 450);

        }

    }

    @Override
    public void keyTyped(KeyEvent e) {
    }

    @Override
    public void keyPressed(KeyEvent e) {
        System.out.println("in a key event");
        if (e.getKeyCode() == KeyEvent.VK_LEFT) {
            if (sliderX <= 0) {
                sliderX = 0;
            } else {
                moveleft();
            }
        }
        if (e.getKeyCode() == KeyEvent.VK_RIGHT) {
            if (sliderX >= 580) //becoz of slider co ord
            {
                sliderX = 580;
            } else {
                moveright();
            }

        }

        //after game over press enter
        if (e.getKeyCode() == KeyEvent.VK_ENTER) {
            if (play == false) {
                sliderX = 200;
                sliderY = 600;  //slider
                ballx = 300 + (int) (Math.random() * 100);
                bally = 300 + (int) (Math.random() * 100);

                score = 0;
                bricks = new bricks(5, 5);
                level = 1;
                repaint();

            }
        }

        //next level press N
        if (e.getKeyCode() == KeyEvent.VK_N) {
            if (level == 1 && score == 125) {
                level++;
                sliderX = 200;
                sliderY = 600;  //slider
                ballx = 300;
                bally = 300;
                ballxdir = -4;
                ballydir = -4;

                score = 0;
                bricks = new bricks(6, 5);
            }
            if (level == 2 && score == 150) {
                level = 1;
                sliderX = 200;
                sliderY = 600;  //slider
                ballx = 300;
                bally = 300;
                ballxdir = -3;
                ballydir = -3;

                score = 0;
                bricks = new bricks(5, 5);

            }
        }

    }

    public void keyReleased(KeyEvent e) {

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        System.out.println("in a action performed");
        timer.start();

        if (play) {
            if (new Rectangle(ballx, bally, 30, 30).intersects(new Rectangle(sliderX, sliderY, 100, 7))) //for intersecting ball with tray
            {
                ballydir = -ballydir;
            }

            for (int i = 0; i < bricks.blocks.length; i++) {
                for (int j = 0; j < bricks.blocks[0].length; j++) {
                    if (bricks.blocks[i][j] == 1) {
                        int bricksx = j * bricks.bwidth + 80;
                        int bricksy = i * bricks.bheight + 50;
                        int bwidth = bricks.bwidth;
                        int bheight = bricks.bheight;

                        Rectangle rect = new Rectangle(bricksx, bricksy, bwidth, bheight);
                        Rectangle ball = new Rectangle(ballx, bally, 30, 30);

                        if (ball.intersects(rect)) {
                            bricks.setBlockValue(i, j);
                            score += 5;
                            ballydir = -ballydir;

                            ballxdir = +ballxdir;

                        }
                    }
                }
            }

            System.out.println("ball");
            ballx = ballx + ballxdir;
            bally += ballydir;
            if (ballx < 0) {
                ballxdir = -ballxdir;
            }

            if (bally < 0) {
                ballydir = -ballydir;
            }

            if (ballx > 690) {
                ballxdir = -ballxdir;
            }

            if (bally > 640) {
                play = false;

                // ballydir=-ballydir;
            }

        }
        System.out.println("player");
        if (sliderX <= 0) {

            sliderX = 10;

        } else if (sliderX >= 700) {
            sliderX = 690;

        }

        repaint();//to call paint method again 
    }

    private void moveleft() {
        play = true;
        sliderX -= 30;

    }

    private void moveright() {
        play = true;
        sliderX += 30;
    }

}
