<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理系统</title>
<style type="text/css">
table {
	border-collapse: collapse;
	border: none;
	margin: 0px auto;
	width: 500px;
}

th, td {
	border: solid #333 1px;
	height: 20px;
}

div {
	text-align: center;
}
</style>
</head>
<body background="bg.jpg">
	<div>
		<a href="index.html"><font color=yellow>退出并回到首页</font></a>
	</div>
	<p />
	<div>
		<h3>图书信息</h3>
	</div>
	<p />
	<table>
		<tr>
			<td>书号</td>
			<td>书名</td>
			<td>作者</td>
			<td>价格</td>
		</tr>
		<jsp:useBean id="db" class="bookstore.DBBean" scope="page" />
		<%
			String s = "select * from bookinfo;";
			ResultSet rs = db.executeQuery(s);
			while (rs.next()) {
				int id = rs.getInt(1);
				out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
						+ "</td><td>" + rs.getString(4) + "</td></tr>");
			}
			rs.close();
			db.close();
		%>
	</table>
</body>
</html>