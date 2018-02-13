package com.kuizei.controller;

import com.kuizei.po.TCard;
import com.kuizei.po.TLog;
import com.kuizei.po.TReplenish;
import com.kuizei.po.TUser;
import com.kuizei.service.CardService;
import com.kuizei.service.LogService;
import com.kuizei.service.ReplenishService;
import com.kuizei.vo.CardInfoVO;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Scope("prototype")
@RequestMapping("/wao")
public class CardController {

    @Resource(name = "cardService")
    private CardService cardService;


    @RequestMapping("/card_add")
    @ResponseBody
    public Map<String,Object> addCard(HttpSession session,TCard card) throws Exception{
        TUser user = (TUser) session.getAttribute("userinfo");
        Map<String,Object> map = new HashMap<String,Object>();
        if(user == null){
            map.put("flag","login");
            map.put("message","请登陆后再使用");
            return map;
        }

        return cardService.addCard(user.getUid(),card);
    }

    //卡挂失
    @RequestMapping("/card_loss")
    @ResponseBody
    public Map<String,Object> lossCard(HttpSession session,String cid) throws Exception{
        TUser user = (TUser) session.getAttribute("userinfo");
        Map<String,Object> map = new HashMap<String,Object>();
        if(user == null){
            map.put("flag","login");
            map.put("message","请登陆后再使用");
            return map;
        }

        map = cardService.lossCard(cid,user.getUid());

        return map;
    }

    //卡储值
    @RequestMapping("/card_money")
    @ResponseBody
    public Map<String,Object> depositCard(HttpSession session,TReplenish replenish) throws Exception{
        TUser user = (TUser) session.getAttribute("userinfo");
        Map<String,Object> map = new HashMap<String,Object>();
        if(user == null){
            map.put("flag","login");
            map.put("message","请登陆后再使用");
            return map;
        }

        return cardService.changeStore(user.getUid(),replenish);
    }

    //查询卡信息
    @RequestMapping("/card_find")
    @ResponseBody
    public CardInfoVO queryCardInfo(String cid) throws Exception{

        return cardService.queryCardInfo(cid);
    }

}
