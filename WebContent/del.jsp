<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" pageEncoding="gb2312"%>
<html>
<head>
<title>删除图书信息</title>
</head>
<body background="bg.jpg">
	<jsp:useBean id="db" class="bookstore.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("gb2312");

		String id = request.getParameter("id");
		int i = db.executeUpdate("delete from bookinfo where id=" + id);
		System.out.println("delete from bookinfo where id=" + id);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('删除成功，点击确定后自动跳到主页！');</script>");
			response.setHeader("refresh", "1;url=index1.jsp");
		} else {
			out.println("<script language='javaScript'> alert('删除失败，点击确定后自动跳到主页！');</script>");
			response.setHeader("refresh", "1;url=index1.jsp");
		}
		db.close();
	%>
</body>
</html>
