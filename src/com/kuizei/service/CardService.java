package com.kuizei.service;

import com.kuizei.dao.CardDAO;
import com.kuizei.po.TCard;
import com.kuizei.po.TLog;
import com.kuizei.po.TReplenish;
import com.kuizei.util.BeanUtil;
import com.kuizei.vo.CardInfoVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.apache.commons.lang3.StringUtils.left;
import static org.apache.commons.lang3.StringUtils.right;
import static org.apache.commons.lang3.StringUtils.trim;


@Service("cardService")
@Transactional
public class CardService extends Exception  {

    @Resource(name = "cardDAO")
    private CardDAO cardDAO;

    @Resource(name = "logService")
    private LogService logService;

    @Resource(name = "replenishService")
    private ReplenishService replenishService;

    /*
    * 注册卡
    * */
    public Map<String,Object> addCard(String uid,TCard card) throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("flag","err");
        String now = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
        TCard card1=cardDAO.getCardInfo(card.getCardId());
        if (card1!=null){
            map.put("message","卡号已存在");
            return map;
        }

        card.setInitTime(Timestamp.valueOf(now));
        card.setStatus("1");
        cardDAO.saveOrUpdate(card);

        String flag = replenishService.CardRegistReplenish(card);
        if (!flag.equals("yeah")){
            map.put("message",flag);
            return map;
        }

        //存储操作日志
        String now2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
        TLog log = new TLog();
        log.setOptId(card.getCardId());
        log.setOptLocation("001");
        log.setOptType("4");
        log.setUid(uid);
        log.setOptTime(Timestamp.valueOf(now2));
        logService.addLog(log);

        map.put("flag","yeah");
        return map;
    }


    /*
    * 修改储值
    */
    public Map<String,Object> changeStore(String uid,TReplenish replenish) throws Exception{

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("flag","err");
        TCard card1=cardDAO.getCardInfo(replenish.getCardId());
        if (card1==null){
            map.put("message","卡号不存在");
            return map;
        }

        if(card1.getStatus().equals("2")){
            map.put("message","卡已作废，不能更改储值额");
            return map;
        }

        BigDecimal store = card1.getStored();
        if ((store.add(replenish.getMoney())).compareTo(BigDecimal.valueOf(0)) == -1){
            map.put("message","余额不满足当前操作");
            return map;
        }

        card1.setStored(store.add(replenish.getMoney()));
        cardDAO.saveOrUpdate(card1);

        String now = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
        replenish.setOptTime(Timestamp.valueOf(now));
        replenish.setOptType("1");
        replenish.setOptLocation("001");
        List<TReplenish> tReplenishes = new ArrayList<TReplenish>();
        tReplenishes.add(replenish);
        replenishService.AddReplenish(tReplenishes);

        //存储操作日志
        String now2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
        TLog log = new TLog();
        log.setOptId(String.valueOf(tReplenishes.get(0).getId()));
        log.setOptLocation("001");
        log.setOptType("4");
        log.setUid(uid);
        log.setOptTime(Timestamp.valueOf(now2));
        logService.addLog(log);

        map.put("flag","yeah");
        return map;
    }

    /*
    * 挂失
    */
    public Map<String,Object> lossCard(String cardid,String uid,String newid) throws Exception{

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("flag","err");
        TCard card_new = cardDAO.getCardInfo(newid);
        if (card_new != null){
            map.put("message","新卡号已占用，请确认后重试");
            return map;
        }
        TCard card1=cardDAO.getCardInfo(cardid);
        if (card1==null){
            map.put("message","卡号不存在");
            return map;
        }

        //作废老卡
        card1.setStatus("2");
        cardDAO.saveOrUpdate(card1);

        //生成新卡信息
//        BeanUtils.copyProperties(card1,card_new,new String[]{"identity","tel","stroed","cname","deposit"});
        card_new = new TCard();
        card_new.setCardId(newid);
        card_new.setTel(card1.getTel());
        card_new.setIdentity(card1.getIdentity());
        card_new.setStatus("1");
        card_new.setStored(card1.getStored());
        card_new.setCname(card1.getCname());
        card_new.setDeposit(card1.getDeposit());
        card_new.setInitTime(Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())));
        cardDAO.save(card_new);

        //存储操作日志
        TLog log = new TLog();
        log.setOptId(String.valueOf(card1.getId()));
        log.setOptLocation("001");
        log.setOptType("4");
        log.setUid(uid);
        log.setOptTime(Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())));
        logService.addLog(log);

        map.put("flag","yeah");
        return map;
    }

    /*
    * 查询卡信息
    */
    public CardInfoVO queryCardInfo(String cid){
        TCard card = cardDAO.getCardInfo(cid);
        CardInfoVO cardInfoVO = new CardInfoVO();
        if (card !=null){
            if (card.getStatus().equals("1")){
                card.setIdentity(left(card.getIdentity(),3)+"****"+right(card.getIdentity(),4));
                card.setTel(left(card.getTel(),3)+"****"+right(card.getTel(),4));
                BeanUtils.copyProperties(card,cardInfoVO);
                cardInfoVO.setRemark("yeah");
            }else {
                cardInfoVO.setRemark("此卡已挂失，不可用，请确认后重试");
            }

        }else{
            cardInfoVO.setRemark("卡号不存在");
        }
        return cardInfoVO;
    }

}
