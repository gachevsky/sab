/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.service;

import java.util.List;

import org.springframework.context.ApplicationContext;

import com.gamasoft.hps.sab.dto.ClientDto;
import com.gamasoft.hps.sab.exception.ServiceException;

/**
 *
 * @author vascordoba
 */
public interface ClientService {
    List<ClientDto> getClients();
    void add(ClientDto clientDto);
}
