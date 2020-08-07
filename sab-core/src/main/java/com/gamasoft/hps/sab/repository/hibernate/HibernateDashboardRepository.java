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

import com.gamasoft.hps.sab.domain.Dashboard;
import com.gamasoft.hps.sab.exception.RepositoryException;
import com.gamasoft.hps.sab.repository.DashboardRepository;

/**
 *
 * @author vascordoba
 */
@Repository
public class HibernateDashboardRepository extends HibernateDaoSupport implements DashboardRepository{

    @Autowired
    public HibernateDashboardRepository(SessionFactory sessionFactory) {
        setSessionFactory(sessionFactory);
    }
    
    public void add(Dashboard dashboard) {
        Validate.notNull(dashboard, "The dashboard cannot be null");
        getHibernateTemplate().saveOrUpdate(dashboard);
    }

    public void update(Dashboard dashboard) throws RepositoryException {
        Validate.notNull(dashboard, "The dashboard cannot be null");
        getHibernateTemplate().saveOrUpdate(dashboard);
        getHibernateTemplate().saveOrUpdateAll(dashboard.getDashboardWidgets());
    }

    public void remove(long id) throws RepositoryException {
        Dashboard dashboard=getHibernateTemplate().get(Dashboard.class, id);
        if(dashboard!=null){
            getHibernateTemplate().delete(dashboard);
        }
    }

    public Dashboard getById(long id) {
        return getHibernateTemplate().get(Dashboard.class, id);
    }

    public List<Dashboard> getAll() {
        List<Dashboard> dashboards = getHibernateTemplate().find("from Dashboard d");
        return dashboards;
    }

    public List<Dashboard> getAllByOwner(long userId) {
        List<Dashboard> dashboards = getHibernateTemplate().findByNamedParam("from Dashboard d where d.user.id = :id","id",userId);
        return dashboards;
    }
    
    
}
