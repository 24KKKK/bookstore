<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册信息确认界面</title>
</head>
<body background="bg.jpg">
	<h2 align="center">注册信息确认</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String degree = request.getParameter("degree");
		String local = request.getParameter("local");
		String phone = request.getParameter("phone");
		String comment = request.getParameter("comment");
	%>
	<table border="2" align="center">
		<tr>
			<td>用户名</td>
			<td><%=username%></td>
		</tr>
		<tr>
			<td>口令</td>
			<td><%=userpass%></td>
		</tr>
		<tr>
			<td>学历</td>
			<td><%=degree%></td>
		</tr>
		<tr>
			<td>地区</td>
			<td><%=local%></td>
		</tr>
		<tr>
			<td>电话</td>
			<td><%=phone%></td>
		</tr>
		<tr>
			<form name="form1" action="" method="post">
				<input type="hidden" name="local" value="${param.local }" /> <input
					type="hidden" name="phone" value="${param.phone }" /> <input
					type="hidden" name="degree" value="${param.degree }" /> <input
					type="hidden" name="username" value="${param.username }" /> <input
					type="hidden" name="userpass" value="${param.userpass }" />
				<td><input type="button" name="action1" value="确定"
					onclick="this.form.action='Register_insertdb.jsp';this.form.submit();">
				</td>
				<td><input type="button" name="action2" value="修改"
					onclick="this.form.action='Re_register.jsp';this.form.submit();"></td>
			</form>
		</tr>
	</table>
</body>
</html>
