/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.repository;

import java.util.List;

import com.gamasoft.hps.sab.domain.Client;
/**
 *
 * @author vascordoba
 */
public interface ClientRepository extends Repository<Client>{
    public List<Client> getAll();
}
