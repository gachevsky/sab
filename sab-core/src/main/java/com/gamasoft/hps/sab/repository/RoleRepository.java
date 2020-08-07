/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.repository;

import com.gamasoft.hps.sab.domain.Role;

/**
 *
 * @author vascordoba
 */
public interface RoleRepository extends Repository<Role>{
    Role getRoleByName(final String name) ;
}
