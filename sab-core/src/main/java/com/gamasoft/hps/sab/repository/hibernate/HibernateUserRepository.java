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

import com.gamasoft.hps.sab.domain.User;
import com.gamasoft.hps.sab.exception.RepositoryException;
import com.gamasoft.hps.sab.repository.UserRepository;

/**
 *
 * @author vascordoba
 */
@Repository
public class HibernateUserRepository extends HibernateDaoSupport implements UserRepository {

    @Autowired
    public HibernateUserRepository(SessionFactory sessionFactory) {
        setSessionFactory(sessionFactory);
    }

    public User getUserByEmail(String email) {
        List<User> users = getHibernateTemplate().find("from User u where u.email = ?", email);
        if (users.isEmpty()) {
            return null;
        } else {
            return users.get(0);
        }
    }

    public User getUserByUsername(String username) {
        List<User> users = getHibernateTemplate().find("from User u where u.username = ?", username);
        if (users.isEmpty()) {
            return null;
        } else {
            return users.get(0);
        }
    }

    public void add(User user) {
        Validate.notNull(user, "The user cannot be null");
        getHibernateTemplate().saveOrUpdate(user);
    }

    public void update(User user) throws RepositoryException {
        Validate.notNull(user, "The user cannot be null");
        getHibernateTemplate().saveOrUpdate(user);
    }

    public void remove(long id) throws RepositoryException {
        User user=getHibernateTemplate().get(User.class, id);
        if(user!=null){
            getHibernateTemplate().delete(user);
        }
    }

    public User getById(long id) {
        return getHibernateTemplate().get(User.class, id);
    }

    public List<User> getAll() {
        List<User> users = getHibernateTemplate().find("from User u");
        return users;
    }
}
