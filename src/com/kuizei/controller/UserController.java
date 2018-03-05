package com.kuizei.controller;

import com.kuizei.po.TUser;
import com.kuizei.service.UserService;
import com.kuizei.vo.PageVo;
import com.kuizei.vo.UserInfoVO;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;
import com.kuizei.util.FileUpload;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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


    @RequestMapping("/queryUserBP")
    @ResponseBody
    public PageVo<TUser> queryUserByPage(Integer limit,Integer page){
        return userService.queryUserByPage(limit,page);
    }

    @RequestMapping("/queryUserTable")
    @ResponseBody
    public  Map<String,Object> queryUserForBT(Integer limit,Integer page,String uid,String uname){
        return userService.queryUserByPageForBootstrap(limit,page,uid,uname);
    }

    @RequestMapping("/getUserById")
    @ResponseBody
    public UserInfoVO getUserById(String uid){
        return userService.queryUserById(uid);
    }

    @RequestMapping(value = "/uploadHeadImg",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public  Map<String, String> uploadSchemeImg(HttpServletRequest request, MultipartFile pic){
        Map<String, String> map = FileUpload.uploadFile(request, pic, "static/common/ueditor/uploadImg/");
//        if(map.size()>0&&!"error".equals(map.get("message"))){
//            boolean result = courseSellProductService.updateSchemeImg(request,sellId,map.get("serverSavePath")) ;
//            if(result)
//                return map;
//        }
        return map;
    }


}
