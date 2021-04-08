/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amrph.servlet;

import com.amrph.dao.AdminDao;
import com.amrph.entities.admin;
import com.amrph.helper.connection_provider;
import com.amrph.helper.FileOperator;
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

@MultipartConfig
public class updateProfilServ extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateProfilServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProfilServ at " + request.getContextPath() + "</h1>");

            int userId = Integer.parseInt(request.getParameter("userId"));
            String email = request.getParameter("email");
            String userName = request.getParameter("userName");
            Part part = request.getPart("profile_pic");
            String imageName = part.getSubmittedFileName();
            if (imageName.length() == 0) {
                imageName = "default.jpg";
            }
          //  out.print(userId + " " + email + "  " + userName + " " + imageName);

            AdminDao AdminDao = new AdminDao(connection_provider.getconnection());
            HttpSession session = request.getSession();
            admin admin = (admin) session.getAttribute("currentuser");
           

            admin.setName(userName);
            admin.setEmail(email);
            admin.setProfile_pic(imageName);
            admin.setUserId(userId);

            if (AdminDao.updateProfile(admin)) {
                //saving image file to folder 
                String path = request.getRealPath("/") + "AdminImages" + File.separator + admin.getProfile_pic();
                if (FileOperator.savefile(part.getInputStream(), path));
                {
                   
                    response.sendRedirect("AdminDashboard.jsp");
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
