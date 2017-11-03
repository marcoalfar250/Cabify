/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.BL;

import cr.ac.una.prograiv.proyecto.Domain.Vehiculo;
import java.util.List;

/**
 *
 * @author Marco Andres
 */
public class VehiculoBL extends BaseBL implements IBaseBL<Vehiculo, String> {

    @Override
    public void save(Vehiculo o) {
        this.getDao(o.getClass().getName()).save(o);
    }

    @Override
    public Vehiculo merge(Vehiculo o) {
        return (Vehiculo) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Vehiculo o) {
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Vehiculo findById(String o) {
        return (Vehiculo) this.getDao(Vehiculo.class.getName()).findById(o);
    }

    @Override
    public List<Vehiculo> findAll(String className) {
        return this.getDao(className).findAll();
    }

}
