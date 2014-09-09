<%@ page language="java" contentType="text/html; charset=gbk" import="com.UserBean.UserBean"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<meta http-equiv="refresh" content="0;url=gouwuche.jsp">
<title>minus.jsp</title>
</head>
<body>
<%
	String oid = request.getParameter("id");
	UserBean userbean = new UserBean();
	userbean.minusOrdercount(oid);	
%>
</body>
</html>