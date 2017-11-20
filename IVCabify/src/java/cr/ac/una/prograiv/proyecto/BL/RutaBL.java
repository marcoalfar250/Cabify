/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.BL;

import cr.ac.una.prograiv.proyecto.Domain.Ruta;
import java.util.List;

/**
 *
 * @author Marco Andres
 */
public class RutaBL extends BaseBL implements IBaseBL<Ruta, Integer> {

    @Override
    public void save(Ruta o) {
        this.getDao(o.getClass().getName()).save(o);
    }

    @Override
    public Ruta merge(Ruta o) {
        return (Ruta) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Ruta o) {
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Ruta findById(Integer o) {
        return (Ruta) this.getDao(Ruta.class.getName()).findById(o);
    }

    @Override
    public List<Ruta> findAll(String className) {
        return this.getDao(className).findAll();
    }

    @Override
    public List createQueryHQL(Integer o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
