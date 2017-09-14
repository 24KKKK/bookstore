<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*"
	errorPage="error.jsp"%>
<html>
<head>
<title>添加图书信息</title>
<style type="text/css">
table {
	border-collapse: collapse;
	border: none;
	margin: 0px auto;
	width: 400px;
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

	<form action="add.jsp" method="post">
		<table>
			<caption>添加图书信息</caption>
			<tr>
				<th width="30%">书名：</th>
				<td width="70%"><input name="bookname" type="text"></td>
			</tr>
			<tr>
				<th>作者：</th>
				<td><input name="author" type="text"></td>
			</tr>
			<tr>
				<th>价格：</th>
				<td><input name="price" type="text">元</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" name="submit" value="添加">
					<input type="reset" value="重置"></th>
			</tr>
		</table>
	</form>
	<jsp:useBean id="db" class="bookstore.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String submit = request.getParameter("submit");

		if (submit != null && !submit.equals("")) {
			String bookname = request.getParameter("bookname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");

			String sql = "insert into bookinfo(bookname,author,price) values('" + bookname + "','" + author + "',"
					+ price + ")";
			int i = db.executeUpdate(sql);
			if (i == 1) {
				out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到主页!');</script>");
				response.setHeader("refresh", "1;url=index1.jsp");
			} else {
				out.println("<script language='javaScript'> alert('添加失败，点击确定返回添加页面！');</script>");
				response.setHeader("refresh", "1;url=add.jsp");
			}
			db.close();
		}
	%>
</body>
</html>
