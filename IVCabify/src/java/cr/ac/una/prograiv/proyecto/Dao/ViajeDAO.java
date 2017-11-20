/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Dao;

import cr.ac.una.prograiv.proyecto.Domain.Viaje;
import cr.ac.una.prograiv.proyecto.Utils.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author Marco Andres
 */
public class ViajeDAO extends HibernateUtil implements IBaseDao<Viaje, Integer> {

    @Override
    public void save(Viaje o) {
         try {
                iniciarOperacion();
                getSession().save(o);
                getTransac().commit();
            } catch (HibernateException he) {
                manejarException(he);
                throw he;
            } finally {
                getSession().close();
            }
    }

    @Override
    public Viaje merge(Viaje o) {
        try {
            iniciarOperacion();
            o = (Viaje) getSession().merge(o);
            getTransac().commit();
        } catch (HibernateException he) {
            manejarException(he);
            throw he;
        } finally {
            getSession().close();
        }
        return o;
    }

    @Override
    public void delete(Viaje o) {
        try {
            iniciarOperacion();
            getSession().delete(o);
            getTransac().commit();
        } catch (HibernateException he) {
            manejarException(he);
            throw he;
        } finally {
            getSession().close();
        }
    }

    @Override
    public Viaje findById(Integer o) {
        Viaje viaje = null;

        try {
            iniciarOperacion();
            viaje = (Viaje) getSession().get(Viaje.class, o);
        } finally {
            getSession().close();
        }
        return viaje;
    }

    @Override
    public List<Viaje> findAll() {
        List<Viaje> listaViaje;
        try {
            iniciarOperacion();//HQL
            listaViaje = getSession().createQuery("from Viaje").list();
        } finally {
            getSession().close();
        }

        return listaViaje;
    }

    @Override
    public List createQueryHQL(Integer o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
