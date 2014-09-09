<%@ page language="java" contentType="text/html; charset=gbk"
	import="com.UserBean.UserBean,java.util.*" pageEncoding="utf-8"%>
<%@ include file="left.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>gouwuche.jsp</title>
<link rel="StyleSheet" href="css/mycss.css" type="text/css" />
</head>
<body>
	<form name="buy" action="receiveInfo.jsp" method="post">
	<h2>&nbsp;&nbsp;&nbsp;<a href="book.jsp">首页</a></h2>
		<center>
			<h2>我的购物车</h2>
			<table border=1 align="center" width=80%>
				<tr>
					<td>订单编号</td>
					<td>用户名</td>
					<td>商品编号</td>
					<td>商品名</td>
					<td>商品单价</td>
					<td>商品数量</td>
					<td>加入购物车时间</td>
					<td>合计</td>
					<td>删除</td>
				</tr>
				<%
					String ordercount1 = request.getParameter("id");

					UserBean userbean = new UserBean();
					session = request.getSession();
					String username = (String) session.getAttribute("username");
					if (username != null) {
						ArrayList<HashMap<String, String>> list = userbean
								.queryOrder(username);
						for (int i = 0; i < list.size(); i++) {
							HashMap<String, String> hash = list.get(i);
				%>

				<tr>
					<td><%=hash.get("oid")%></td>
					<td><%=hash.get("username")%></td>
					<td><%=hash.get("good_id")%></td>
					<td><%=hash.get("good_name")%></td>
					<td>￥<%=hash.get("gprice")%></td>
					<td><a href="minus.jsp?id=<%=hash.get("oid")%>"
						style="text-decoration: none">－</a> <input type="text"
						name="ordercount" value="<%=hash.get("ordercount")%>" size="5">
						<a href="plus.jsp?id=<%=hash.get("oid")%> "
						style="text-decoration: none">＋</a></td>
					<td><%=hash.get("buytime")%></td>
					<td>￥<%=Double.parseDouble(hash.get("gprice"))*Integer.parseInt(hash.get("ordercount")) %></td>
					<td><a href="deleteOrder.jsp?id=<%=hash.get("oid")%>">删除</a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
			<br>
			<table align=right>
			<tr>
			<td>总合计：</td>
			<%
			UserBean userbean1 = new UserBean();
			double allprice = userbean1.allprice(username);
			%>
			<td>￥<%=allprice %></td>
			</tr>
			<tr>
			<td colspan="2"><br>
			<input type="submit" name="buy" value="确定购买"></td>
			<tr>
			</table>
		</center>
	</form>

</body>
</html>