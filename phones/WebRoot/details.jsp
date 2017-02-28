<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="bean.*" %>
<%
  Phones deta=(Phones)session.getAttribute("deta");
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
     <title>登录</title>
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
  	<section>
       <span style="float:left;"><img src="<%=deta.getImg()%>"></span>
       <div style="margin-left:150px;margin-top:50px;float:left;width:500px;"><h3><%=deta.getPname() %></h3><br>
       价格：&yen;<%=deta.getPrice() %><br><br>参数：<%=deta.getDescrib() %><br><br>
       <form action="AddSer" method="post">
       <input type=hidden value=<%=deta.getPhoneID() %> name="phoneID">
       <input style="width:200px" type="submit" value="加入购物车" class="buy">
       </form>
       </div>
    </section>
  </body>
</html>
