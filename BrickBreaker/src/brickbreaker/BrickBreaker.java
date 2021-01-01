/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package brickbreaker;

import javax.swing.*;

/**
 *
 * @author Chit's
 */
public class BrickBreaker {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //to create frame

        JFrame obj = new JFrame();
        System.out.println("frame created");
        gameplay game = new gameplay();
        obj.setVisible(true);
        obj.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        obj.setBounds(0, 0, 700, 700);//to set size   obj.setBounds(pix_x_position, pix_y_position, width, height);
        obj.add(game);

    }

}
