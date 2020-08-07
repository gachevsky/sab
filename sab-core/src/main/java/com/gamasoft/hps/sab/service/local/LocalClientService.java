/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.service.local;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.gamasoft.hps.sab.domain.Client;
import com.gamasoft.hps.sab.domain.Dashboard;
import com.gamasoft.hps.sab.domain.DashboardWidget;
import com.gamasoft.hps.sab.domain.User;
import com.gamasoft.hps.sab.dto.ClientDto;
import com.gamasoft.hps.sab.dto.DashboardCompleteDto;
import com.gamasoft.hps.sab.dto.DashboardDto;
import com.gamasoft.hps.sab.dto.DashboardWidgetDto;
import com.gamasoft.hps.sab.exception.RepositoryException;
import com.gamasoft.hps.sab.exception.ServiceException;
import com.gamasoft.hps.sab.report.ResultDto;
import com.gamasoft.hps.sab.report.datasource.Datasource;
import com.gamasoft.hps.sab.repository.ClientRepository;
import com.gamasoft.hps.sab.repository.DashboardRepository;
import com.gamasoft.hps.sab.repository.UserRepository;
import com.gamasoft.hps.sab.repository.WidgetRepository;
import com.gamasoft.hps.sab.service.ClientService;
import com.gamasoft.hps.sab.service.DashboardService;

/**
 *
 * @author vascordoba
 */
@Service
public class LocalClientService implements ClientService{

    private static final Logger LOGGER = LoggerFactory.getLogger(LocalClientService.class);
    
    private ClientRepository clientRepository;

    @Autowired
    public LocalClientService(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }
    
    @Override
    public List<ClientDto> getClients() {
        List<Client> clients=clientRepository.getAll();
        if(clients!=null && !clients.isEmpty()){
            List<ClientDto> clientsDto=new ArrayList<ClientDto>();
            for(Client c:clients){
                clientsDto.add(c.toDto());
            }
            return clientsDto;
        }
        return new ArrayList<ClientDto>();
    }

	@Override
	public void add(ClientDto clientDto) {
		Client c = new Client(clientDto);
		
		this.clientRepository.add(c);		
	} 
}
