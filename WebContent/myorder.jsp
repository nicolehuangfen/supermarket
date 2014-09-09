<%@ page language="java" contentType="text/html; charset=gbk"
	import="com.UserBean.UserBean, java.util.*, java.text.SimpleDateFormat, java.util.Date;"
	pageEncoding="utf-8"%>
<%@ include file="left.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>myorder.jsp</title>
<link rel="StyleSheet" href="css/mycss.css" type="text/css" />
</head>
<body>
	<h2>
		&nbsp;&nbsp;&nbsp;<a href="book.jsp">首页</a>
		<center>我的购物车</center>
	</h2>
	<table border=1 align="center" width=80%>
		<tr align="center">
			<td>订单编号</td>
			<td>商品名称</td>
			<td>商品数量</td>
			<td>价格</td>
			<td>下单时间</td>
			<td>发货情况</td>
			<td>退货</td>
		</tr>
		<%
			UserBean userbean = new UserBean();
			ArrayList<HashMap<String, String>> list;
			Date date = null;
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			session = request.getSession();
			String username = (String) session.getAttribute("username");
			if (username != null) {
				list = userbean.addUserOrder(username);
				for (int i = 0; i < list.size(); i++) {
					HashMap<String, String> hash = list.get(i);
// 					date = formatter.parse(hash.get("buytime"));
		%>
		<tr align="center">
			<td><%=hash.get("oid")%></td>
			<td><%=hash.get("good_name")%></td>
			<td><%=Integer.parseInt(hash.get("good_count"))%></td>
			<td><%=Double.parseDouble(hash.get("money"))%></td>
			<td><%=hash.get("buytime") %></td>
			<%
				if (Integer.parseInt(hash.get("status")) == 0) {
			%>
			<td><font color="blue">未发货</font></td>
			<%
				} else {
			%>
			<td><font color="red">已发货</font></td>
			<%
				}
			%>
			<%
				if (Integer.parseInt(hash.get("status")) != 0) {
			%>
			<td><font color="gray">退货</font></td>
			<%
				} else {
			%>
			<td><a href="tuihuo.jsp?id=<%=hash.get("oid") %>"><font color="blue">退货</font></a></td>
			<%
				}
			%>
		</tr>
		<%
			}
			}
		%>

	</table>
</body>
</html>