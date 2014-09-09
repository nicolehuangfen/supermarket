<%@ page language="java" contentType="text/html; charset=gbk"
	import="com.UserBean.UserBean" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>gouwuche.jsp</title>
<link rel="StyleSheet" href="css/mycss.css" type="text/css" />
</head>
<body>
	<%
		session = request.getSession();
		String id1 = request.getParameter("id");
		int id2 = 0;
		if (id1 != null) {
			id2 = Integer.parseInt(id1);
			String username = (String) session.getAttribute("username");
			UserBean userbean = new UserBean();
			if (username != null) {
				userbean.addOrder(username, id2);
			} else {
				System.out.println("请先登录！");
				response.sendRedirect("login.jsp");
			}
		}
	%>

	<form name="gouwuche" action="gouwuche.jsp" method="post">
		<center>
		<br>
			加入购物车成功！
			<a href="gouwuche.jsp">查看我的购物车</a><br><br>
			 <a	href="book.jsp">返回到首页</a>
		</center>
	</form>
</body>
</html>