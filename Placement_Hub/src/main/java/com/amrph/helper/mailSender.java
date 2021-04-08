/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.helper;

import java.io.File;
import java.util.Properties;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

public class mailSender {

    static HttpServletRequest request;

    public static boolean sendMail(final String username,final String password, String toEmail, String subject, String jobDesc) {
        boolean check = false;
        //authentication info
        //  final String username = "dixit77ujjwal@gmail.com";
        //final String password = "***********";
        String fromEmail = username;
        //String toEmail = "chitransha1997dixit@gmail.com ,dixitujjwal772000@gmail.com";

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        String str[] = toEmail.split(",");
        for (int i = 0; i < str.length; i++) {
            System.out.println(str[i]);
            check = send(session, fromEmail, str[i], subject, jobDesc);

        }
        //send();
        return check;
        //Start our mail message
    }

    public boolean sendMailWithFile(final String username, final String password, String toEmail, String subject, String jobDesc, String path) {
        boolean check = false;
        //authentication info
        //  final String username = "dixit77ujjwal@gmail.com";
        //final String password = "***********";
        String fromEmail = username;
        //String toEmail = "chitransha1997dixit@gmail.com ,dixitujjwal772000@gmail.com";

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        String str[] = toEmail.split(",");
        for (int i = 0; i < str.length; i++) {
            System.out.println(str[i]);
            check = sendWithFile(session, fromEmail, str[i], subject, jobDesc, path);

        }
        //send();
        return check;
        //Start our mail message
    }

     private static boolean send(Session session, String fromEmail, String toEmail, String subject, String jobDesc) {
        boolean check = false;
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.setFrom(new InternetAddress(fromEmail));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject(subject);

            Multipart emailContent = new MimeMultipart();

            //Text body part
            MimeBodyPart textBodyPart = new MimeBodyPart();
            textBodyPart.setText(jobDesc);

            //Attachment body part.
//           
            //MimeBodyPart pdfAttachment = new MimeBodyPart();
            //pdfAttachment.attachFile(path);
            //Attach body parts
            emailContent.addBodyPart(textBodyPart);
            //emailContent.addBodyPart(pdfAttachment);

            //Attach multipart to message
            msg.setContent(emailContent);

            Transport.send(msg);
            check = true;
            System.out.println("Sent message");

        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return check;
    }

    
    private static boolean sendWithFile(Session session, String fromEmail, String toEmail, String subject, String jobDesc, String path) {
        boolean check = false;
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.setFrom(new InternetAddress(fromEmail));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject(subject);

            Multipart emailContent = new MimeMultipart();

            //Text body part
            MimeBodyPart textBodyPart = new MimeBodyPart();
            textBodyPart.setText(jobDesc);

            //Attachment body part.
//           
            MimeBodyPart pdfAttachment = new MimeBodyPart();
            pdfAttachment.attachFile(path);
            //Attach body parts
            emailContent.addBodyPart(textBodyPart);
            emailContent.addBodyPart(pdfAttachment);

            //Attach multipart to message
            msg.setContent(emailContent);

            Transport.send(msg);
            check = true;
            System.out.println("Sent message");

        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return check;
    }

    public void sendOtp(int otp, String toEmail) {
        //authentication info
        final String username = "dixit77ujjwal@gmail.com";
        final String password = "jaibajrangbali";
        String fromEmail = username;
        // String toEmail = "dixitujjwal772000@gmail.com"+",";

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        String str[] = toEmail.split(",");
        for (int i = 0; i < str.length; i++) {
            System.out.println(str[i]);
            send(session, fromEmail, str[i], "OTP to change password", 
                    new StringBuilder()
                        .append("Dear user,\n")
                        .append("your otp for changing Password is:-.")
                        .append(""+otp+"\n")                        
                        .append("Thanks and Regards.\n")
                        .append("Admin")
                        .toString());
        }
//       send();
    
        //Start our mail message
    }

}
