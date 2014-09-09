<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>register.jsp</title>
<link rel="StyleSheet" href="css/mycss.css" type="text/css" />
</head>
<body>
	<div class="background"
		style="background: url(image/4.jpg) no-repeat; background-size: 100%">
		<form name="register" action="UserServlet.do?method=register"
			method="post">
			<center>
				<br>
				<br>
				<br>
				<h3>
					请输入以下需要填写的内容：
					<table>
						<tr>
							<td>用户名：</td>
							<td><input type="text" name="username" size="20" /></td>
						</tr>
						<tr>
							<td>密&nbsp;&nbsp;码：</td>
							<td><input type="password" name="password1" size="20" /></td>
						</tr>
						<tr>
							<td>再次输入密码：</td>
							<td><input type="password" name="password2" size="20" /></td>
						</tr>
						<tr>
							<td>邮&nbsp;&nbsp;箱：</td>
							<td><input type="text" name="email" size="20" /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" name="submit"
								value="注册">&nbsp;&nbsp;<a href="main.jsp">返回到首页</a>
						</tr>
					</table>
				</h3>
			</center>
		</form>
	</div>
</body>
</html>