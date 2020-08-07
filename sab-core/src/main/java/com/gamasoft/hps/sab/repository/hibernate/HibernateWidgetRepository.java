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

import com.gamasoft.hps.sab.domain.Widget;
import com.gamasoft.hps.sab.exception.RepositoryException;
import com.gamasoft.hps.sab.repository.WidgetRepository;

/**
 *
 * @author vascordoba
 */
@Repository
public class HibernateWidgetRepository extends HibernateDaoSupport implements WidgetRepository{

    @Autowired
    public HibernateWidgetRepository(SessionFactory sessionFactory) {
        setSessionFactory(sessionFactory);
    }
    
    public void add(Widget widget) {
        Validate.notNull(widget, "The widget cannot be null");
        getHibernateTemplate().saveOrUpdate(widget);
    }

    public void update(Widget widget) throws RepositoryException {
        Validate.notNull(widget, "The widget cannot be null");
        getHibernateTemplate().saveOrUpdate(widget);
    }

    public void remove(long id) throws RepositoryException {
        Widget widget=getHibernateTemplate().get(Widget.class, id);
        if(widget!=null){
            getHibernateTemplate().delete(widget);
        }
    }

    public Widget getById(long id) {
        return getHibernateTemplate().get(Widget.class, id);
    }

    public List<Widget> getAll() {
        List<Widget> widgets = getHibernateTemplate().find("from Widget w");
        System.err.println(widgets.get(0));
        return widgets;
    }
    
}
