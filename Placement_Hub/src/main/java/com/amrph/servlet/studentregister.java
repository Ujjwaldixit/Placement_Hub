/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.servlet;

import com.amrph.dao.StudentDao;
import com.amrph.entities.student;
import com.amrph.helper.connection_provider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class studentregister extends HttpServlet {

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
            out.println("<title>Servlet studentregister</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet studentregister at " + request.getContextPath() + "</h1>");

            String name = request.getParameter("name");
            String password = request.getParameter("password");
            int high_school_per = Integer.parseInt(request.getParameter("high_per"));
            int intermidiate_per = Integer.parseInt(request.getParameter("inter_per"));
            String roll_no = request.getParameter("roll_no");
            String email = request.getParameter("email");
            String course = request.getParameter("course");
            String dept = request.getParameter("depart");
            String mobile_no = request.getParameter("mobile");
            int passout_year = Integer.parseInt(request.getParameter("passout_year"));
            int pg_per = Integer.parseInt(request.getParameter("pg_per"));
            int ug_per = Integer.parseInt(request.getParameter("ug_per"));
            
            out.print(name+" "+password+" "+ug_per+" "+high_school_per+" "+intermidiate_per+" "+pg_per+" "+passout_year+" "+mobile_no+" "+email+" "+course+" "+dept+" "+roll_no);
            
            student student = new student(name, password, ug_per, high_school_per, intermidiate_per, pg_per, passout_year, mobile_no, email, course, dept, roll_no);
           
            
            StudentDao studentdao = new StudentDao(connection_provider.getconnection());
            out.println("established");
            if (studentdao.saveuser(student)) {
                response.sendRedirect("studentLogin.jsp");
            } else {
                out.print("not resgistered");
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
