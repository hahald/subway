package com.kuizei.dao;

import com.kuizei.po.TReplenish;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("replenishDAO")
public class ReplenishDAO extends BaseDAO{
    /*
    * 新增保存
    */
    public void saveReplenish(List<TReplenish> replenishes){
        for (TReplenish replenish:replenishes){
            saveOrUpdate(replenish);
        }
    }



}
