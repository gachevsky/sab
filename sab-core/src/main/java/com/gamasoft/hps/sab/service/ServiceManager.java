/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
/**
 *
 * @author vascordoba
 */
@Service
public class ServiceManager {
    @Autowired
    private SecurityService securityService;
    @Autowired
    private DashboardService dashboardService;
    @Autowired
    private WidgetService widgetService;
    @Autowired
    private ClientService clientService;
    

    public ClientService getClientService() {
		return clientService;
	}

	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	public ServiceManager() {
    }

    public SecurityService getSecurityService() {
        return securityService;
    }

    public void setSecurityService(SecurityService securityService) {
        this.securityService = securityService;
    }

    public DashboardService getDashboardService() {
        return dashboardService;
    }

    public void setDashboardService(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
    }

    public WidgetService getWidgetService() {
        return widgetService;
    }

    public void setWidgetService(WidgetService widgetService) {
        this.widgetService = widgetService;
    }
}
