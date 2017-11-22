/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.proyecto.BL.UsuarioBL;
import cr.ac.una.prograiv.proyecto.Domain.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marco
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

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
            throws ServletException, IOException, InterruptedException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String json;

            //Se crea el objeto Persona
            Usuario u = new Usuario();

            //Se crea el objeto de la logica de negocio
            UsuarioBL uBL = new UsuarioBL();

            //Se hace una pausa para ver el modal
            Thread.sleep(1000);
            String accion = request.getParameter("accion");
            switch (accion){
                case "RegistrarUsuario":
                    u.setId(Integer.parseInt(request.getParameter("cedula")));
                    u.setNombre(request.getParameter("nombre"));
                    u.setApellidos(request.getParameter("apellidos"));
                    u.setCorreo(request.getParameter("Correo"));
                    u.setPassword(request.getParameter("password"));
                    //Guardar Correctamente en la base de datos
                    String fechatxt = request.getParameter("fechaN");
                    DateFormat format = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
                    Date date = format.parse(fechatxt);

                    u.setFechaN(date);
                    u.setDireccion(request.getParameter("direccion"));
                    u.setTelefono(request.getParameter("telefono"));
                    u.setTipoUsuario(request.getParameter("tipoUsuario"));
                    u.setVehiculoactual(0);
                    u.setChoferactual(0);
                    u.setUltModUs(0);//nombre de la seccion
                    u.setUltimaMod(new Date());

                    if (accion.equals("RegistrarUsuario")) { //es insertar personas
                        //Se guarda el objeto
                        uBL.save(u);

                        //Se imprime la respuesta con el response
                        out.print("C~El usuario fue ingresado correctamente");
            
                    
                    } 
                    break;
                    default:
                    out.print("E~No se indico la acción que se desea realizare");
                    break;
        }
    }
        catch (NumberFormatException e) {
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
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(RegistroServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(RegistroServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(RegistroServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(RegistroServlet.class.getName()).log(Level.SEVERE, null, ex);
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
