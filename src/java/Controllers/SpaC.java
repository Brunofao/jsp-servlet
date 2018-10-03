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

import DAO.EstilistaDAO;
import DAO.MascotaDAO;
import DAO.PersonaDAO;
import DAO.SpaDAO;
import DAO.SurgeryDAO;
import Models.Estilista;
import Models.Mascota;
import Models.RoomSPA;
import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.ext.DatabaseClosedException;
import com.db4o.ext.DatabaseReadOnlyException;
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
@WebServlet(name = "SpaC", urlPatterns = {"/spa"})
public class SpaC extends HttpServlet {
    //
    private final PersonaDAO pdao = new PersonaDAO();
    private final SurgeryDAO sdao = new SurgeryDAO();
    private final SpaDAO spadao = new SpaDAO();
    private final MascotaDAO mdao = new MascotaDAO();
    private final EstilistaDAO edao = new EstilistaDAO();
    private final String path = "C:\\Users\\John Wick Recargado\\Documents\\NetBeansProjects\\pet.db4o";
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
            out.println("<title>Servlet SpaC</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SpaC at " + request.getContextPath() + "</h1>");
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
        List<RoomSPA> spal = spadao.read();
        ////////////////////////////////////////////////////////////////////////
        request.setAttribute("lista", spal);
        
        String id = request.getParameter("id");
        //  System.out.println(id);
        
        if (id != null && !id.isEmpty()) {
            ObjectContainer db4o = Db4oEmbedded.openFile(Db4oEmbedded
                .newConfiguration(), path);
            RoomSPA roomspax = spadao.findARoomSPAByID(db4o, id);
            db4o.close();
            request.setAttribute("spa", roomspax);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/spa-c.jsp");
            dispatcher.forward(request, response);
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/spa-r.jsp");
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
        String mascotaid = request.getParameter("mascota");
        ////////////////////////////////////////////////////////////////////////
        String id = request.getParameter("id");
        
        if (id == null || id.isEmpty()) {
           ObjectContainer db4o = Db4oEmbedded.openFile(Db4oEmbedded
                .newConfiguration(), path);
        try {
            System.out.println("Database opened...");
            Mascota mascota = mdao.findAMascotaByID(db4o, mascotaid);
            Estilista estilista = edao.findAEstilistByDNI(db4o, dni);
            RoomSPA roomspa = new RoomSPA();
            roomspa.setMascota(mascota);
            roomspa.setEstilista(estilista);
            roomspa.setId();
            roomspa.setStatus(Boolean.TRUE);
            mascota.setStatus(Boolean.FALSE);
            estilista.setStatus(Boolean.FALSE);
            db4o.store(mascota);
            db4o.store(estilista);
            db4o.store(roomspa);
        }catch (DatabaseClosedException | DatabaseReadOnlyException e) {
            System.out.println("Database closed with errors..." + " " + e);
        }finally {
            System.out.println("Database closed...");
            db4o.close();
            System.out.println("New person added...");
        } 
        } else {
            System.out.println("Entró en el else...");
            System.out.println(mascotaid + " " + dni);
            ObjectContainer db4o = Db4oEmbedded.openFile(Db4oEmbedded
                .newConfiguration(), path);
            try {
                RoomSPA room;
                room = spadao.findARoomSPAByID(db4o, id);
                room.setMascota(mdao.findAMascotaByID(db4o, mascotaid));
                room.setEstilista(edao.findAEstilistByDNI(db4o, dni));
                room.setId();
                db4o.store(room);
            } finally {
                db4o.close();
            }
        }
        response.sendRedirect("/spa");
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
