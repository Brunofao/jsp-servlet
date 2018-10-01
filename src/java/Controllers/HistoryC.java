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
import Models.Historial;
import Models.Mascota;
import Models.RoomSurgery;
import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.ext.DatabaseClosedException;
import com.db4o.ext.DatabaseFileLockedException;
import com.db4o.ext.DatabaseReadOnlyException;
import com.db4o.ext.Db4oIOException;
import com.db4o.ext.IncompatibleFileFormatException;
import com.db4o.ext.OldFormatException;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "HistoryC", urlPatterns = {"/history"})
public class HistoryC extends HttpServlet {
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
            out.println("<title>Servlet HistoryC</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HistoryC at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        System.out.println(id);
        
        if (!(id == null || id.isEmpty())) {
            ObjectContainer db4o = Db4oEmbedded.openFile(Db4oEmbedded
                    .newConfiguration(), "C:\\Users\\John Wick Recargado\\Documents\\NetBeansProjects\\pet.db4o");
            RoomSurgery room;
            room = sdao.findARoomSurgeryByID(db4o, id);
            System.out.println(room);
            db4o.close();
            request.setAttribute("roomHistory", room);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/historia-c.jsp");
            dispatcher.forward(request, response);
        }
        
        /*
        if (!(id == null || id.isEmpty())) {
            ObjectContainer db4o = Db4oEmbedded.openFile(Db4oEmbedded
                    .newConfiguration(), "C:\\Users\\John Wick Recargado\\Documents\\NetBeansProjects\\pet.db4o");
            try {
                RoomSurgery room;
                room = sdao.findARoomSurgeryByID(db4o, id);
                room.setStatus(Boolean.FALSE);
                System.out.println(room);
                Historial history = new Historial();
                history.setId(room.getMascota().getId());
                history.setVeterinario(room.getVeterinario());
                history.setDiagnostic("Mamá de las ratas se quedó sin milk");
                history.setTreatment("Recargarle la leche");
                history.setPrice(99.0);
                Mascota mhistory = room.getMascota();
                mhistory.setHistory(history);
                db4o.store(room);
                db4o.store(mhistory);
                System.out.println(room);
            }catch(DatabaseFileLockedException | DatabaseReadOnlyException | Db4oIOException | IncompatibleFileFormatException | OldFormatException e) {
                System.out.println(e.toString());
            }finally {
                db4o.close();
            }
        }*/
        response.sendRedirect("/surgery");
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
        // response.sendRedirect("/surgery");
        String id = request.getParameter("id");
        System.out.println(id);
        String diagnostic = request.getParameter("diagnostic");
        String treatment = request.getParameter("treatment");
        Double price = Double.parseDouble(request.getParameter("price"));
        
        ObjectContainer db4o = Db4oEmbedded.openFile(Db4oEmbedded
                    .newConfiguration(), "C:\\Users\\John Wick Recargado\\Documents\\NetBeansProjects\\pet.db4o");
        
        try {
            RoomSurgery room;
            room = sdao.findARoomSurgeryByID(db4o, id);
            System.out.println(room);
            room.setStatus(Boolean.FALSE);
            Historial history = new Historial();
            history.setId(room.getMascota().getId());
            history.setVeterinario(room.getVeterinario());
            history.setDiagnostic(diagnostic);
            history.setTreatment(treatment);
            history.setPrice(price);
            Mascota mhistory = room.getMascota();
            mhistory.setHistory(history);
            db4o.store(room);
            db4o.store(mhistory);
        }finally {
            db4o.close();
        }
        response.sendRedirect("/surgery");
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
