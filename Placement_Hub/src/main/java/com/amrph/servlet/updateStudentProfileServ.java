/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.servlet;

import com.amrph.dao.AdminDao;
import com.amrph.dao.StudentDao;
import com.amrph.entities.admin;
import com.amrph.entities.student;
import com.amrph.helper.FileOperator;
import com.amrph.helper.connection_provider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class updateStudentProfileServ extends HttpServlet {

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
            out.println("<title>Servlet updateStudentProfileServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateStudentProfileServ at " + request.getContextPath() + "</h1>");

            String name = request.getParameter("name");
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
            
            

            Part part = request.getPart("profile_pic");
            String imageName = part.getSubmittedFileName();
            if (imageName.length() == 0) {
                imageName = "default.jpg";
            }
            //  out.print(userId + " " + email + "  " + userName + " " + imageName);

            StudentDao StudentDao = new StudentDao(connection_provider.getconnection());
            HttpSession session = request.getSession();
            student s = (student)session.getAttribute("currentStudent");
            
            s.setName(name);
            s.setDept(dept);
            s.setMobile_no(mobile_no);
            s.setEmail(email);
            s.setHigh_school_per(high_school_per);
            s.setIntermidiate_per(intermidiate_per);
            s.setPassout_year(passout_year);
            s.setProfile_pic(imageName);
            s.setUg_per(ug_per);
            s.setPg_per(pg_per);
            s.setCourse(course);
            s.setRoll_no(roll_no);
            
            if (StudentDao.updateUser(s)) {
                //saving image file to folder 
                String path = request.getRealPath("/") + "studentImages" + File.separator + s.getProfile_pic();
                if (FileOperator.savefile(part.getInputStream(), path));
                {
                    response.sendRedirect("studentDashboard.jsp");
                }

            } else {
                out.print("some error occured");
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
