<%@ page language="java" contentType="text/html; charset=gbk" 
	pageEncoding="utf-8"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title></title>
<link rel="StyleSheet" href="mycss.css" type="text/css" />
</head>
<body>
	<div class="left" style="background: url(image/left.jpg);">
		<center>
			<h2>商品分类</h2>
		</center>
		<center>
			<img src="image/jiantou.jpg" width="10" height="10">&nbsp; <font
				color=purple>图&nbsp;&nbsp;书</font>
			<h4>
				<a href="telephone.jsp" style="text-decoration: none"> <img
					src="image/jiantou.jpg" width="10" height="10">&nbsp; <font
					color=black>手&nbsp;&nbsp;机</font></a>
			</h4>

			<h4>
				<a href="bag.jsp" style="text-decoration: none"> <img
					src="image/jiantou.jpg" width="10" height="10">&nbsp; <font
					color=black>包&nbsp;&nbsp;包</font></a>
			</h4>

			<h4>
				<a href="computer.jsp" style="text-decoration: none"> <img
					src="image/jiantou.jpg" width="10" height="10">&nbsp; <font
					color=black>电&nbsp;&nbsp;脑</font></a>
			</h4>
		</center>
	</div>
	<center>
		<table width=600 height=400>
		
			<tr>
				<td><br></td>
				<td><br></td>
				<td><br></td>
				<td><br></td>
			</tr>
			<tr>
				<td><img src="image/book/Java.jpg" width="150" height="200" /><br>
					<a href="goodDetail.jsp?id=1">Java编程思想</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><img src="image/book/JavaWeb.jpg" width="150" height="200" /><br>
					<a href="goodDetail.jsp?id=2">Java web开发经典</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><img src="image/book/xinlingjitang.jpg" width="150"
					height="200" /><br> <a href="goodDetail.jsp?id=3">心灵鸡汤</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><img src="image/book/xiyouji.jpg" width="150" height="200" /><br>
					<a href="goodDetail.jsp?id=7">西游记</a></td>
			</tr>
			<tr>
				<td><br></td>
				<td><br></td>
				<td><br></td>
				<td><br></td>
			</tr>
			<tr>
				<td><img src="image/book/sanguoyanyi.jpg" width="150"
					height="200" /><br> <a href="goodDetail.jsp?id=5">三国演义</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><img src="image/book/hongloumeng.jpg" width="150"
					height="200" /><br> <a href="goodDetail.jsp?id=4">红楼梦</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><img src="image/book/shuihuzhuan.jpg" width="150"
					height="200" /><br> <a href="goodDetail.jsp?id=6">水浒传</a></td>
			</tr>
		</table>
	</center>
</body>
</html>