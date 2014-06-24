/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;
import Logica.*;
import conexion.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author pico
 */
@WebServlet(name = "procesarReclamo", urlPatterns = {"/procesarReclamo"})
public class procesarReclamo extends HttpServlet {

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
        PrintWriter out = response.getWriter();
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
        HttpSession sesion=request.getSession(true);
        String usuario=(String)sesion.getAttribute("usuario");
        String selec=request.getParameter("seleccion");
        String tipo=new String(selec.getBytes(),"UTF-8");
        String recla=request.getParameter("textarea");
        String recl=new String(recla.getBytes(),"UTF-8");
        String ver=request.getParameter("version");
        String fecha=request.getParameter("fecha");
        
        String juego=new String(request.getParameter("juego").getBytes(),"UTF-8");
        buscar bu=new buscar();
        guardar gu=new guardar();
        reclamo rec=new reclamo();
        int numj=bu.numeroJuego(juego);
         if(bu.comprobarCompradores(numj, usuario)==false){
       String respuesta="Para reclamar primero debes de comprar el juego.\nGracias";
        response.sendRedirect("ingresarReclamo.jsp?respuesta="+respuesta);
        }
        else{
         rec.setId_juego(numj);
         rec.setCliente(juego);
         rec.setCategoria(tipo);
         rec.setVersion(ver);
         rec.setTexto(recl);
         rec.setFecha(fecha);
         gu.guardarReclamo(rec);
         
         }
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
