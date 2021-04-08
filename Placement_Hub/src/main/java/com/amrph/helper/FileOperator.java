/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author ASUS
 */
public class FileOperator {

    public static boolean savefile(InputStream is, String path) {
        boolean b = false;
        try {
            byte by[] = new byte[is.available()];
            is.read(by);

            FileOutputStream fos = new FileOutputStream(path);
            fos.write(by);

            fos.flush();

            b = true;

        } catch (Exception e) {
            e.getMessage();
        }
        return b;

    }

    public static boolean delete(String path) {
        boolean b = false;
        try {
            File file = new File(path);
            b = file.delete();
        } catch (Exception e) {
            e.getMessage();
        }

        return b;
    }

}
