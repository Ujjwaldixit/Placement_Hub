/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.servlet;

import com.amrph.dao.AdminDao;
import com.amrph.helper.FileOperator;
import com.amrph.helper.connection_provider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.String.format;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
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
public class addDrivesServ extends HttpServlet {

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
            out.println("<title>Servlet addDrivesServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addDrivesServ at " + request.getContextPath() + "</h1>");

            int ug_per_required = Integer.parseInt(request.getParameter("ugid"));
            int pg_per_required = Integer.parseInt(request.getParameter("pgid"));
            int high_school_per_required = Integer.parseInt(request.getParameter("hid"));
            int intermidiate_per_required = Integer.parseInt(request.getParameter("iid"));
            String[] branchesEligible = request.getParameterValues("id");

            String companyName = request.getParameter("companyName");
            String jobDesc = request.getParameter("jobDesc");
            Date dateExp = Date.valueOf(request.getParameter("dateOfExpiry"));

            Part part = request.getPart("comp_image");
            String comp_image = part.getSubmittedFileName();

            Part part1 = request.getPart("logo");
            String logo = part1.getSubmittedFileName();

            if (branchesEligible.length == 0) {
                out.println("null");
            } else {
                for (int i = 0; i < branchesEligible.length; i++) {
                    out.print(branchesEligible[i]);
                }
            }
            out.println(ug_per_required + "  " + pg_per_required + " " + high_school_per_required + " " + intermidiate_per_required);
            out.println(jobDesc);
            out.println(companyName);
            out.println(dateExp);
            AdminDao admindao = new AdminDao(connection_provider.getconnection());
            if (admindao.addDrives(jobDesc, dateExp, companyName, logo, comp_image)) {
                String path = request.getRealPath("/") + "logo" + File.separator + logo;
                FileOperator.savefile(part1.getInputStream(), path);                 
                    String path1 = request.getRealPath("/") + "companyImages" + File.separator + comp_image;
                   FileOperator.savefile(part.getInputStream(), path1);
                        if (branchesEligible.length > 0) 
                        {
                            String emailId = admindao.getStudentsMailId(branchesEligible, ug_per_required, pg_per_required, high_school_per_required, intermidiate_per_required, companyName);
                            out.print(emailId);
                            request.setAttribute("jobDesc", jobDesc);
                            request.setAttribute("emailId", emailId);
                            RequestDispatcher rd = request.getRequestDispatcher("mail.jsp");
                            rd.forward(request, response);
                        } 
                        else 
                            out.print("not saved");
                        
                    
                
                
                    
                
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
