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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "procesarComentario", urlPatterns = {"/procesarComentario"})
public class procesarComentario extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);
        buscar bu=new buscar();
        HttpSession sesion=request.getSession(true);
        String usuario=(String)sesion.getAttribute("usuario");
        String num=request.getParameter("idcom");
        String respuesta="";
        int res=0;
                res=Integer.parseInt(num);
        String comentario=request.getParameter("comentario");
        String comentar=new String(comentario.getBytes(),"UTF-8");
        String com=new String(comentario.getBytes(),"UTF-8");
        String fecha=request.getParameter("fecha");
        String jue=request.getParameter("juego");
        int numj=bu.numeroJuego(jue);
        if(bu.comprobarCompradores(numj, usuario)==false){
        respuesta="Para comentar debes de comprar el juego.\nGracias";
        response.sendRedirect("ingresarComentarios.jsp?respuesta="+respuesta);
        }
        else{
        comentario comen=new comentario();
         guardar gu=new guardar();
          comen.setCliente(usuario);
        comen.setId_juego(numj);
        comen.setFecha(fecha);
       comen.setRespuesta(res);
       comen.setTexto(comentar);
       gu.guardarComentario(comen);
       String asunto="Nuevo comentario sobre"+juego;
       String interno=comentar+"  Realizado por"+usuario;
       ResultSet rs;
       rs=bu.traerCompradores(numj);
            try {
                while(rs.next()){
                   String email=rs.getString("email");
                    EnviadorMail enviar=new EnviadorMail(email, asunto, interno);
                }    } catch (SQLException ex) {
                Logger.getLogger(procesarComentario.class.getName()).log(Level.SEVERE, null, ex);
            }
       
        response.sendRedirect("indexDes.jsp");
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
