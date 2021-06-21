<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제 페이지 - memberDelete.jsp</title>
</head>
<body>
	<h2 align="center">회원정보 삭제 구현</h2>
	<table border="1" align="center" width="500">
		<form action="memberDeletePro.jsp" method="post">
			<tr height="50">
				<td align="center" width="50">아이디</td>
				<td align="center" width="100"><%= request.getParameter("id") %></td>
			</tr>
			<tr height="50">
				<td align="center" width="50">패스워드</td>
				<td align="center"><input type="password" name="pass1"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%= request.getParameter("id") %>">
					<input type="submit" value="회원정보 삭제">&nbsp;&nbsp;
					<input type="button" value="회원정보 목록보기" onclick="location.href='memberList.jsp">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>