<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>判断用户密码是否正确</title>
</head>
<body background="bg.jpg">
	<jsp:useBean id="db" class="bookstore.PersonDBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("username");
		String userpass = request.getParameter("password");
		// out.println(username+"  "+userpass);

		if (username.equals("admin") && userpass.equals("admin"))
			response.setHeader("refresh", "1;url=index1.jsp");
		else {
			String sql = "select * from personinfo where username='" + username + "' and userpass='" + userpass
					+ "'";
			ResultSet rs = db.executeQuery(sql);

			int flag = 0;

			while (rs.next()) {
				flag = 1;
				response.setHeader("refresh", "1;url=person_index.jsp");
			}
			if (flag == 0) {
				out.println("<script language='javaScript'> alert('用户名或密码错误,请重新登录!');</script>");
				response.setHeader("refresh", "1;url=Login.jsp");
			}
		}
	%>
</body>
</html>