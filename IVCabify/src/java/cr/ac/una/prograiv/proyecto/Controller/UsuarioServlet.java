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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marco Andres
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

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
            Usuario u = new Usuario();

            //Se crea el objeto de la logica de negocio
            UsuarioBL uBL = new UsuarioBL();

            //Se hace una pausa para ver el modal
            Thread.sleep(1000);

            //**********************************************************************
            //se toman los datos de la session
            //**********************************************************************
            HttpSession session = request.getSession();
            String accion = request.getParameter("accion");
            String usuario, password;
            switch (accion) {
                case "consultarUsuarios":
                    json = new Gson().toJson(uBL.findAll(Usuario.class.getName()));
                    out.print(json);
                    break;

                case "consultarUsuariosByID":
                    //se consulta la persona por ID
                    u = uBL.findById(Integer.parseInt(request.getParameter("idUsuario")));

                    //se pasa la informacion del objeto a formato JSON
                    json = new Gson().toJson(u);
                    out.print(json);
                    break;

                case "eliminarUsuarios":

                    u.setId(Integer.parseInt(request.getParameter("idUsuario")));

                    //Se elimina el objeto
                    uBL.delete(u);

                    //Se imprime la respuesta con el response
                    out.print("El usuario fue eliminado correctamente");

                    break;
                    
                    case "validarUsuario": {

                    Usuario verdadero = uBL.findById(Integer.parseInt(request.getParameter("usuario")));

                    Integer usuarioTyped = Integer.valueOf(request.getParameter("usuario"));
                    String passwordlOGIN = String.valueOf(request.getParameter("password"));

                    if (usuarioTyped.equals(verdadero.getId())) {
                        if (passwordlOGIN.equals(verdadero.getPassword())) {
                            session = request.getSession(true);
                            session.setAttribute("usuario", usuarioTyped);
                            session.setAttribute("loginStatus", "login");
                            session.setAttribute("Nombre", verdadero.getNombre());
                            if ("admin".equals(verdadero.getTipoUsuario())) {
                                session.setAttribute("tipo", "Administrador");
                            } else {
                                session.setAttribute("tipo", "Normal");
                            }
                            out.print("C~Validación correcta... Está siendo redireccionando");
                        } else {
                            out.print("E~Usuario o contraseña incorrectos");
                        }
                    }
                }
                break;

                case "agregarUsuario":
                case "modificarUsuario":
                case "RegistrarUsuario":    

                    //Se llena el objeto con los datos enviados por AJAX por el metodo post
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

                    if (accion.equals("agregarUsuario")) { //es insertar personas
                        //Se guarda el objeto
                        uBL.save(u);

                        //Se imprime la respuesta con el response
                        out.print("C~El usuario fue ingresado correctamente");

                    } else {//es modificar persona
                        //Se guarda el objeto
                        uBL.merge(u);

                        //Se imprime la respuesta con el response
                        out.print("C~El usuario fue modificado correctamente");
                    }

                    break;
                case "BuscarUsuario":
                    json = new Gson().toJson(uBL.createQueryHQL(Integer.valueOf(request.getParameter("idUsuario"))));
                    out.print(json);
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
