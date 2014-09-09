<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link rel="StyleSheet" href="css/mycss.css" type="text/css" />
<title>receiveInfo.jsp</title>
</head>
<body>
<form name="receiveinfo" action="UserServlet.do?method=receiveinfo" method="post">
	<center>
		<h2>请填写您的收货信息：</h2>
		<table>
			<tr>
				<td>收货人：</td>
				<td><input type="text" name="receivename"></td>
			</tr>
			<tr>
				<td>收货地址：</td>
				<td><input type="text" name="receiveadds"></td>
			</tr>
			<tr>
				<td>联系电话：</td>
				<td><input type="text" name="receivetel"></td>
			</tr>
			<tr>
			<td colspan="2">
			<input type="submit" name="submit" value="提交">
			</td>
			</tr>
		</table>

	</center>
	</form>
</body>
</html>