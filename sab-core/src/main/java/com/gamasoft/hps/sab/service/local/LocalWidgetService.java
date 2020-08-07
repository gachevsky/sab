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

import com.gamasoft.hps.sab.domain.Widget;
import com.gamasoft.hps.sab.dto.DashboardWidgetRequestDto;
import com.gamasoft.hps.sab.dto.WidgetDto;
import com.gamasoft.hps.sab.exception.ServiceException;
import com.gamasoft.hps.sab.report.ResultDto;
import com.gamasoft.hps.sab.report.datasource.Datasource;
import com.gamasoft.hps.sab.repository.WidgetRepository;
import com.gamasoft.hps.sab.service.WidgetService;

/**
 *
 * @author vascordoba
 */
@Service
public class LocalWidgetService implements WidgetService{

    private static final Logger LOGGER = LoggerFactory.getLogger(LocalWidgetService.class);
    
    private WidgetRepository widgetRepository;
    

    @Autowired
    public LocalWidgetService(WidgetRepository widgetRepository) {
        this.widgetRepository=widgetRepository;
    }
    
    public List<WidgetDto> getWidgets() throws ServiceException {
        List<Widget> widgets=widgetRepository.getAll();
        List<WidgetDto> dtos=new ArrayList<WidgetDto>();
        if(widgets!=null && !widgets.isEmpty()){
            for(Widget widget:widgets){
                dtos.add(widget.toDto());
            }
        }
        return dtos;
    }

    public ResultDto addWidgetToDashboard(DashboardWidgetRequestDto req, ApplicationContext ctx) throws ServiceException {
        Widget widget=widgetRepository.getById(req.getWidgetId());
        
        ResultDto data=((Datasource)ctx.getBean(widget.getDatasource())).execute(widget, null,ctx);
        data.setId(widget.getId());
        data.setTitle(widget.getTitle());
        data.setType(widget.getType());
        
        data.setX(widget.getDefaultX());
        data.setY(widget.getDefaultY());
        data.setH(widget.getDefaultH());
        data.setW(widget.getDefaultW());
        
        return data;
    }
    
    
    
}
