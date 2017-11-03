/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.BL;

import cr.ac.una.prograiv.proyecto.Dao.ConductorDAO;
import cr.ac.una.prograiv.proyecto.Dao.IBaseDao;
import cr.ac.una.prograiv.proyecto.Dao.UsuarioDAO;
import cr.ac.una.prograiv.proyecto.Dao.VeiculoDAO;
import java.util.LinkedHashMap;

/**
 *
 * @author Marco Andres
 */
public class BaseBL {
    private final LinkedHashMap<String, IBaseDao> daos;

   public BaseBL() {
        daos = new LinkedHashMap();
        daos.put("cr.ac.una.prograiv.proyecto.Domain.Usuario", new UsuarioDAO());
        daos.put("cr.ac.una.prograiv.proyecto.Domain.Conductor", new ConductorDAO());
        daos.put("cr.ac.una.prograiv.proyecto.Domain.Vehiculo", new VeiculoDAO());
       
        
    }
   
   public IBaseDao getDao(String className){
        return daos.get(className);
    }
    
    
    
}
