<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.boardDAO" %>
<%@ page import = "model.boardBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 글쓰기 구현 페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="bBean" class="model.boardBean">
		<jsp:setProperty name="bBean" property="*"/>
	</jsp:useBean>

<%
	boardDAO bdao = new boardDAO();
	bdao.reWriteBoard(bBean);
	response.sendRedirect("boardList.jsp");

%>
</body>
</html>