/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Dao;

import cr.ac.una.prograiv.proyecto.Domain.Vehiculo;
import cr.ac.una.prograiv.proyecto.Utils.HibernateUtil;
import java.util.LinkedHashMap;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author Marco Andres
 */
public class VeiculoDAO extends HibernateUtil implements IBaseDao<Vehiculo, String> {

    @Override
    public void save(Vehiculo o) {
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
    public Vehiculo merge(Vehiculo o) {
        try {
            iniciarOperacion();
            o = (Vehiculo) getSession().merge(o);
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
    public void delete(Vehiculo o) {
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
    public Vehiculo findById(String placa) {
        Vehiculo vehiculo = null;

        try {
            iniciarOperacion();
            vehiculo = (Vehiculo) getSession().get(Vehiculo.class, placa);
        } finally {
            getSession().close();
        }
        return vehiculo;
    }

    @Override
    public List<Vehiculo> findAll() {
        List<Vehiculo> listaVehiculo;
        try {
            iniciarOperacion();//HQL
            listaVehiculo = getSession().createQuery("from Vehiculo").list();
        } finally {
            getSession().close();
        }

        return listaVehiculo;
    }

    @Override
    public List createQueryHQL(String o) {
       List lista = null;
        try {
            iniciarOperacion();
            String sql = "from Vehiculo where Placa like '%%%s%%' ";
            sql = String.format(sql,o);
            lista = getSession().createQuery(sql).list();
        } finally {
            getSession().close();
        }
        return lista;
    }
    

   

}
