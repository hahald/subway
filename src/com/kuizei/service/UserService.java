package com.kuizei.service;

import com.kuizei.dao.UserDAO;
import com.kuizei.po.TUser;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.Map;

@Service("userService")
@Transactional
public class UserService extends Exception{

    @Resource(name = "userDAO")
    private UserDAO userDAO;

    public Map<String,Object> login(HttpSession session,String uid, String pwd) throws Exception{

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("flag","err");
        if(StringUtils.isEmpty(uid)||uid.trim().equals("")){
            map.put("tip","请填写用户名");
            return map;
        }
        if (StringUtils.isEmpty(pwd)||pwd.trim().equals("")) {
            map.put("tip","密码不能为空哟");
            return map;
        }

        TUser user = null;
        user = userDAO.login(uid,pwd);
        if (user == null) {
            map.put("tip","用户名或密码错误");
            return map;
        }else{
            map.put("flag","yeah");
            user.setPwd("");
            session.setAttribute("userinfo",user);
            return map;
        }
    }


    public Map<String,Object> queryUser(){
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("flag","err");

        return map;
    }

}
