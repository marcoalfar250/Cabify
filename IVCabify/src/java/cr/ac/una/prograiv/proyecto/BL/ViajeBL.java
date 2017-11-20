/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.BL;

import cr.ac.una.prograiv.proyecto.Domain.Viaje;
import java.util.List;

/**
 *
 * @author Marco Andres
 */
public class ViajeBL extends BaseBL implements IBaseBL<Viaje, Integer> {

    @Override
    public void save(Viaje o) {
        this.getDao(o.getClass().getName()).save(o);
    }

    @Override
    public Viaje merge(Viaje o) {
        return (Viaje) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Viaje o) {
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Viaje findById(Integer o) {
        return (Viaje) this.getDao(Viaje.class.getName()).findById(o);
    }

    @Override
    public List<Viaje> findAll(String className) {
        return this.getDao(className).findAll();
    }

    @Override
    public List createQueryHQL(Integer o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
