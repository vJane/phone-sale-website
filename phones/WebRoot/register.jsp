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
     <title>注册</title>    
     <link href="css/phone.css" rel="stylesheet">
     <meta name="author" content="数信科技1304 张雅娟  0961130428">
     <script>
         function checka(obj){
           var obj1=document.getElementById("password").value;
           if (obj.value!=obj1){
             alert("两次密码输入不一致！");
           }
         }
         function checkp(obj){
           if (obj.value==""||obj.value==null){
             alert("不能为空！");
           }
         }
        function checkt(obj){
            var re =/^1\d{10}$/;
            if(!re.test(obj.value)){
	       	 alert("手机号非法！");
	         }
	     }    
     </script>
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
    <div class="register">
    <form action="RegisterSer" method="post">
      <table style="margin-left:auto;margin-right:auto;margin-top:100px; line-height:30px;">
        <tr><td colspan="2" style="text-align:center;font-size:1rem;font-weight:bold;">注册用户信息</td></tr>
        <tr><td>账号：</td><td><input type="text" name="memberID" onblur="checkp(this)">*</td></tr>
        <tr><td>密码：</td><td><input type="password" name="password" id="password" onblur="checkp(this)">*</td></tr>
        <tr><td>确认密码：</td><td><input type="password" onblur="checka(this)">*</td></tr>
        <tr><td>姓名：</td><td><input type="text" name="name" onblur="checkp(this)">*</td></tr>
        <tr><td>电话：</td><td><input type="text" name="tel" onblur="checkt(this)">*</td></tr>
        <tr><td>送货地址：</td><td><textarea name="address" onblur="checkp(this)"></textarea>*</td></tr>
        <tr><td colspan="2" style="text-align:center"><input type="submit" value="提交" class="buy"></td></tr>
      </table>
    </form>
    <%if(session.getAttribute("error")!=null){
        String error=session.getAttribute("error").toString();
      %><p style="width:100%;text-align:center;"><%=error %></p><%
    session.setAttribute("error",null);} %>
    </div>
   </section>
  </body>
</html>
