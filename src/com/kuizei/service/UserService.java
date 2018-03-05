package com.kuizei.service;

import com.kuizei.dao.UserDAO;
import com.kuizei.po.TUser;
import com.kuizei.vo.PageVo;
import com.kuizei.vo.UserInfoVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
        UserInfoVO userInfoVO = new UserInfoVO();
        user = userDAO.login(uid,pwd);
        if (user == null) {
            map.put("tip","用户名或密码错误");
            return map;
        }else{
            BeanUtils.copyProperties(user,userInfoVO);
            map.put("flag","yeah");
            map.put("role",userInfoVO.getRole());
            session.setAttribute("userinfo",userInfoVO);
            return map;
        }
    }


    public UserInfoVO queryUserById(String uid){
        UserInfoVO userInfoVO = new UserInfoVO();
        TUser user = userDAO.getUserById(uid);
        if(user == null){
            userInfoVO.setUid("none");
        }else{
            BeanUtils.copyProperties(user,userInfoVO);
        }

        return userInfoVO;
    }

    /*
    * 分页 获取用户
    */
    public PageVo<TUser> queryUserByPage(Integer limit,Integer page){
        PageVo<TUser> userPageVo = new PageVo<TUser>();
        userPageVo.setMsg("yeah");
        try{

            List<TUser> users = userDAO.getAllUser(limit,page);
            int userCount = userDAO.getCount();

            userPageVo.setCount(userCount);
            userPageVo.setData(users);
        }catch (Exception e){
            e.printStackTrace();
            userPageVo.setMsg("err");
        }

        return userPageVo;
    }

    /*
     * 分页 获取用户 bootstrap
     */
    public Map<String,Object> queryUserByPageForBootstrap(Integer limit,Integer page,String uid,String uname){

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("flag","yeah");
        try{

            List<TUser> users = userDAO.getAllUser(limit,page,uid,uname);
            int userCount = userDAO.getCount();

            if(users.size() > 0){
                List<UserInfoVO> userInfoVOS = new ArrayList<UserInfoVO>();
                for (TUser u:users){
                    UserInfoVO userInfo = new UserInfoVO();
                    BeanUtils.copyProperties(u,userInfo);
                    userInfoVOS.add(userInfo);
                }
                map.put("total",userCount);
                map.put("rows",userInfoVOS);
            }else{
                map.put("flag","none");
            }

        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","err");
        }

        return map;
    }
}
