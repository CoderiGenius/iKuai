package iKuai;

import java.util.HashMap;  
import java.util.Map;

import com.alibaba.fastjson.JSON;

import http.HttpClientUtil;
import net.sf.json.JSONObject;

 
//对接口进行测试  
public class AddUser {  
    private static String url = "http://your iKuai url";  
    private static String charset = "utf-8";  
    private static HttpClientUtil httpClientUtil = null;  
    public static final String PUBLICKEY = "your iKuai publicKey";
    public AddUser(){  
    	
        httpClientUtil = new HttpClientUtil();  
    }  
      
    public static String Add(String userName,String passwd,String classNum,String name) throws Exception{  
    	String httpOrgCreateTest = url + "httpOrg/create";  
        Map<String,String> createMap = new HashMap<String,String>();  
        classNum = "IOT17"+classNum;
        createMap.put("state","up");  
        createMap.put("comment",classNum);  
        createMap.put("username",userName);  
        createMap.put("passwd",passwd);  
        createMap.put("date", "2021-10-01");
        createMap.put("ppptype","web");  
        createMap.put("share","2");  
        createMap.put("auto_mac","0");  
        createMap.put("upload","1000");  
        createMap.put("download", "1000");
        createMap.put("ip_addr","");  
        createMap.put("mac", "");
        createMap.put("address","");  
        createMap.put("name",name);  
        createMap.put("phone","");  
        createMap.put("start_date","2017-09-13");  
        createMap.put("cardid", "");
        createMap.put("packages","0");  
        createMap.put("money","00");  

        System.out.println(createMap);
       // String httpOrgCreateTestRtn = httpClientUtil.doPost(httpOrgCreateTest,createMap,charset);
        JSONObject jsonObject = JSONObject.fromObject(createMap);
        
        System.err.println("公钥加密——私钥解密");  
        String source = jsonObject.toString();  
        System.out.println("\r加密前文字：\r\n" + source);  
   
        byte[] data = source.getBytes();  
        byte[] encodedData = RSAUtils.encryptByPublicKey(data, PUBLICKEY);  
        System.out.println(createMap);
        Map<String,String> postMap = new HashMap<String,String>();  
        postMap.put("_R_",Base64Utils.encode(encodedData));
        
        System.out.println("加密后文字：\r\n" + Base64Utils.encode(encodedData));  
        System.out.println(postMap);
      
        //发送
        JSONObject jsonObject2  = JSONObject.fromObject(http.HttpClientUtil.doPost(url,postMap,charset));
        System.out.println(jsonObject2);
        System.out.println(jsonObject2.getString("errno"));
		return jsonObject2.getString("errno");
        
        

        
    }  
      
   
}  
