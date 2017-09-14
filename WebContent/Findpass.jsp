<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码找回</title>
</head>
<body background="bg.jpg">
	<jsp:useBean id="db" class="bookstore.PersonDBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("username");

		String sql = "select userpass from personinfo where username='" + username + "'";
		ResultSet rs = db.executeQuery(sql);
		int flag = 0;
		while (rs.next()) {
			flag = 1;
			out.println("<font color=\"yellow\" size=\"34\" face=\"楷体\">" + username + "您的密码为："
					+ rs.getString("userpass") + "  5s后跳回登录界面。</font>");
			response.setHeader("refresh", "5;url=Login.jsp");
		}
		if (flag == 0) {
			out.println("没有此用户名，2s后请重新输入");
			response.setHeader("refresh", "2;url=forgot-password.html");
		}
	%>
</body>
</html>