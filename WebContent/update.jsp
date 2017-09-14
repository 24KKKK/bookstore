<%@ page import="java.sql.*" pageEncoding="UTF-8" errorPage="error.jsp"%>
<html>
<head>
<title>修改完成</title>
</head>
<body background="bg.jpg">
	<jsp:useBean id="db" class="bookstore.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String bookname = request.getParameter("bookname");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String id = request.getParameter("id");

		String sql = "update bookinfo set bookname='" + bookname + "',author='" + author + "',price=" + price
				+ " where id=" + id;
		int i = db.executeUpdate(sql);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('修改成功，点击确定后自动跳到主页。');</script>");
			response.setHeader("refresh", "1;url=index1.jsp");
		}
		db.close();
	%>
</body>
</html>
