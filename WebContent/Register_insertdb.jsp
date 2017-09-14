<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册信息写进数据库</title>
</head>
<body background="bg.jpg">
	<jsp:useBean id="db" class="bookstore.PersonDBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String degree = request.getParameter("degree");
		String local = request.getParameter("local");
		String phone = request.getParameter("phone");
		String sql = "insert into personinfo(username,userpass,degree,local,phone) values('" + username + "','"
				+ userpass + "','" + degree + "','" + local + "','" + phone + "')";
		int i = db.executeUpdate(sql);
		if (i == 1) {
			out.println("注册成功，1s后进入登录界面");
			response.setHeader("refresh", "1;url=Login.jsp");
		} else {
			out.println("注册失败，此用户名已存在，请使用其他用户名。");
			response.setHeader("refresh", "3;url=Register.jsp");
		}
	%>
</body>
</html>