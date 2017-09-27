package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import iKuai.AddUser;

/**
 * Servlet implementation class ReceiveServlet
 */
@WebServlet("/ReceiveServlet")
public class ReceiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	request.setAttribute("alert", "404");
		request.getRequestDispatcher("../index.jsp").forward(request, response);
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request==null){
			request.setAttribute("alert", "404");
			request.getRequestDispatcher("../index.jsp").forward(request, response);
		}
		else{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String phoneNum = request.getParameter("phoneNum");
		String ID = request.getParameter("ID");
		//身份验证
		String matchedName = database.MatchID.Match(ID, username);
		if(matchedName!=null)
		{
			// 密码对应判断
			if (password1.equals(password2)) {
				// 密码对应成功，执行添加用户
				try {
					// 判断班级
					String classNum = regex.RegexClass.classNum(username);
					if (classNum == null) {
						System.out.println(classNum);
						//response.getWriter().print("<script> alert(\"%e8%af%b7%e4%b8%8d%e8%a6%81%e4%b9%b1%e8%be%93%e7%94%a8%e6%88%b7%e5%90%8d%ef%bc%81%e8%b4%a6%e5%8f%b7%e6%b3%a8%e5%86%8c%e4%bb%85%e4%be%9b17%e7%ba%a7%e6%96%b0%e7%94%9f%e4%bd%bf%e7%94%a8%ef%bc%81\"); </script>");
						request.setAttribute("alert", "非法的学号！");
						request.getRequestDispatcher("../index.jsp").forward(request, response);
					} else {
						String status = AddUser.Add(username, password1, classNum,matchedName);
						if (status.equals("0")) {
							System.out.println("add success!");
							//response.getWriter().print("<script> alert(\"提交注册信息成功！请等待通知短信！\"); </script>");
							request.setAttribute("alert", "提交注册信息成功！请等待通知短信。");
							request.getRequestDispatcher("../index.jsp").forward(request, response);
							//发送短信
							sendMessage.Send.startSending(matchedName, phoneNum);
						}
						else{
							request.setAttribute("alert", "用户已存在");
							request.getRequestDispatcher("../index.jsp").forward(request, response);
						}
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} 
		}
		else 
		{
			request.setAttribute("alert", "身份核验不通过！");
			request.getRequestDispatcher("../index.jsp").forward(request, response);
		}
	
	
		
	}
	}
}
