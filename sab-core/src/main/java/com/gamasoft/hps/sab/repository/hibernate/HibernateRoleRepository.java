/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.repository.hibernate;

import java.util.List;

import org.apache.commons.lang.Validate;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.gamasoft.hps.sab.domain.Role;
import com.gamasoft.hps.sab.exception.RepositoryException;
import com.gamasoft.hps.sab.repository.RoleRepository;
/**
 *
 * @author vascordoba
 */
@Repository
public class HibernateRoleRepository extends HibernateDaoSupport implements RoleRepository{

    @Autowired
    public HibernateRoleRepository(SessionFactory sessionFactory){
        setSessionFactory(sessionFactory);
    }
    
    public Role getRoleByName(String name) {
        List<Role> roles = getHibernateTemplate().find("from Role r where r.name = ?", name);
        if (roles.isEmpty()) {
            return null;
        } else {
            return roles.get(0);
        }
    }

    public void add(Role role) {
        Validate.notNull(role, "The role cannot be null");
        getHibernateTemplate().saveOrUpdate(role);
    }

    public void update(Role role) throws RepositoryException {
        Validate.notNull(role, "The role cannot be null");
        getHibernateTemplate().saveOrUpdate(role);
    }

    public void remove(long id) throws RepositoryException {
        Role role=getHibernateTemplate().get(Role.class, id);
        if(role!=null){
            getHibernateTemplate().delete(role);
        }
    }

    public Role getById(long id) {
        return getHibernateTemplate().get(Role.class, id);
    }

    public List<Role> getAll() {
        return getHibernateTemplate().find("from Role r");
    }
}
