package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseConn;

public class LoginSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginSer() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		session.setAttribute("error", null);
		String memberID=request.getParameter("memberID");
		String password=request.getParameter("password");
		DatabaseConn conn=new DatabaseConn();
		String sql="select * from members where memberID='"+memberID+"' and password='"+password+"'";
		//System.out.println(sql);
		if(conn.getFreeConnection()){
			if(conn.getStatement()){
				ResultSet rs=conn.getResult(sql);
				try {
					if(rs.next()){
						session.setAttribute("memberID",memberID);
						response.sendRedirect("IndexSer");
					}
					else{
						session.setAttribute("error", "用户名或密码错误！");
						response.sendRedirect("login.jsp");
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					conn.closeResultSet();
					conn.closeStatement();
					conn.closeConnection();
				}
			}
		}		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
