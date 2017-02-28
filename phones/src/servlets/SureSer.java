package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseConn;

public class SureSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SureSer() {
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
		request.setCharacterEncoding("utf-8");
		String orderID=request.getParameter("orderID");
		int chnum=Integer.parseInt(request.getParameter("chnum"));
		String sql="update orders set done='已提交订单',num="+chnum+" where orderID='"+orderID+"'";
		//System.out.println(sql);
		DatabaseConn conn=new DatabaseConn();
		try{
			if(conn.getFreeConnection()){
			if(conn.getStatement()){
				int row=conn.getUpdate(sql);
				if(row>0){
					session.setAttribute("message1","订单已提交！");
				    response.sendRedirect("CartSer");	
				}
			}
		}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			conn.closeResultSet();
			conn.closeStatement();
			conn.closeConnection();
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
