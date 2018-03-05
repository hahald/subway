package com.kuizei.util;

import com.kuizei.vo.UserInfoVO;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String url = httpServletRequest.getRequestURI();

//        if(url.indexOf("/open")>=0){
//            return true;
//        }
        System.out.println(url);
        if (url.equals("/open")){return true;}

        System.out.println(url);
        UserInfoVO userInfoVO = (UserInfoVO) httpServletRequest.getSession().getAttribute("userinfo");
        if (userInfoVO == null) {
            System.out.println("尚未登录，调到登录页面");
            httpServletResponse.sendRedirect("/open");
            return false;
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.out.println("afterCompletion");
    }
}
