<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title></title>
<link rel="StyleSheet" href="mycss.css" type="text/css" />
</head>
<body>
	<div class="head" style="background: url(image/title.jpg) repeat-x;">
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
				
				<a href="changepwd.jsp" style="text-decoration: none"> 
				<font color=black>密码重置&nbsp;&nbsp;</font></a>
				
				<a href="logout.jsp" style="text-decoration: none"> 
				<font color=black>注销&nbsp;&nbsp;</font></a>
			</h3>
		</center>
	</div>

	<div class="left" style="background:url(image/left.jpg);">
        <center><h2>商品分类</h2></center>
        <center><h4><a href="book.jsp"  style="text-decoration:none">
        <img src="image/jiantou.jpg" width="10" height="10">&nbsp;
        <font color=black>图&nbsp;&nbsp;书</font></a></h4></center>
        
        <center><h4><a href="telephone.jsp"  style="text-decoration:none">
        <img src="image/jiantou.jpg" width="10" height="10">&nbsp;
        <font color=black>手&nbsp;&nbsp;机</font></a></h4></center>
        
        <center><h4><a href="bag.jsp"  style="text-decoration:none">
        <img src="image/jiantou.jpg" width="10" height="10">&nbsp;
        <font color=black>包&nbsp;&nbsp;包</font></a></h4></center>
        
        <center>
        <h4><a href="computer.jsp"  style="text-decoration:none">
        <img src="image/jiantou.jpg" width="10" height="10">&nbsp;
        <font color=black>电&nbsp;&nbsp;脑</font>
        </a></h4>
        </center>
    </div>
</body>
</html>