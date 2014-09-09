<%@ page language="java" contentType="text/html; charset=gbk"
    import="java.util.*,javax.servlet.http.HttpSession" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function testDate(){
	var date=new Date();
	var result=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+"  "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
	document.getElementById("mydate").innerHTML=result;
	}
	setInterval("testDate()", 1000);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title></title>
<link rel="StyleSheet" href="css/mycss.css" type="text/css" />
</head>
<body>
	<div class="head" style="background: url(image/title.jpg) no-repeat; background-size:100% ">
		<center>
			<h1>
				<font color=black>欢迎来到网络购物广场</font>
			</h1>
			<h3>
				<a href="gouwuche.jsp" style="text-decoration: none"> 
				<font color=black>购物车&nbsp;&nbsp;</font></a>
				
				<a href="myorder.jsp" style="text-decoration: none"> 
				<font color=black>我的订单&nbsp;&nbsp;</font></a> 
				
				<a href="register.jsp" style="text-decoration: none"> 
				<font color=black>用户注册&nbsp;&nbsp;</font></a> 
				
				<a href="login.jsp" style="text-decoration: none"> 
				<font color=black>用户登录&nbsp;&nbsp;</font></a>
				
				<a href="resetpwd.jsp" style="text-decoration: none"> 
				<font color=black>密码重置&nbsp;&nbsp;</font></a>
				
				<a href="logout.jsp" style="text-decoration: none"> 
				<font color=black>注销&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
				<%
				String username = (String)session.getAttribute("username");
				if(username != null){
				%>
				<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎您，<%=username %>&nbsp;&nbsp;&nbsp;</font>
				<%
				}else{
				%>
				<font color="red">欢迎您，游客&nbsp;&nbsp;&nbsp;</font>
				<%
				}
				%>
				<font color="red" id="mydate"></font>
			</h3>
		</center>
	</div>

</body>
</html>