/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Test;

import cr.ac.una.prograiv.proyecto.BL.ConductorBL;
import cr.ac.una.prograiv.proyecto.BL.UsuarioBL;
import cr.ac.una.prograiv.proyecto.BL.VehiculoBL;
import cr.ac.una.prograiv.proyecto.Domain.Conductor;
import cr.ac.una.prograiv.proyecto.Domain.Usuario;
import cr.ac.una.prograiv.proyecto.Domain.Vehiculo;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Marco Andres
 */
public class Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /*VehiculoBL VL = new VehiculoBL();
        
        Vehiculo nv = new Vehiculo("SAR-524","TUNDRA",2010,"Rosa",4,"Activo","Chepe",12365,8745,new Date(),1264);
        //VL.save(nv);
        //VL.merge(nv);
        //List<Vehiculo> veiculos = VL.findAll(Vehiculo.class.getName());
        //Veiculo bl = VL.findById("EDF-875");
        VL.delete(nv);
        Vehiculo marco = VL.findById("ETC-754");*/

        /*UsuarioBL UL = new UsuarioBL();
        
        Usuario u = new Usuario(111, "Juan", "Ramirez", "juan1234@gmail.com", "1234", new Date(), "S.J.M", "22660503", "admin", 123, 432, new Date(), 12345);
        UL.save(u);

        List<Usuario> usuario = UL.findAll(Usuario.class.getName());
        Usuario us = UL.findById(115640030);
        //UL.delete(UL.findById(86796456));
        System.out.println("Hello");*/
        
        
        ConductorBL cbl = new ConductorBL();
        VehiculoBL vnl = new VehiculoBL();
        /*Conductor c = new Conductor(125464,"Juana Maria","Gonzales","125547","B1",new Date(),new Date(),"0","admin",0,new Date(),0);
        //cbl.save(c);
        //cbl.merge(c);
        //List<Conductor> lista = cbl.findAll(Conductor.class.getName());
        */
       /* Conductor nueco = cbl.findById(125464);
        Vehiculo v = new Vehiculo("SDC-123",nueco,"TACOMA",2017,"Rosa",5,"activo","Heredia",0,nueco.getId(),new Date(),0);
        //vnl.save(v);
        vnl.merge(v);
        List<Vehiculo> listav = vnl.findAll(Vehiculo.class.getName());
        Vehiculo vs = vnl.findById("SDC-123");
        
        System.out.println("");*/

    }

}
