package regex;

public class RegexClass {
public static String classNum(String username){
	String reg = "1708070[12][0123][1234567890]";
	boolean con = username.matches(reg);
	String classNum = null;
	if(con==true){
		classNum = username.substring(7,8);
	}
	
	return classNum;
	
}
}
