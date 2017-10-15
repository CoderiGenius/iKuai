import java.util.Date;

import database.RedisUtil;
import database.addUser;
import redis.clients.jedis.Jedis;

public class mainTest {
public static void main(String args[])
{
	/*String userName = "232";
	String passwd = "23";
	System.out.println(database.MatchID.Match("37232119980129581X", "1708070107"));*/
	
	//database.RedisMatch.testRedisPool();
	
	//sendMessage.Send.startSending("周思成", "17305426716");
	
	/*try {
		String host = "r-2ze9f4b801dd75e4.redis.rds.aliyuncs.com";//控制台显示访问地址
		int port = 6379;
		Jedis jedis = new Jedis(host, port);
		//鉴权信息
		jedis.auth("redisZxc36");//password
		String key = "redis";
		String value = "aliyun-redis";
		//select db默认为0
		jedis.select(1);
		//set一个key
		jedis.set(key, value);
		System.out.println("Set Key " + key + " Value: " + value);
		//get 设置进去的key
		String getvalue = jedis.get(key);
		System.out.println("Get Key " + key + " ReturnValue: " + getvalue);
		jedis.quit();
		//jedis.close();
		} catch (Exception e) {
		e.printStackTrace();
		}*/
	addUser.Add("371002199809071558","123");
	 
}
}