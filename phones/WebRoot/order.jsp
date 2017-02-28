<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="bean.*" %>
<%if(session.getAttribute("memberID")!=null){
  List<Orders> list =(List)session.getAttribute("orderList");
  int len;
   if(session.getAttribute("memberID")==null){
    len=3;
  }else{
    len=0;
  }
 %>
<!DOCTYPE HTML >
<html>
  <head>
    <title>我的订单</title>
    <link href="css/phone.css" rel="stylesheet">
    <meta name="author" content="数信科技1304 张雅娟  0961130428">
  </head>
  
  <body>
  <header>
    <%if(len==3){ %>
  		 <span style="margin-left:70%; line-height:30px;">您好！游客，请<a href="login.jsp" class="header">登录</a> </span>
  	<%}else{ 
         String memberID=session.getAttribute("memberID").toString();
  	%>
  	     <span style="margin-left:70%; line-height:30px;">您好！<%=memberID %>&nbsp;&nbsp;<a href="LogoutSer" class="header">退出登录</a></span> 
  	<%} %>	 
  	</header>
  	<nav>
  	    <div class="logo"><img src="images/logo.png"></div>
  		<ul class="navm">
  			<li>
  				<a href="IndexSer">首页</a>
  			</li>
  			<li>
  				<a href="CartSer">我的购物车</a>
  			</li>
  			<li>
  				<a href="OrderSer">我的订单</a>
  			</li>
  			<li>
  				<a href="register.jsp">注册新用户</a>
  			</li>
  		</ul>
  		<div class="search">
	  		<form action="SearchSer" method="post">
	  			<input type="text" name="key">
	  			<input type="submit" value="搜索">
	  		</form>
  		</form>
  	</nav>
  	<h3><%=session.getAttribute("memberID").toString() %>的订单：</h3><br>
   
    <table style="width:80%;text-align:center;line-height:30px; margin-left:auto;margin-right:auto;">
     <tr><th>订单号</th><th></th><th>手机型号</th><th>数量</th><th>总价</th><th>订单状态</th></tr>
    <%for(int i=0;i<list.size();i++){
      double sum=list.get(i).getNum()*list.get(i).getPrice();
     %>
   
     <tr><td><%=list.get(i).getOrderID() %></td>
     <td><img src="<%=list.get(i).getImg()%>" width="20"></td>
     <td><%=list.get(i).getPhoneID() %></td>
     <td><%=list.get(i).getNum() %></td>
     <td><%=sum %></td>
     <td><%=list.get(i).getDone() %></td>
     
     </tr>
    <%} %>
    </table>  
    
  </body>
</html>
<%}%>