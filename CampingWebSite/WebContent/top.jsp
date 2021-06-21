<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top.jsp</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	
	if(id == null) {
		id = "guest";
	}	
%>
	<table width="600">
		<tr height="100">
			<td colspan="2" align="center">
				<img src="./images/kovealogo.png" alt="Kovea로고" width="80" height="70">
			</td>
			<td colspan="4" align="center">
				<font size="15">낭만 캠프</font>
			</td>
		</tr>
		<tr height="50">
			<td width="100" align="center">텐트</td>
			<td width="100" align="center">침낭</td>
			<td width="100" align="center">의자</td>
			<td width="100" align="center">식기류</td>
			<td width="100" align="center">테이블</td>
			<td width="100" align="center">화롯대</td>
			<td width="100" align="center">
<%
			if(id.equals("guest")) {
%>
				<%=id%>님<input type="button" value="로그인" onclick="location.href='sessionMain.jsp?center=Login.jsp'">
<%	
			} else {
%>
				<%=id%>님<input type="button" value="로그아웃" onclick="location.href='sessionMain.jsp?center=Logout.jsp?logout=1'">
<%
			}
%>
			</td>
		</tr>
	</table>
</body>
</html>