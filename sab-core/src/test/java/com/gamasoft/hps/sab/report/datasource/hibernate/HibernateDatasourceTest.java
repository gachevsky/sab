/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.report.datasource.hibernate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gamasoft.hps.sab.domain.Widget;
import com.gamasoft.hps.sab.report.FilterValueDto;
import com.gamasoft.hps.sab.report.Types;
import com.gamasoft.hps.sab.repository.WidgetRepository;

/**
 *
 * @author vascordoba
 */
@ContextConfiguration(locations = { "classpath:spring/sab-main-ctx.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class HibernateDatasourceTest {
    
    @Autowired
    private HibernateDatasource dataSource;
    
    @Autowired
    private WidgetRepository widgetRepository;
    
    private Widget widget;
    private List<FilterValueDto> filters;
    
    public HibernateDatasourceTest() {
    }
    
    @Before
    public void setUp() {
        widget = widgetRepository.getById(1L);
        filters=new ArrayList<FilterValueDto>();
        filters.add(new FilterValueDto("DATE", Types.DATE, 1, Arrays.asList("2012-08-07","2012-08-12")));
        filters.add(new FilterValueDto("REGION", Types.INT, 2, Arrays.asList("1","2","3")));
    }
    
    @Test
    @Ignore
    public void test() {
        
    }
}