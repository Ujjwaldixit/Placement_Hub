/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlets;

import com.blog.dao.userdao;
import com.blog.entities.entity;
import com.blog.helper.connection_provider;
import com.blog.helper.saveAndDelteImg;
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
@MultipartConfig  // for multi part data 
public class editprofile_serv extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editprofile_serv</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String name=request.getParameter("name");
            
            String password=request.getParameter("password");
            
            String email=request.getParameter("email");
            
            Part part=request.getPart("image");
            
            String profile_image=part.getSubmittedFileName();//this will give the image name to be saved in database
            
           
            HttpSession session=request.getSession();
            
          
            entity user=(entity)session.getAttribute("user");
            
              
             
              user.setEmail(email);
              user.setName(name);
              user.setPassword(password);
            String oldpic=user.getProfile_pic();
              user.setProfile_pic(profile_image);
                
           //updateing datbase
           userdao usr=new userdao(connection_provider.getConnection()); 
           boolean check=usr.updateuser(user);
          
           if(check)
           {
               out.println("updated");
               String path=  path=request.getRealPath("/")+"images"+File.separator+oldpic;
               saveAndDelteImg.delete(path);
               
                path=request.getRealPath("/")+"images"+File.separator+user.getProfile_pic();
              
                
               if(saveAndDelteImg.savefile(part.getInputStream(), path))
               {
                  out.print(" pic updated");
               }
                       
                     
                   
           
           }
           else
           {
               out.print("not updated");
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
