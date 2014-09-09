<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>logout.jsp</title>
<link rel="StyleSheet" href="css/mycss.css" type="text/css" />
</head>
<body>
<form name="logout" action="UserServlet.do?method=logout" method="post">
<center><br><br><br>
<h2>
确定要注销？
<input type="submit" name="submit" value="确定"><br><br>
<a href="book.jsp">不注销并返回首页</a>
</h2>
</center>
</form>
</body>
</html>