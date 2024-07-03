package com.hanul.iot;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;

@Controller
public class DataController {
    private String key = "7161506c417175643131346542744e6b"; 
    @Autowired private CommonService common;
    
    @RequestMapping("/list.da")
    public String data(HttpSession session) {
        session.setAttribute("category", "da");
        
        return "data/list";
    }
    
    // 약국 정보 조회 요청
    @ResponseBody @RequestMapping(value="/data/pharmacy", produces="application/json; charset=utf-8")
    public String pharmacy_list(int pageNo, int rows) {
        StringBuilder url = new StringBuilder("http://openapi.seoul.go.kr:8088/");
        url.append(key);
        url.append("/json/tbVEnterprise/");
        url.append(pageNo + "/");
        url.append(rows + "/");
        
        return common.json_list(url);
    }
}
