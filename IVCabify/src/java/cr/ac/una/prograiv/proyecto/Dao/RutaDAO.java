/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Dao;

import cr.ac.una.prograiv.proyecto.Domain.Ruta;
import cr.ac.una.prograiv.proyecto.Utils.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author Marco Andres
 */
public class RutaDAO extends HibernateUtil implements IBaseDao<Ruta, Integer> {

    @Override
    public void save(Ruta o) {
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
    public Ruta merge(Ruta o) {
        try {
            iniciarOperacion();
            o = (Ruta) getSession().merge(o);
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
    public void delete(Ruta o) {
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
    public Ruta findById(Integer o) {
        Ruta ruta = null;

        try {
            iniciarOperacion();
            ruta = (Ruta) getSession().get(Ruta.class, o);
        } finally {
            getSession().close();
        }
        return ruta;
    }

    @Override
    public List<Ruta> findAll() {
        List<Ruta> listaRuta;
        try {
            iniciarOperacion();//HQL
            listaRuta = getSession().createQuery("from Ruta").list();
        } finally {
            getSession().close();
        }

        return listaRuta;
    }

    @Override
    public List createQueryHQL(Integer o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
