/*
 * The MIT License
 *
 * Copyright 2018 John Wick Recargado.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package Controllers;

import DAO.MascotaDAO;
import DAO.SurgeryDAO;
import DAO.VeterinarioDAO;
import Models.Mascota;
import Models.RoomSPA;
import Models.RoomSurgery;
import Models.Veterinario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author John Wick Recargado
 */
@WebServlet(name = "SurgeryC", urlPatterns = {"/surgery"})
public class SurgeryC extends HttpServlet {
    //
    SurgeryDAO sdao = new SurgeryDAO();
    MascotaDAO mdao = new MascotaDAO();
    VeterinarioDAO vdao = new VeterinarioDAO();
    //
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
            out.println("<title>Servlet SurgeryC</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SurgeryC at " + request.getContextPath() + "</h1>");
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
        sdao.clearDatabase();
        
        RoomSurgery roomsurgery = new RoomSurgery();
        Mascota mascota = mdao.findAMascotaByID("819faoro");
        Veterinario veterinario = vdao.findAVeterinarioByDNI("00000000");
        roomsurgery.setId("surgery#" + mascota.getId());
        roomsurgery.setVeterinario(veterinario);
        roomsurgery.setMascota(mascota);
        
        sdao.add(roomsurgery);
        
        List<RoomSurgery> spa2 = sdao.read();
        
        spa2.forEach((spa0) -> {
            System.out.println(spa0);
        });
        
        request.setAttribute("lista", spa2);
        
        //  response.sendRedirect("/spa");
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/surgery-r.jsp");
        dispatcher.forward(request, response);
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
