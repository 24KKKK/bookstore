<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="JavaScript">
	function isValidate(form) {

		//得到用户输入的信息
		username = form.username.value;
		userpass = form.userpass.value;
		userpass2 = form.userpass2.value;
		phone = form.phone.valuse;

		//判断用户名长度
		if (username.length<2 || username.length>10) {
			alert("用户名长度在2到10位之间");
			form.username.focus();
			return false;
		}

		//判断口令长度
		if (userpass.length<6 || userpass.length>8) {
			alert("口令长度在6到8位之间");
			form.userpass.focus();
			return false;
		}

		//判断 用户名和密码是否相同
		if (username == userpass) {
			alert("用户名和密码不能相同");
			form.userpass.focus();
			return false;
		}

		//判断两次口令是否相同
		if (userpass != userpass2) {
			alert("两次輸入的口令不同");
			form.userpass2.focus();
			return false;
		}
	}
	// 文本框清空灰色提示
	function TextOnFocusShow(showId) {
		var showIdTextValue = document.getElementById(showId).value;
		var showIdTextDeValue = document.getElementById(showId).defaultValue;// text初始设置
		if (showIdTextValue == showIdTextDeValue) {
			document.getElementById(showId).value = "";
			document.getElementById(showId).style.color = '#000';
		}
	}

	// 文本框为空时增加灰色提示
	function TextOnBlurShow(showId) {
		var lDateValue = document.getElementById(showId).value;
		var lDateDefaultValue = document.getElementById(showId).defaultValue;
		if (lDateValue == '') {
			document.getElementById(showId).value = lDateDefaultValue;
			document.getElementById(showId).style.color = '#999';
		}
	}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改注册信息</title>
</head>
<body background="bg.jpg">
	<h2 align="center">请修改注册信息</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String degree = request.getParameter("degree");
		String local = request.getParameter("local");
		String phone = request.getParameter("phone");
		// 		String comment = request.getParameter("comment");
	%>
	<form name="form1" action="Register_confirm.jsp" method="post"
		onsubmit="return isValidate(form1);">
		<table align="center">
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="username" value=<%=username%> /></td>
			</tr>
			<tr>
				<td>口令：</td>
				<td><input type="password" name="userpass" value=<%=userpass%> /></td>
			</tr>
			<tr>
				<td>确认口令：</td>
				<td><input type="password" name="userpass2" value=<%=userpass%> /></td>
			</tr>
			<tr>
				<td>学历：</td>
				<td><input type="radio" name="degree" value="专科" />专科 <input
					type="radio" name="degree" value="本科" checked />本科 <input
					type="radio" name="degree" value="硕士研究生" />硕士研究生 <input
					type="radio" name="degree" value="博士研究生" />博士研究生 <input
					type="radio" name="degree" value="其他" />其他</td>
			</tr>
			<tr>
				<td>地区：</td>
				<td><select name="local">
						<option value="长安区" selected>长安区</option>
						<option value="桥东区">桥东区</option>
						<option value="桥西区">桥西区</option>
						<option value="裕华区">裕华区</option>
						<option value="新华区">新华区</option>
						<option value="藁城区">藁城区</option>
						<option value="井陉矿区">井陉矿区</option>
				</select></td>
			</tr>
			<tr>
				<td>电话：</td>
				<td><input type="text" name="phone" value=<%=phone%> /></td>
			</tr>
			<tr>
				<td><input type="submit" value="注册" /></td>
				<td><input type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</body>
</html>