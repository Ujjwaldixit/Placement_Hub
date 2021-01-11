/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlets;

import com.blog.dao.getcategorydao;
import com.blog.entities.entity;
import com.blog.entities.post;
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
@MultipartConfig
public class addpost_serv extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addpost_serv</title>");
            out.println("</head>");
            out.println("<body>");
            
            
            String ptitle = request.getParameter("ptitle");
            String pcontent = request.getParameter("pcontent");
            int cid = Integer.parseInt(request.getParameter("cid"));
            Part part = request.getPart("ppic");
            
            //getting current userid
            HttpSession session = request.getSession();
            entity user = (entity) session.getAttribute("user");
            post p = new post(ptitle,pcontent,part.getSubmittedFileName(),null,cid,user.getId());
            
            //to save post in database
            getcategorydao getpost=new getcategorydao(connection_provider.getConnection());
           String path=request.getRealPath("/")+"blog_images"+File.separator+part.getSubmittedFileName();
            out.print(path);
            if(getpost.savepost(p))
            {
                out.println("save post");
                saveAndDelteImg.savefile(part.getInputStream(), path);
                out.print("post image saved");
            }
            else{
                out.println("not saved post");
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
