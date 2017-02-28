<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="bean.*" %>
<%
  List<Phones> list =(List<Phones>)session.getAttribute("phoneList");
  int len;
  if(session.getAttribute("memberID")==null){
    len=3;
  }else{
    len=list.size();
  }
 %>
<!DOCTYPE HTML >
<html>
  <head>
    <title>张雅娟手机销售网站</title>
    <link href="css/phone.css" rel="stylesheet">
    <meta name="author" content="数信科技1304 张雅娟  0961130428">
  </head>
  
  <body>
   
    <header>
    <%if(session.getAttribute("memberID")==null){ %>
  		 <span style="margin-left:70%; line-height:30px;">您好！游客，请<a href="login.jsp" class="header">登录</a> </span>
  	<%}else{ 
         String memberID=session.getAttribute("memberID").toString();
  	%>
  	     <span style="margin-left:70%; line-height:30px;">您好！<%=memberID %>&nbsp;&nbsp;
  	     <a href="LogoutSer" class="header">退出登录</a></span> 
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
	  		<%	    
		    for(int i=0;i<len;i++){ 
		    %>
		    <form action="AddSer" method="post">
  			<div class="box">
  			  <div class="img"><a href="DetaSer?phoneID=<%=list.get(i).getPhoneID() %>"><img src=<%=list.get(i).getImg() %> width="100%"></a></div>
  			  <div class="pname"><%=list.get(i).getPname() %></div>
  			  <input type=hidden value=<%=list.get(i).getPhoneID() %> name="phoneID">
  			  <div class="pname">价格：&yen;<%=list.get(i).getPrice() %></div>
  			  <input type="submit" value="加入购物车" class="buy">
  			</div>
  			</form>
  			<%} %>
  			<%if(session.getAttribute("memberID")==null){ %>
  			<div class="box">
  			  <div style="width:200px; height:100px; line-height:100px;text-align:center;background-color:lightblue;margin-top:70px;">
  			  <a href="login.jsp" class="header">浏览更多＋</a>
  			  </div>
  			</div>
  			<%} %>  
  		
  	</section>
  	 <%if(session.getAttribute("message")!=null){ 
      request.setCharacterEncoding("utf-8");
      String message=session.getAttribute("message").toString();
    %>
    <div class="message" id="message"><%=message %>
    <div class="x" onclick="document.getElementById('message').style.display='none'">X</div>
    <form action="CartSer" method="post">
        <input type="submit" class="buy" style="width:80%;" value="查看购物车">
    </form>
    </div>
    <% 
      session.setAttribute("message",null);
     }%>
  </body>
</html>
