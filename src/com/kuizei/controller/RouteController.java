package com.kuizei.controller;

import com.kuizei.po.TRoute;
import com.kuizei.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@Scope("prototype")
@RequestMapping("/wao")
public class RouteController {

    @Autowired
    private RouteService routeService;

    @RequestMapping("/getAllRoute")
    @ResponseBody
    public List<TRoute> getAllRoute(){
        return routeService.getAllRoute();
    }


}
