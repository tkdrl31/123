<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.boardBean" %>
<%@ page import = "model.boardDAO" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 수정 페이지 구현 - memeberUpdatePro.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num")); 
%>

	<jsp:useBean id = "bean" class = "model.boardBean">	
		<jsp:setProperty name = "bean" property="*" /> 
	</jsp:useBean>
		
<%
	boardDAO bdao = new boardDAO(); 
	String pass = bdao.getPass(bean.getNum());

	//수정 시에 입력한 패스워드와 DB에서 읽어온 패스워드를 비교함
	if(pass.equals(bean.getPassword())) {
		bdao.updateboard(bean);
		response.sendRedirect("boardList.jsp");
	} else {
%>
	<script>
		alert('패스워드가 잘못 되었습니다. 확인해 주시기 바랍니다.');
		history.go(-1);
	</script>
<% } %>
</body>
</html>