package com.kuizei.dao;

import com.kuizei.po.TCard;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("cardDAO")
public class CardDAO extends BaseDAO {
    /*
    * 保存卡信息
    */
    public void saveCard(List<TCard> cards){
        for (TCard card:cards){
            saveOrUpdate(card);
        }
    }



    /*
    * 根据卡号获取卡信息
    */
    public TCard getCardInfo(String cardid){

        String hql="from TCard where card_id=:card_id";
        List<TCard> cards = this.getSession().createQuery(hql).setParameter("card_id",cardid).list();

        if (cards.size() > 0){
            return cards.get(0);
        }else{
            return null;
        }

    }
}
