package com.kuizei.controller;

import com.kuizei.po.TUser;
import com.kuizei.service.UserService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/wao")
@Scope("prototype")
public class UserController {

    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping("/login")
    @ResponseBody
    public Map<String,Object> login(HttpSession session,TUser user) throws Exception{

        try{
            return userService.login(session,user.getUid(),user.getPwd());
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/login2")
    public ModelAndView login2(String username, String password){

        return new ModelAndView("redirect:/jsp/main.jsp");//逻辑视图名       跳转页面默认为转发

    }
}
