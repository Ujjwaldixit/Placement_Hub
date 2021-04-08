/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.servlet;

import com.amrph.dao.AdminDao;
import com.amrph.dao.drivesDao;
import com.amrph.helper.connection_provider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class updateShortListedServ extends HttpServlet {

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
            out.println("<title>Servlet updateShortListedServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateShortListedServ at " + request.getContextPath() + "</h1>");
            //fetching email of shortlisted Students

            String email[] = request.getParameterValues("check");
            String companyName = request.getParameter("companyName");
            // String email = request.getParameter("email");
            String emailId = new String();
            for (String s : email) {
                emailId += s + ",";
            }

            AdminDao adminDao = new AdminDao(connection_provider.getconnection());
            String selected[] = request.getParameterValues("SelectedStudents");

            boolean check = adminDao.DeleteShortListed(emailId, companyName);

            out.println(check + "  email=" + emailId + " cN=" + companyName);

            out.println("selected--" + selected[0]);
            String msg = "";
            if (selected[0].equals("1")) {

                adminDao.Selected(emailId, companyName);
                msg = "Dear Student,\nCongratulations on being SELECTED for" + companyName;
                msg = new StringBuilder()
                        .append("Dear Studen,\n")
                        .append("it was the age of wisdom, it was the age of foolishness,\n")
                        .append("it was the epoch of belief, it was the epoch of incredulity,\n")
                        .append("it was the season of Light, it was the season of Darkness,\n")
                        .append("Thanks and Regards,\n")
                        .append("Admin")
                        .toString();
            } else {
                msg = new StringBuilder()
                        .append("Dear Student,\n")
                        .append("We are pleased to inform you that you all are shortlisted for P.I. Round ,\n")
                        .append("for the "+companyName+".")
                        .append("\n")
                        .append("We will connect through google meet and calendar invite is already shared with you. Please accept the calendar invite.,\n")
                        .append("\n")
                        .append("Thanks and Regards.\n")
                        .append("Admin")
                        .toString();
            }
            drivesDao drivesDao = new drivesDao(connection_provider.getconnection());
            drivesDao.deleteDrive(companyName);

            out.println("deleted");
            request.setAttribute("jobDesc", msg);
            request.setAttribute("emailId", emailId);
            RequestDispatcher rd = request.getRequestDispatcher("mail.jsp");
            rd.forward(request, response);

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
