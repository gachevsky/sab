/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.repository;

import java.util.List;

import com.gamasoft.hps.sab.domain.Dashboard;
/**
 *
 * @author vascordoba
 */
public interface DashboardRepository extends Repository<Dashboard>{
    public List<Dashboard> getAllByOwner(long userId);
}
