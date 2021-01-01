/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package brickbreaker;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics2D;

/**
 *
 * @author Chit's
 */
public class bricks {

    public int bheight;
    public int bwidth;

    int[][] blocks;

    public bricks(int row, int col) {
        blocks = new int[row][col];
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                blocks[i][j] = 1;
            }
        }

        bheight = 140 / col;
        bwidth = 500 / row;
    }

    public void draw(Graphics2D g) {

        for (int i = 0; i < blocks.length; i++) {

            for (int j = 0; j < blocks[0].length; j++) {
//          float a=(float)Math.random();
//                float b=(float) Math.random();
//                 float c=(float) Math.random();
                if (blocks[i][j] == 1) {

                    g.setColor(Color.red);
                    // g.setColor(Color.getHSBColor(a,b,c));
                    g.fillRect(j * bwidth + 80, i * bheight + 50, 100, 30);
                    g.setStroke(new BasicStroke(3));
                    g.setColor(Color.white);
                    g.drawRect(j * bwidth + 80, i * bheight + 50, 100, 30);
                }

            }

        }
    }

    public void setBlockValue(int row, int col) {
        blocks[row][col] = 0;
    }

}
