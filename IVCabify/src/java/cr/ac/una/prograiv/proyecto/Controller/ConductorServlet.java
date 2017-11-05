/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.proyecto.BL.ConductorBL;
import cr.ac.una.prograiv.proyecto.Domain.Conductor;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marco Andres
 */
public class ConductorServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String json;

            //Se crea el objeto Persona
            Conductor c = new Conductor();

            //Se crea el objeto de la logica de negocio
            ConductorBL cBL = new ConductorBL();

            //Se hace una pausa para ver el modal
            Thread.sleep(1000);

            //**********************************************************************
            //se toman los datos de la session
            //**********************************************************************
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            switch (accion) {
                case "consultarConductores":
                    json = new Gson().toJson(cBL.findAll(Conductor.class.getName()));
                    out.print(json);
                    break;

                case "consultarConductorByID":
                    
                    c = cBL.findById(Integer.parseInt(request.getParameter("idConductor")));
                    json = new Gson().toJson(c);
                    out.print(json);
                    
                    break;

                case "eliminarConductor":
                    
                    c.setId(Integer.parseInt(request.getParameter("idConductor")));
                    
                    cBL.delete(c);
                    
                    out.print("El conductor fue  elimanado correctamente");
                    
                    break;

                case "agregarConductor":
                case "modificarConductor":
                    c.setId(Integer.parseInt(request.getParameter("cedula")));
                    c.setNombre(request.getParameter("nombre"));
                    c.setApellidos(request.getParameter("apellidos"));
                    c.setPassword(request.getParameter("password"));
                    c.setTipoL(request.getParameter("tipoL"));
                    //Guardar Correctamente en la base de datos
                    String fechatxt = request.getParameter("fechaN");
                    DateFormat format = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
                    Date date = format.parse(fechatxt);

                    String fechatxt1 = request.getParameter("fechaVl");
                    DateFormat format1 = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
                    Date date1 = format1.parse(fechatxt);

                    c.setFechaN(date);
                    c.setFechaVl(date1);
                    c.setTipoConductor(request.getParameter("tipoConductor"));
                    c.setVehiculoActual("0");
                    c.setClienteActual(0);
                    c.setUltimaMod(new Date());
                    c.setUltModUs(0);
                    if (accion.equals("agregarConductor")) { //es insertar 
                        //Se guarda el objeto
                        cBL.save(c);

                        //Se imprime la respuesta con el response
                        out.print("C~El Conductor fue ingresado correctamente");

                    } else {//es modificar persona
                        //Se guarda el objeto
                        cBL.merge(c);

                        //Se imprime la respuesta con el response
                        out.print("C~El Conductor fue modificado correctamente");
                    }

                    break;
                default:
                    out.print("E~No se indico la acción que se desea realizare");
                    break;
            }
        } catch (NumberFormatException e) {
            out.print("E~" + e.getMessage());
        } catch (Exception e) {
            out.print("E~" + e.getMessage());
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
