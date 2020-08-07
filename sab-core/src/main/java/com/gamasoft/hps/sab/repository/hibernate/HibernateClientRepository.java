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

import com.gamasoft.hps.sab.domain.Client;
import com.gamasoft.hps.sab.exception.RepositoryException;
import com.gamasoft.hps.sab.repository.ClientRepository;

/**
 *
 * @author vascordoba
 */
@Repository
public class HibernateClientRepository extends HibernateDaoSupport implements ClientRepository {

    @Autowired
    public HibernateClientRepository(SessionFactory sessionFactory) {
        setSessionFactory(sessionFactory);
    }
    
    public void add(Client client) {
        Validate.notNull(client, "The client cannot be null");
        getHibernateTemplate().saveOrUpdate(client);
    }

    public void update(Client client) throws RepositoryException {
        Validate.notNull(client, "The client cannot be null");
        getHibernateTemplate().saveOrUpdate(client);
    }

    public void remove(long id) throws RepositoryException {
        Client client=getHibernateTemplate().get(Client.class, id);
        if(client!=null){
            getHibernateTemplate().delete(client);
        }
    }

    public Client getById(long id) {
        return getHibernateTemplate().get(Client.class, id);
    }

    public List<Client> getAll() {
        List<Client> clients = getHibernateTemplate().find("from Client");
        return clients;
    }
}
