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
        //  mdao.clearDatabase();
        //  pdao.clearDatabase();
        //  Persona p = new Persona("25595819", "Bruno", "Faoro", "04249585812");
        //  Mascota m = new Mascota(p, "819faoro", "Clementina", "Perro", 35.4f, "Femenino", "2", "Bull Terrier Inglés");
        
        /*
            System.out.println("Viejo ID" + " " + m.getId());
            m.setId(m.generateID());
            System.out.println("Nuevo ID" + " " + m.getId());
        */
        
        //  mdao.add(m);
        
        /*
            Mascota pruebita = mdao.findAMascotaByID(m.getId());
            System.out.println(pruebita.getName());
        */
        
        List<Mascota> p2 = mdao.read();
        
        /*
            p2.forEach((lp0) -> {
                System.out.println(lp0);
            });
        */
        
        request.setAttribute("lista", p2);
        
        String id = request.getParameter("id");
        
        if (id != null && !id.isEmpty()) {
            Mascota mascota = mdao.findAMascotaByID(id);
            request.setAttribute("mascotica", mascota);
            //  RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/mascota-c.jsp");
            //  dispatcher.forward(request, response);
            //  System.out.println("Entró en la nueva función -> mdao.findAMascotaByID(id);");
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
        //  RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/mascota-c.jsp");
        
        String dni = request.getParameter("dni");
        String name = request.getParameter("name");
        String species = request.getParameter("species");
        
        Persona aux = new Persona();
        Mascota m = new Mascota();
        
        System.out.println(dni);
        aux.setDni(dni);
        
        aux = pdao.findAPerson(aux);
        System.out.println(aux.getLastname());
        
        Persona p = aux;
        System.out.println(p.getDni());
        
        m.setPersona(p);
        m.setName(name);
        m.setSpecies(species);
        
        mdao.add(m);
        
        response.sendRedirect("/mascota");
        
        //  dispatcher.forward(request, response);
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
