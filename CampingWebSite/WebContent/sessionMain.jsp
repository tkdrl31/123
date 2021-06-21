<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session을 이용한 로그인 처리</title>
</head>
<body>
<%
	String center = request.getParameter("center");

	if(center == null) {
		center = "Center.jsp";
	}

	

%>
	<table border="1" align="center" width="600">
		<tr height="100">
			<td align="center" colspan="2">
				<jsp:include page="top.jsp"/>
			</td>
		</tr>
		<tr height="400">
			<td align="left" width="100">
				<jsp:include page="LeftMenu.jsp"/>
			</td>
			<td align="center" colspan="2">
				<jsp:include page="<%=center%>"/>
			</td>
		</tr>
		<tr height="100">
			<td align="center" colspan="2">
				<jsp:include page="bottom.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>