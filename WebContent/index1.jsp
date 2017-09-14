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
		<a href="add.jsp"><font color=yellow>增加图书信息</font></a>
	</div>
	<p />
	<table>
		<tr>
			<td><font color=red>书号</font></td>
			<td><font color=red>书名</font></td>
			<td><font color=red>作者</font></td>
			<td><font color=red>价格</font></td>
			<td><font color=red>操作</font></td>
		</tr>
		<jsp:useBean id="db" class="bookstore.DBBean" scope="page" />
		<%
			String s = "select * from bookinfo;";
			ResultSet rs = db.executeQuery(s);
			while (rs.next()) {
				int id = rs.getInt(1);
				out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
						+ "</td><td>" + rs.getString(4) + "</td><td><a href='del.jsp?id=" + id
						+ "'>删除</a>&nbsp;<a href='edit.jsp?id=" + id + "'>修改</a></td></tr>");
			}
			rs.close();
			db.close();
		%>
	</table>
</body>
</html>