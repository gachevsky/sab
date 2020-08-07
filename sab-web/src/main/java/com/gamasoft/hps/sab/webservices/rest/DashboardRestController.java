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

import com.gamasoft.hps.sab.dto.DashboardCompleteDto;
import com.gamasoft.hps.sab.dto.DashboardDto;
import com.gamasoft.hps.sab.dto.UserDto;
import com.gamasoft.hps.sab.service.ServiceManager;

/**
 *
 * @author vascordoba
 */
@Controller
@RequestMapping("/rest/dashboard")
public class DashboardRestController {
    private ServiceManager serviceManager;

    @Autowired
    public DashboardRestController(ServiceManager serviceManager) {
        this.serviceManager = serviceManager;
    }
    
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public @ResponseBody List<DashboardDto> getDashboardsByOwner(HttpSession session) throws Exception {
        UserDto user=(UserDto)session.getAttribute("user");
        return serviceManager.getDashboardService().getDashboards(user.getId());
    }
    
    @RequestMapping(value = {"/"}, method = RequestMethod.POST)
    public void createDashboard(@RequestBody DashboardDto dashboard, HttpSession session, HttpServletResponse response) throws Exception {
        UserDto sessionUser=(UserDto)session.getAttribute("user");
        serviceManager.getDashboardService().create(dashboard,sessionUser.getId());
        
        response.setStatus(HttpStatus.CREATED.value());
    }
    /*
    @RequestMapping(value = "/{dashboardId}", method = RequestMethod.GET)
    public @ResponseBody DashboardCompleteDto getDashboardsById(@PathVariable("dashboardId") long dashboardId, HttpServletRequest request) throws Exception {
    	ApplicationContext ctx= WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
        return serviceManager.getDashboardService().getDashboardById(dashboardId, ctx);
    }
    */
    @RequestMapping(value = "/{dashboardId}", method = RequestMethod.DELETE)
    public void deleteDashboard(@PathVariable("dashboardId") long dashboardId, HttpServletResponse response) throws Exception {
        serviceManager.getDashboardService().delete(dashboardId);
        response.setStatus(HttpStatus.OK.value());
    }
    /**
     * 
     * @param dashboard
     * @param session
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void saveDashboard(@RequestBody DashboardCompleteDto dashboard, HttpSession session, HttpServletResponse response) throws Exception {
        serviceManager.getDashboardService().save(dashboard);
        
        response.setStatus(HttpStatus.CREATED.value());
    }
    
}
