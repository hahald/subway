package com.kuizei.controller;

import com.kuizei.po.TSellTicket;
import com.kuizei.service.TicketService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping("/wao")
@Scope("prototype")
public class SellTicketController {

    @Resource(name = "ticketService")
    private TicketService ticketService;

    @RequestMapping("/sellTicket")
    @ResponseBody
    public Map<String,Object> sellTicket(TSellTicket sellTicket){
        return ticketService.sellTicket(sellTicket);
    }

    @RequestMapping("/meltTicket")
    @ResponseBody
    public Map<String,Object> meltTicket(String uuid){
        return ticketService.meltTicket(uuid);
    }

    @RequestMapping("/getTicket")
    @ResponseBody
    public TSellTicket getTicket(String uuid){
        return ticketService.getSellTicket(uuid);
    }

}
