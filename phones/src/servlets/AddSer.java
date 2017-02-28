package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Orders;
import database.DatabaseConn;

public class AddSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddSer() {
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

		HttpSession session = request.getSession();
		PreparedStatement pstmt=null;
		List<Orders> list = new ArrayList<Orders>();
		String sql;
		if(session.getAttribute("memberID")==null){
			session.setAttribute("error", "您还没有登录，请先登录！");
			response.sendRedirect("login.jsp");
		}else{
			String memberID=(String)session.getAttribute("memberID");
			String phoneID=request.getParameter("phoneID");
			//System.out.println(phoneID);
			int num=1;
			DatabaseConn conn = new DatabaseConn();
			sql="insert into orders (memberID,phoneID,num,done) values (?,?,?,?)";
			//System.out.println(sql);
			if(conn.getFreeConnection()){
			pstmt=conn.getPreparedStatement(sql);
			try {
				pstmt.setString(1,memberID);
				pstmt.setString(2,phoneID);
				pstmt.setInt(3,num);
				pstmt.setString(4,"购物车");
				if(conn.execute(pstmt)){
					session.setAttribute("message","加入购物车成功！");
				    response.sendRedirect("IndexSer");	
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
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
