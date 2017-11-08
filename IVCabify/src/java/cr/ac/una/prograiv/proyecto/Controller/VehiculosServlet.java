/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.proyecto.BL.ConductorBL;
import cr.ac.una.prograiv.proyecto.BL.VehiculoBL;
import cr.ac.una.prograiv.proyecto.Domain.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marco Andres
 */
public class VehiculosServlet extends HttpServlet {

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
            Vehiculo v = new Vehiculo();

            //Se crea el objeto de la logica de negocio
            VehiculoBL vBL = new VehiculoBL();
            ConductorBL gf = new ConductorBL();

            //Se hace una pausa para ver el modal
            Thread.sleep(1000);

            //**********************************************************************
            //se toman los datos de la session
            //**********************************************************************
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            switch (accion) {
                case"consultarVehiculos":{
                    json = new Gson().toJson(vBL.findAll(Vehiculo.class.getName()));
                    out.print(json);
                    break;
                }
                case "BuscarVehiculo":{
                    json = new Gson().toJson(vBL.createQueryHQL(request.getParameter("PlacaVehiculo")));
                    out.print(json);
                    break;
                }
                case "consultarVehiculoByP": {

                    v = vBL.findById(request.getParameter("Placa"));
                    json = new Gson().toJson(v);
                    out.print(json);

                    break;
                }
                case "eliminarVehiculo": {

                    v.setPlaca(request.getParameter("Placa"));

                    vBL.delete(v);

                    out.print("El vehiculo fue  elimanado correctamente");

                    break;
                }
                case "agregarVehiculo": case "modificarVehiculo":{
                    v.setPlaca(request.getParameter("placa"));
                    v.setConductor(gf.findById(Integer.parseInt(request.getParameter("conductor"))));
                    v.setModelo(request.getParameter("modelo"));
                    v.setMarca(request.getParameter("marca"));
                    v.setAhno(Integer.parseInt(request.getParameter("ahno")));
                    v.setColor(request.getParameter("color"));
                    v.setPuntuacion(0);
                    v.setEstado(request.getParameter("estado"));
                    v.setCapPasaj(Integer.parseInt(request.getParameter("cantidadPasa")));
                    v.setUbicacion("");
                    v.setUusarioActual(0);
                    v.setUltimaMod(new Date());
                    v.setUltModUs(0);
                    if (accion.equals("agregarVehiculo")) { //es insertar 
                        //Se guarda el objeto
                        vBL.save(v);

                        //Se imprime la respuesta con el response
                        out.print("C~El vehiculo fue ingresado correctamente");

                    } else {//es modificar persona
                        //Se guarda el objeto
                        vBL.merge(v);

                        //Se imprime la respuesta con el response
                        out.print("C~El vehiculo fue modificado correctamente");
                    }
                    break;
                }
                default: {
                    out.print("E~No se indico la acción que se desea realizare");
                    break;
                }
            }
        } catch (NumberFormatException e) {
            out.print("E~" + e.getMessage());
        } catch (Exception e) {
            out.print("E~" + e.getMessage());
            System.out.println(e.getMessage());
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
