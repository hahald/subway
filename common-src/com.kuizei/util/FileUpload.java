package com.kuizei.util;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by JHT on 2017/5/13.
 */
public class FileUpload {


    /**
     * @author JHT
     * 获取当前的时间信息  年-月-日-时-分-秒-毫秒
     * @return
     */
    protected static String getSystenTime(){
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSS");
        String returnStr = sdf.format(new Date());
        return returnStr;
    }

    /**
     * 上传文件
     * @author JHT
     * @param request
     * @param pic  上传的文件
     * @param savePosition 文件上传所在文件夹
     * @return
     */
    public static Map<String,String> uploadFile(HttpServletRequest request, MultipartFile pic, String savePosition){
        Map<String,String> map = new HashMap<String,String>();
        //  1 上传文件保存路径
        String savePath = request.getServletContext().getRealPath("/") +File.separator+ savePosition;
        //  2 创建分段上传解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getServletContext());
        String bgimgName = null;
        //  3 判断request是否是分段上传请求
        if(multipartResolver.isMultipart(request)){
            try {
                ImageInputStream inputStream = ImageIO.createImageInputStream(pic.getInputStream());
                Iterator<ImageReader> it = ImageIO.getImageReaders(inputStream);
                if(it.hasNext()){
                    bgimgName = pic.getOriginalFilename(); //得到文件名
                    bgimgName = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss_SSS_").format(new Date())+(int)(Math.random()*500)+bgimgName.substring(bgimgName.lastIndexOf("."))   ;
                    File file = new File(savePath + "/" +bgimgName);
                    if(!file.getParentFile().exists()){
                        file.getParentFile().mkdirs();      //上传文件夹不存在则创建
                    }
                    //  4 保存文件
                    pic.transferTo(file);
                    map.put("message","success");
                    map.put("serverSavePath",savePosition+bgimgName);
                }else
                    map.put("message","上传文件非图片");
            } catch (IOException e) {
                map.put("message","上传图片过大");
                e.printStackTrace();
                return map;
            }
        }
        return map;

    }

}
