package com.kuizei.service;

import com.kuizei.dao.ReplenishDAO;
import com.kuizei.po.TCard;
import com.kuizei.po.TReplenish;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("replenishService")
@Transactional
public class ReplenishService {

    @Resource(name = "replenishDAO")
    private ReplenishDAO replenishDAO;

    public String AddReplenish(List<TReplenish> replenishes){

        for (TReplenish replenish:replenishes){
            replenishDAO.save(replenish);
        }

        return "yeah";
    }

    public String CardRegistReplenish(TCard card){
        String now = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
        TReplenish replenish = new TReplenish();

        replenish.setCardId(card.getCardId());
        replenish.setMoney(card.getStored());
        replenish.setOptTime(Timestamp.valueOf(now));
        replenish.setOptType("1");
        replenish.setOptLocation("001");

        replenishDAO.save(replenish);

        return "yeah";
    }

}
