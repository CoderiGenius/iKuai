package sendMessage;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

public class Send{
public static String startSending(String username,String phoneNum) {
	    String host = "http://sms.market.alicloudapi.com";
	    String path = "/singleSendSms";
	    String method = "GET";
	    String appcode = "your aliyun appCode";
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    String paramString = "{\"name\":\""+username+"\"}";
	    querys.put("ParamString", paramString);
	    querys.put("RecNum", phoneNum);
	   querys.put("SignName", "物联网实验室");
	    querys.put("TemplateCode", "your smsCode");
	    String fedBack = null;
	    System.out.println(paramString);
	    try {
	    	/**
	    	* 重要提示如下:
	    	* HttpUtils请从
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
	    	* 下载
	    	*
	    	* 相应的依赖请参照
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
	    	*/
	    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
	    	System.out.println(response.toString());
	    	//获取response的body
	    	System.out.println(EntityUtils.toString(response.getEntity()));
	    	fedBack = EntityUtils.toString(response.getEntity());
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
		return fedBack;
	}
}
