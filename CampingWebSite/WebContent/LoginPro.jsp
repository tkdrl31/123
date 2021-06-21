<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 출력</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass1");
	
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	
	session.setMaxInactiveInterval(60*60);
	
	response.sendRedirect("mainCamping.jsp");
%>
</body>
</html>