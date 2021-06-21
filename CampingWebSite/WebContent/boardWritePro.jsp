<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.boardBean" %>
<%@ page import = "model.boardDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 쓰기 정보 처리 - boardWritePro.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

     //boardBean bBean = new boardBean();
%>

	<jsp:useBean id="bBean" class="model.boardBean">
		<jsp:setProperty name="bBean" property="*"/>
	</jsp:useBean>
<%
	boardDAO dbao = new boardDAO();
	dbao.insertBoard(bBean);
	
	response.sendRedirect("boardList.jsp");


%>

</body>
</html>