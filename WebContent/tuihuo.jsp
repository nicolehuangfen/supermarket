<%@ page language="java" contentType="text/html; charset=gbk" import="com.UserBean.UserBean"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<meta http-equiv="refresh" content="1;url=myorder.jsp">
<title>tuihuo.jsp</title>
<link rel="StyleSheet" href="css/mycss.css" type="text/css" />
</head>
<body>
<%
String oid = request.getParameter("id");
UserBean userbean = new UserBean();
userbean.deleteMyOrder(oid);
%>
<center>
<h2>退货成功！</h2>
<font color="red">1秒后自动返回到订单页面</font>
</center>
</body>
</html>