<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>resetpwd.jsp</title>
<link rel="StyleSheet" href="css/mycss.css" type="text/css" />
</head>
<body>
	<div class="background"
		style="background: url(image/4.jpg) no-repeat; background-size: 100%">
		<form name="reset" action="UserServlet.do?method=reset"
			method="post">
			<center>
				<br>
				<br>
				<br>
				<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入以下内容：</h2>
				<h3>
					<table>
						<tr>
							<td align="right">用户名：</td>
							<td><input type="text" name="username" size="20" /></td>
						</tr>
						<tr>
							<td align="right">原始密码：</td>
							<td><input type="password" name="password" size="20" /></td>
						</tr>
						<tr>
							<td align="right">新密码：</td>
							<td><input type="password" name="newPassword1" size="20" /></td>
						</tr>
						<tr>
							<td align="right">再次输入新密码：</td>
							<td><input type="password" name="newPassword2" size="20" /></td>
						</tr>
						<tr>
							<td colspan="2"  align="right"><input type="submit" name="submit"
								value="修改">&nbsp;&nbsp;<a href="main.jsp">返回到首页</a>
						</tr>
					</table>
				</h3>
			</center>
		</form>
	</div>
</body>
</html>