<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" pageEncoding="gb2312"%>
<html>
<head>
<title>ɾ��ͼ����Ϣ</title>
</head>
<body background="bg.jpg">
	<jsp:useBean id="db" class="bookstore.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("gb2312");

		String id = request.getParameter("id");
		int i = db.executeUpdate("delete from bookinfo where id=" + id);
		System.out.println("delete from bookinfo where id=" + id);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('ɾ���ɹ������ȷ�����Զ�������ҳ��');</script>");
			response.setHeader("refresh", "1;url=index1.jsp");
		} else {
			out.println("<script language='javaScript'> alert('ɾ��ʧ�ܣ����ȷ�����Զ�������ҳ��');</script>");
			response.setHeader("refresh", "1;url=index1.jsp");
		}
		db.close();
	%>
</body>
</html>
