package com.kuizei.dao;

import com.kuizei.po.TEvaluate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("evaluateDAO")
public class EvaluateDAO extends BaseDAO{

    /*
    * 查询某用户被评价记录
    * */
    public List<TEvaluate> queryEvaluateByUId(String uid){

        String hql="from TEvaluate where uid = :uid";
        return (List<TEvaluate>) this.getSession().createQuery(hql).setParameter("uid",uid).list();
    }

    public void saveEvaluate(List<TEvaluate> evaluates){
        for (TEvaluate evaluate : evaluates){
            saveOrUpdate(evaluate);
        }
    }

}
