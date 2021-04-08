/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.servlet;

import com.amrph.helper.FileOperator;
import com.amrph.helper.mailSender;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class mailServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet mailServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet mailServ at " + request.getContextPath() + "</h1>");
            String username = request.getParameter("adminEmailId");
            String password = request.getParameter("adminEmailPassword");
            String jobDesc = request.getParameter("jobDesc");
            String StudentEmail = request.getParameter("emailId");//email of students
            String subject = request.getParameter("subject");

            Part part = request.getPart("pdfFile");
            String pdfFileName = part.getSubmittedFileName();
            String path = request.getRealPath("/") + "pdfFiles" + File.separator + pdfFileName;
            FileOperator.savefile(part.getInputStream(), path);
            out.print(username + "  " + StudentEmail + "  " + password + "  " + jobDesc+" "+path+" "+path.charAt(path.length()-1));
            mailSender mailsender = new mailSender();
            if (path.charAt(path.length()-1)=='\\') 
            {
                if(mailSender.sendMail(username, password, StudentEmail, subject, jobDesc))
                {
                    response.sendRedirect("placementDrives.jsp");
                }
                
            }
            else{
                if (mailsender.sendMailWithFile(username, password, StudentEmail, subject, jobDesc, path)) {
                    response.sendRedirect("placementDrives.jsp");
                }
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
