/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.webservices.rest;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamasoft.hps.sab.dto.ClientDto;
import com.gamasoft.hps.sab.service.ServiceManager;

/**
 *
 * @author vascordoba
 */
@Controller
@RequestMapping("/rest/client")
public class ClientRestController {
    private ServiceManager serviceManager;

    @Autowired
    public ClientRestController(ServiceManager serviceManager) {
        this.serviceManager = serviceManager;
    }
    
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public @ResponseBody List<ClientDto> getClients() throws Exception {
        return serviceManager.getClientService().getClients();
    }
    
    @RequestMapping(value = {"/"}, method = RequestMethod.POST)
    public void createClient(@RequestBody ClientDto client, HttpSession session, HttpServletResponse response) throws Exception {
        serviceManager.getClientService().add(client);
        
        response.setStatus(HttpStatus.CREATED.value());
    }
    
    @RequestMapping(value = "/{clientId}", method = RequestMethod.DELETE)
    public void deleteClient(@PathVariable("clientId") long clientId, HttpServletResponse response) throws Exception {
        //serviceManager.getClientService().
        response.setStatus(HttpStatus.OK.value());
    }
    
    /**
     * 
     * @param dashboard
     * @param session
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateClient(@RequestBody ClientDto dashboard, HttpSession session, HttpServletResponse response) throws Exception {
        //serviceManager.getDashboardService().usave(dashboard);
        
        response.setStatus(HttpStatus.CREATED.value());
    }
    
}
