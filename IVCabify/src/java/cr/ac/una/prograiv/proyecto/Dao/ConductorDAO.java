/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Dao;

import cr.ac.una.prograiv.proyecto.Domain.Conductor;
import cr.ac.una.prograiv.proyecto.Utils.HibernateUtil;
import java.util.LinkedHashMap;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author Marco Andres
 */
public class ConductorDAO extends HibernateUtil implements IBaseDao<Conductor, Integer> {

    @Override
    public void save(Conductor o) {
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
    public Conductor merge(Conductor o) {
        try {
            iniciarOperacion();
            o = (Conductor) getSession().merge(o);
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
    public void delete(Conductor o) {
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
    public Conductor findById(Integer id) {
        Conductor conductor = null;

        try {
            iniciarOperacion();
            conductor = (Conductor) getSession().get(Conductor.class, id);
        } finally {
            getSession().close();
        }
        return conductor;
    }

    @Override
    public List<Conductor> findAll() {
        List<Conductor> listaConductor;
        try {
            iniciarOperacion();//HQL
            listaConductor = getSession().createQuery("from Conductor").list();
        } finally {
            getSession().close();
        }

        return listaConductor;
    }

    @Override
    public List createQueryHQL(Integer o) {
        List lista = null;
        try {
            iniciarOperacion();
            String sql = "from Conductor where id like '%%%d%%'";
            sql = String.format(sql,o);
            lista = getSession().createQuery(sql).list();
        } finally {
            getSession().close();
        }
        return lista;
    }

}
