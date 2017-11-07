/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.proyecto.Dao;

import cr.ac.una.prograiv.proyecto.Domain.Usuario;
import cr.ac.una.prograiv.proyecto.Utils.HibernateUtil;
import java.util.LinkedHashMap;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author Marco Andres
 */
public class UsuarioDAO extends HibernateUtil implements IBaseDao<Usuario, Integer> {

    @Override
    public void save(Usuario o) {
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
    public Usuario merge(Usuario o) {
        try {
            iniciarOperacion();
            o = (Usuario) getSession().merge(o);
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
    public void delete(Usuario o) {
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
    public Usuario findById(Integer id) {
        Usuario usuario = null;

        try {
            iniciarOperacion();
            usuario = (Usuario) getSession().get(Usuario.class, id);
        } finally {
            getSession().close();
        }
        return usuario;
    }

    @Override
    public List<Usuario> findAll() {
        List<Usuario> listaUsuario;
        try {
            iniciarOperacion();//HQL
            listaUsuario = getSession().createQuery("from Usuario").list();
        } finally {
            getSession().close();
        }

        return listaUsuario;
    }

    @Override
    public List createQueryHQL(Integer o) {
        List lista = null;
        try {
            iniciarOperacion();
            String sql = "from Usuario where id like '%%%d%%'";
            sql = String.format(sql,o);
            lista = getSession().createQuery(sql).list();
        } finally {
            getSession().close();
        }
        return lista;
    }

}
