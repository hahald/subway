package com.kuizei.dao;

import com.kuizei.po.TUser;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;

@Component("userDAO")
public class UserDAO extends BaseDAO {
    /*
    * 用户登录
    * */
    public TUser login(String uid, String pwd){
        TUser user = new TUser();
        String hql="from TUser where uid = ? and pwd = ?";
        user = (TUser) this.getByHQL(hql,uid,pwd);
        return user;
    }

    /*
    * 获取某部门下所有人员
    * */
    public List<TUser> getDeptUser(String dept){
        String hql="from TUser where dep = :dept";
        return this.getSession().createQuery(hql).setParameter("dept",dept).list();

    }

    /*
    * 获取所有用户
    * */

    public List<TUser> getAllUser(Integer limit,Integer page){
        String hql;
        hql ="from TUser";
        return this.getSession().createQuery(hql).setFirstResult(limit*(page - 1)).setMaxResults(limit).list();
    }


}
