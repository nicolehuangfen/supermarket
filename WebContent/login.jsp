<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>login.jsp</title>
</head>
<body background=image/background1.jpg>
	<form name="login" action="UserServlet.do?method=login" method="post">

		<center>
			<br> <br> <br> <br>
			<h1>欢迎来到网络购物管理系统登录界面</h1>
			<br> <br>
			<h3>
				<table border="1" width="300" height="200"
					background=image/login.jpg>
					<tr>
						<td colspan="2">用户登录</td>
					</tr>

					<tr>
						<td>用户名:</td>
						<td><input type="text" name="username" size=20></td>
					</tr>
					<tr>
						<td>密&nbsp;&nbsp;码:</td>
						<td><input type="password" name="password" size=20></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="submit" name="submit" value="登录"">&nbsp;&nbsp;&nbsp;
							<a href="register.jsp">注册</a></td>
					</tr>
				</table>
			</h3>
			<p id="error"></p>
		</center>
	</form>
</body>
</html>
