/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Test;

import cr.ac.una.prograiv.proyecto.BL.ConductorBL;
import cr.ac.una.prograiv.proyecto.BL.UsuarioBL;
import cr.ac.una.prograiv.proyecto.BL.VehiculoBL;
import cr.ac.una.prograiv.proyecto.BL.ViajeBL;
import cr.ac.una.prograiv.proyecto.Domain.Conductor;
import cr.ac.una.prograiv.proyecto.Domain.Usuario;
import cr.ac.una.prograiv.proyecto.Domain.Vehiculo;
import cr.ac.una.prograiv.proyecto.Domain.Viaje;
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
        VehiculoBL VL = new VehiculoBL();
       
        //VL.save(nv);
        //VL.merge(nv);
        //List<Vehiculo> veiculos = VL.findAll(Vehiculo.class.getName());
        //Veiculo bl = VL.findById("EDF-875");
        Vehiculo marco = VL.findById("144567845");

        UsuarioBL UL = new UsuarioBL();
        Usuario us = UL.findById(115640030);
        /*Usuario u = new Usuario(111, "Juan", "Ramirez", "juan1234@gmail.com", "1234", new Date(), "S.J.M", "22660503", "admin", 123, 432, new Date(), 12345);
        UL.save(u);

        List<Usuario> usuario = UL.findAll(Usuario.class.getName());
        Usuario us = UL.findById(115640030);
        //UL.delete(UL.findById(86796456));
        System.out.println("Hello");*/
        
        
        ConductorBL cbl = new ConductorBL();
        VehiculoBL vnl = new VehiculoBL();
          Conductor nueco = cbl.findById(125464);
        /*Conductor c = new Conductor(125464,"Juana Maria","Gonzales","125547","B1",new Date(),new Date(),"0","admin",0,new Date(),0);
        //cbl.save(c);
        //cbl.merge(c);
        //List<Conductor> lista = cbl.findAll(Conductor.class.getName());
        */
      ViajeBL vBBL = new ViajeBL();
     Viaje v = new Viaje(12345,nueco,us,marco,new Date(),new Date(),new Date(),64464.54,"25355253","32324324",545454.2);
     
       vBBL.save(v);
       //vBBL.merge(v);
       //Viaje f = vBBL.findById(111616);
       
       
       
        System.out.println("");

    }

}
