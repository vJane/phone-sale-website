package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseConn;

public class RegisterSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegisterSer() {
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
		String password = request.getParameter("password");
		String name=request.getParameter("name");
		String tel =request.getParameter("tel");
		String address=request.getParameter("address");
		if(memberID==null||password==null||memberID.equals("")||password.equals("")){
			session.setAttribute("error", "注册信息不能为空！");
			response.sendRedirect("register.jsp");
		}else{
			String sql="select * from members where memberID='"+memberID+"' ";
			PreparedStatement pstmt=null;
			DatabaseConn conn=new DatabaseConn();
			//System.out.println(sql);
			if(conn.getFreeConnection()){
				if(conn.getStatement()){
					ResultSet rs=conn.getResult(sql);
					try {
						if(rs.next()){
							session.setAttribute("error", "此用户已注册！");
							response.sendRedirect("login.jsp");
						}
						else{
							sql="insert into members values(?,?,?,?,?)";
							pstmt=conn.getPreparedStatement(sql);
							try {
								pstmt.setString(1, memberID);
								pstmt.setString(2, password);
								pstmt.setString(3, name);
								pstmt.setString(4, tel);
								pstmt.setString(5, address);
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							if(conn.execute(pstmt)){
								session.setAttribute("memberID",memberID);
							    response.sendRedirect("IndexSer");	
							}
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally{
						conn.closeResultSet();
						conn.closeStatement();
						conn.closePstmt(pstmt);
						conn.closeConnection();
					}
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
