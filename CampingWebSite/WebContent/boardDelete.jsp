<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.boardBean" %>
<%@ page import="model.boardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
	<h2 style="color:#967BDC" align="center">삭제를 위한 비밀번호 입력</h2>
	<form action = "boardDeletePro.jsp?num=<%=num%>" method="post">
		<table border = "1" align="center" bgcolor="#e6e6fa">
			<tr height = "50">	
				<th align="center" width = "80">비밀번호</th>
				<td align="center" width = "100" colspan="3">
					<input type = "password" name = "password" size ="30" />
				</td>	
			</tr>
			<tr>
			<td colspan="2" align="center">
				<input type="submit" value="삭제하기">
			</td>		
		</table>
	</form>
</body>
</html>