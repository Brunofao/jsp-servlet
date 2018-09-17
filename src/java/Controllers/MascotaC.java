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
import DAO.PersonaDAO;
import Models.Mascota;
import Models.Persona;
import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.query.Predicate;
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
@WebServlet(name = "MascotaC", urlPatterns = {"/mascota"})
public class MascotaC extends HttpServlet {
    //
    PersonaDAO pdao = new PersonaDAO();
    MascotaDAO mdao = new MascotaDAO();
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
            out.println("<title>Servlet MascotaC</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MascotaC at " + request.getContextPath() + "</h1>");
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
        ////////////////////////////////////////////////////////////////////////
        List<Mascota> p2 = mdao.read();
        ////////////////////////////////////////////////////////////////////////
        request.setAttribute("lista", p2);
        
        String id = request.getParameter("id");
        
        if (id != null && !id.isEmpty()) {
            ObjectContainer db4o = Db4oEmbedded.openFile(Db4oEmbedded
                .newConfiguration(), "C:\\Users\\John Wick Recargado\\Documents\\NetBeansProjects\\pet.db4o");
            Mascota mascotax = mdao.findAMascotaByID(db4o, id);
            db4o.close();
            request.setAttribute("mascotica", mascotax);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/mascota-c.jsp");
            dispatcher.forward(request, response);
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/mascota-r.jsp");
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
        ////////////////////////////////////////////////////////////////////////
        String dni = request.getParameter("dni");
        String name = request.getParameter("name");
        String species = request.getParameter("species");
        ////////////////////////////////////////////////////////////////////////
        
        String id = request.getParameter("id");
        
        if (id == null || id.isEmpty()) {
            System.out.println("Entró en el if...");
            ObjectContainer db4o = Db4oEmbedded.openFile(Db4oEmbedded
                .newConfiguration(), "C:\\Users\\John Wick Recargado\\Documents\\NetBeansProjects\\pet.db4o");
            try {
                Mascota mascotica = new Mascota();
                mascotica.setPersona(pdao.Native(db4o, dni));
                mascotica.setName(name);
                mascotica.setSpecies(species);
                mascotica.setId(mascotica.generateID());
                db4o.store(mascotica); 
            } finally {
                db4o.close();
            }
        } else {
            System.out.println("Entró en el else...");
            ObjectContainer db4o = Db4oEmbedded.openFile(Db4oEmbedded
                .newConfiguration(), "C:\\Users\\John Wick Recargado\\Documents\\NetBeansProjects\\pet.db4o");
            try {
                Mascota mascotica;
                mascotica = mdao.findAMascotaByID(db4o, id);
                mascotica.setPersona(pdao.Native(db4o, dni));
                mascotica.setName(name);
                mascotica.setSpecies(species);
                mascotica.setId(mascotica.generateID());
                db4o.store(mascotica);
            } finally {
                db4o.close();
            }
        }
        response.sendRedirect("/mascota");
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
