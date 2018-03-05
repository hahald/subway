package com.kuizei.util;


import com.kuizei.vo.UserInfoVO;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * \* Created with IntelliJ IDEA.
 * \* Description:
 * \
 */
public class SystemUtil {

    /**
     * 获取当前request
     * @author zhaotao
     * @return
     */
    public static HttpServletRequest getCurrentRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    /**
     * 获取当前登陆用户bean
     * @author zhaotao
     * @return
     */
    public static UserInfoVO getCurrentUsers() {
        return (UserInfoVO) getCurrentRequest().getSession().getAttribute("userinfo");
    }


    /**
     * 生成UUID
     * @author  JHT
     * @return
     */
    public static String uuid(){
        return UUID.randomUUID().toString().replace("-","");
    }


    /**
     * 金额格式化
     * @param d
     * @param style
     * @return
     */
    public static String decimalFormat(double d, String style) {
        String vlaue = "0.00";
        try {
            DecimalFormat format = new DecimalFormat(style);
            vlaue = format.format(d);
        } catch (Exception e) {
        }
        return vlaue;
    }

    /**
     *  得到安全的小数
     * @param param
     * @return
     */
    public static double getSafeNumber(BigDecimal param){
        BigDecimal result = param == null ? new BigDecimal(0.00):param;
        return result.doubleValue();
    }

    /**
     * 根据指定的格式，格式化金额
     * @param d
     * @param style
     * @return
     */
    public static String getNumStr(Double d , String style,boolean isnullzero){

        if( d == null ){
            d = new Double(0.00);
        }

        if(d.doubleValue() == Double.POSITIVE_INFINITY ){
            d = new Double(0.00);
        }

        if(d.doubleValue() == Double.NEGATIVE_INFINITY ){
            d = new Double(0.00);
        }

        if(d.doubleValue() == 0.00){
            if(isnullzero){
                return SystemUtil.decimalFormat(0.0000d, style);
            }else {
                return "";
            }
        }else{
            return SystemUtil.decimalFormat(d, style);
        }
    }


    /**
     * 判断字符串是否为数字
     * @param str
     * @return
     */
    public static boolean isNumeric(String str){
        Pattern pattern = Pattern.compile("-?[0-9]+.?[0-9]+");
        Matcher isNum = pattern.matcher(str);
        if( !isNum.matches() ){
            return false;
        }
        return true;
    }

    /**
     * 判断str1中包含str2的个数
     * @param str1
     * @param str2
     * @return counter
     */
    public static int countStr(String str1, String str2) {
        int counter=0;
        if (str1.indexOf(str2) == -1) {
            return 0;
        }
        while(str1.indexOf(str2)!=-1){
            counter++;
            str1=str1.substring(str1.indexOf(str2)+str2.length());
        }
        return counter;
    }

}
