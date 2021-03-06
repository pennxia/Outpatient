package com.controller;

import com.biz.SJ_waitBiz;
import com.biz.TX_waitBiz;
import com.entity.SJ_wait;
import com.entity.TX_wait;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

@Controller
public class TX_waitController {

    @Autowired
    TX_waitBiz tx_waitBiz;



    @ResponseBody
    @RequestMapping("queryMap-tx_wait")
    public Map<String,Object> queryMap(HttpServletRequest request){
        String search = request.getParameter("search");
        String page = request.getParameter("page");
        String count = request.getParameter("count");
        String sql = "";
        int begin = 0;
        int end = 5;
        if(page != null && page != ""){
            begin = (Integer.parseInt(page)-1)*end;
        }
        if(search != null && search != ""){
            sql = search;
        }
        if(count != null && count!= ""){
            end = Integer.parseInt(count);
        }
        Map<String,Object> map = tx_waitBiz.queryMap(sql,begin, end);

        return map;
    }

    @ResponseBody
    @RequestMapping("queryById-tx_wait")
    public TX_wait queryById(HttpServletRequest request){
        TX_wait tx_wait = tx_waitBiz.queryById(Integer.parseInt(request.getParameter("id")));
        return tx_wait;
    }

    @ResponseBody
    @RequestMapping("updateTx_wait")
    public String update(HttpServletRequest request) throws IOException {
        //      候诊ID
        int waitId = Integer.parseInt(request.getParameter("waitId"));
//      选择调整的等级
        String level = request.getParameter("level");
        String result = "";
//        根据得到 id 调整队列,设置优先级
        TX_wait tx_wait = tx_waitBiz.queryById(waitId);
        tx_wait.setLevel(level);
        boolean update = tx_waitBiz.update(tx_wait);
        if(update) {
            result = "success";
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("deleteTx_wait")
    public String delete(HttpServletRequest request) throws IOException {
        String result = "";
        boolean delete = tx_waitBiz.delete(Integer.parseInt(request.getParameter("id")));
        if(delete) {
            result = "success";
        }
        return result;
    }

}