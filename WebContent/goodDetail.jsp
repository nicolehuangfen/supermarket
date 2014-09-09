<%@ page language="java" contentType="text/html; charset=gbk"
	import="com.UserBean.UserBean, java.util.*, com.DBConn.DBAccess"
	pageEncoding="utf-8"%>
<%@ include file="top.jsp"%>
<%@ include file="left.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>goodDetail</title>
</head>
<body style="background-color: #FFF8DC">
	<%
		UserBean userbean = new UserBean();
		HashMap<String, String> hash = new HashMap<String, String>();
		String good_id = request.getParameter("id");
		if (good_id != null) {
			int n = Integer.valueOf(good_id).intValue();
			hash = userbean.getGoodDetail(n);
		}
	%>
	<center>
		<h2>商品详细信息列表:</h2>
		<table border="1" width=60%>
			<tr>
				<td width=20%>商品图片</td>
				<td><img src="<%=hash.get("gimgurl")%>" width="150"
					height="180" /></td>
			</tr>
			<tr>
				<td>商品编号</td>
				<td>
					<%
						out.print(hash.get("good_id"));
					%>
				</td>
			</tr>
			<tr>
				<td>商品名称</td>
				<td>
					<%
						out.print(hash.get("good_name"));
					%>
				</td>
			</tr>
			<tr>
				<td>商品类型</td>
				<td>
					<%
						out.print(hash.get("gtype"));
					%>
				</td>
			</tr>
			<tr>
				<td>商品价格</td>
				<td>
					<%
						out.print(hash.get("gprice"));
					%>
				</td>
			</tr>
			<tr>
				<td>生产日期</td>
				<td>
					<%
						out.print(hash.get("gdate"));
					%>
				</td>
			</tr>
			<tr>
				<td>商品数量</td>
				<td>
					<%
						out.print(hash.get("gcount"));
					%>
				</td>
			</tr>
			<tr>
				<td>商品介绍</td>
				<td>
					<%
						out.print(hash.get("gintroduction"));
					%>
				</td>
			</tr>
		</table>
		<br>
		<form name="goodDetail" action="" method="post">
			<a href="addgouwuche.jsp?id=<%=hash.get("good_id")%>" >加入购物车</a>
		</form>
	</center>
</html>