<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
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
    <div class="login">
    <form action="LoginSer" method="post">
    <table style="margin-left:auto;margin-right:auto;margin-top:100px;line-height:30px;">
        <tr><th colspan="2" style="text-align:center">登录</th></tr>
        <tr><td>账号：</td><td><input type="text" name="memberID"></td></tr>
        <tr><td>密码：</td><td><input type="password" name="password"></td></tr>
        <tr><td colspan="2" style="text-align:center"><input type="submit" value="登录" class="buy">
        <a href="register.jsp" class="delete">注册</a></td></tr>
      </table>
    </form>
    <%if(session.getAttribute("error")!=null){
        String error=session.getAttribute("error").toString();
       %><p style="width:100%;text-align:center;"><%=error %></p><%
    session.setAttribute("error",null);
    } %>
    </div>
    </section>
  </body>
</html>
