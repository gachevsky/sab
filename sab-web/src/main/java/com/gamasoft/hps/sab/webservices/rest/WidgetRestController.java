/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.webservices.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.gamasoft.hps.sab.dto.DashboardWidgetRequestDto;
import com.gamasoft.hps.sab.dto.WidgetDto;
import com.gamasoft.hps.sab.report.ResultDto;
import com.gamasoft.hps.sab.service.ServiceManager;


/**
 *
 * @author vascordoba
 */
@Controller
@RequestMapping("/rest/widget/")
public class WidgetRestController {
    private ServiceManager serviceManager;

    @Autowired
    public WidgetRestController(ServiceManager serviceManager) {
        this.serviceManager = serviceManager;
    }
    
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public @ResponseBody List<WidgetDto> getWidgets() throws Exception {
        return serviceManager.getWidgetService().getWidgets();
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public @ResponseBody ResultDto addWidgetToDashboard(@RequestBody DashboardWidgetRequestDto req, HttpServletRequest request) throws Exception {
        ApplicationContext ctx= WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
        return serviceManager.getWidgetService().addWidgetToDashboard(req,ctx);
    }

}
