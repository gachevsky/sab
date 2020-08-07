/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.repository;

import com.gamasoft.hps.sab.domain.User;

/**
 * Interface for the user repository.
 *
 * @author vascordoba, gonzalo.zarza
 */
public interface UserRepository extends Repository<User>{

  /**
   * 
   * @param email
   * @return User. One element or null. The email must be unique
   */
  User getUserByEmail(final String email);

  /**
   * 
   * @param username
   * @return User. One element or null. The must should be unique
   */
  User getUserByUsername(final String username);
  
}
