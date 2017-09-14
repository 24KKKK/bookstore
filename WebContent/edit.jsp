<%@ page import="java.sql.*" pageEncoding="UTF-8" errorPage="error.jsp"%>
<html>
<head>
<title>修改图书信息</title>
</head>
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
<body background="bg.jpg">
	<jsp:useBean id="db" class="bookstore.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("gb2312");

		String id = request.getParameter("id");
		ResultSet rs = db.executeQuery("select * from bookinfo where id=" + id);
		rs.next();
	%>
	<form action="update.jsp" method="post">
		<table>
			<caption>修改图书信息</caption>
			<tr>
				<th width="30%">书名：</th>
				<td width="70%"><input name="bookname" type="text"
					value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<th>作者：</th>
				<td><input name="author" type="text"
					value="<%=rs.getString(3)%>"></td>
			</tr>
			<tr>
				<th>价格：</th>
				<td><input name="price" type="text"
					value="<%=rs.getString(4)%>">元</td>
			</tr>
			<tr>
				<th colspan="2"><input type="hidden" name="id" value="<%=id%>">
					<input type="submit" value="修改"> <input type="reset"
					value="重置"></th>
			</tr>
		</table>
	</form>
	<%
		rs.close();
		db.close();
	%>
</body>
</html>
