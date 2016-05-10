package com.sdut.edu.cn.Data.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/Data")
public class DataController {
	
	private static final Logger logger=Logger.getLogger(DataController.class);
	
	@RequestMapping("/uploadfile")
	public String uploadfile(){
		
		return "home/data/uploadfile";
	}
	@RequestMapping("/upfile")
	public String upfile(){
		
		return "home/data/upfile";
	}
	@RequestMapping("/aim")
	public String aim(){
		
		return "home/data/aim";
	}
	@RequestMapping("/statistics")
	public String statistics(){
		
		return "home/data/statistics";
	}
	
	@RequestMapping("/temperature")
	public String temperature(Map<String,Object> map){
		
		 Integer[] ad={1,2,33,4,5,6,7,8,9,10,11,15};
		 Map jsonMap = new HashMap();   
		 jsonMap.put("data", ad);
		 jsonMap.put("name", "tengxing");
		
	  //必须是map对象才能转换成json对象  
		// JSONObject json = JSONObject.fromObject(jsonMap);  //必须是map对象才能转换成json对象       键值对
			
			/* logger.info(json);
			 map.put("jsondate", json);
			 map.put("name", "tengxing");*/
		
		return "home/data/temperature";
	}
}
