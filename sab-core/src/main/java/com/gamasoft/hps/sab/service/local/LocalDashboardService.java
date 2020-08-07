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

import com.gamasoft.hps.sab.domain.Dashboard;
import com.gamasoft.hps.sab.domain.DashboardWidget;
import com.gamasoft.hps.sab.domain.User;
import com.gamasoft.hps.sab.dto.DashboardCompleteDto;
import com.gamasoft.hps.sab.dto.DashboardDto;
import com.gamasoft.hps.sab.dto.DashboardWidgetDto;
import com.gamasoft.hps.sab.exception.RepositoryException;
import com.gamasoft.hps.sab.exception.ServiceException;
import com.gamasoft.hps.sab.report.ResultDto;
import com.gamasoft.hps.sab.report.datasource.Datasource;
import com.gamasoft.hps.sab.repository.DashboardRepository;
import com.gamasoft.hps.sab.repository.UserRepository;
import com.gamasoft.hps.sab.repository.WidgetRepository;
import com.gamasoft.hps.sab.service.DashboardService;

/**
 *
 * @author vascordoba
 */
@Service
public class LocalDashboardService implements DashboardService{

    private static final Logger LOGGER = LoggerFactory.getLogger(LocalDashboardService.class);
    
    private DashboardRepository dashboardRepository;
    private UserRepository userRepository;
    private WidgetRepository widgetRepository;

    @Autowired
    public LocalDashboardService(DashboardRepository dashboardRepository, UserRepository userRepository, WidgetRepository widgetRepository) {
        this.dashboardRepository = dashboardRepository;
        this.userRepository = userRepository;
        this.widgetRepository = widgetRepository;
    }
    
    @Override
    public List<DashboardDto> getDashboards(long userId) {
        List<Dashboard> results=dashboardRepository.getAllByOwner(userId);
        if(results!=null && !results.isEmpty()){
            List<DashboardDto> resultsDto=new ArrayList<DashboardDto>();
            for(Dashboard d:results){
                resultsDto.add(d.toDto());
            }
            return resultsDto;
        }
        return new ArrayList<DashboardDto>();
    }

    @Override
    public void create(DashboardDto dashbaord, long userId) {
        Dashboard d=new Dashboard(dashbaord);
        d.setUser(userRepository.getById(userId));
        dashboardRepository.add(d);
    }

    public DashboardCompleteDto getDashboardById(long dashboardId, ApplicationContext ctx) {
        Dashboard d=dashboardRepository.getById(dashboardId);
        DashboardCompleteDto dto  = new DashboardCompleteDto(d.toDto());
        
        List<DashboardWidgetDto> dws = new ArrayList<DashboardWidgetDto>();
        
        for(DashboardWidget dw : d.getDashboardWidgets()){
        	DashboardWidgetDto dwDto = dw.toDto();
        	
        	ResultDto data=((Datasource) ctx.getBean(dw.getWidget().getDatasource())).execute(dw.getWidget(), null,ctx);
        	data.setId(dw.getWidget().getId());
        	data.setTitle(dw.getWidget().getTitle());
        	data.setType(dw.getWidget().getType());
        	
        	dwDto.setResult(data);
        	dws.add(dwDto);
        }
        
        dto.setDashboardWidgets(dws);
        
        return dto;
    }

    public void delete(long dashboardId) throws ServiceException{
        try {
            dashboardRepository.remove(dashboardId);
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }

	@Override
	public void save(DashboardCompleteDto dashboard) throws ServiceException {
		try {
			Dashboard d=dashboardRepository.getById(dashboard.getId());
			d.setDescription(dashboard.getDescription());
			d.setName(dashboard.getName());
			d.setLoadedByDefault(dashboard.getLoadedByDefault());
			
			if(dashboard.getDashboardWidgets() != null){
				d.getDashboardWidgets().clear();
				
				for(DashboardWidgetDto dt : dashboard.getDashboardWidgets()){
					DashboardWidget dw = new DashboardWidget(dt);
					
					dw.setWidget(widgetRepository.getById(dt.getWidget().getId()));
					dw.setDashboard(d);
					
					d.getDashboardWidgets().add(dw);
				}
			}
			
			//If current dashboard is supposed to be the default, disable others
			if(dashboard.getLoadedByDefault()){
				setDefaultDashboard(d.getUser().getId());
			}
			
			dashboardRepository.update(d);
		} catch (Exception e) {
			throw new ServiceException(e.getMessage());
		}
		
	}
	
	private void setDefaultDashboard(Long userId) throws RepositoryException{
		
		
	}
    
}
