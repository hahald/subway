package com.kuizei.controller;

import com.kuizei.po.TCard;
import com.kuizei.po.TLog;
import com.kuizei.po.TReplenish;
import com.kuizei.po.TUser;
import com.kuizei.service.CardService;
import com.kuizei.service.LogService;
import com.kuizei.service.ReplenishService;
import com.kuizei.vo.CardInfoVO;
import com.kuizei.vo.UserInfoVO;
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
        UserInfoVO userInfoVO = (UserInfoVO) session.getAttribute("userinfo");
        return cardService.addCard(userInfoVO.getUid(),card);
    }

    //卡挂失
    @RequestMapping("/card_loss")
    @ResponseBody
    public Map<String,Object> lossCard(HttpSession session,String cardId,String newid) throws Exception{
        UserInfoVO userInfoVO = (UserInfoVO) session.getAttribute("userinfo");
        return cardService.lossCard(cardId,userInfoVO.getUid(),newid);
    }

    //卡储值
    @RequestMapping("/card_money")
    @ResponseBody
    public Map<String,Object> depositCard(HttpSession session,TReplenish replenish) throws Exception{
        UserInfoVO userInfoVO = (UserInfoVO) session.getAttribute("userinfo");
        return cardService.changeStore(userInfoVO.getUid(),replenish);
    }

    //查询卡信息
    @RequestMapping("/card_find")
    @ResponseBody
    public CardInfoVO queryCardInfo(String cardId) throws Exception{

        return cardService.queryCardInfo(cardId);
    }

}
