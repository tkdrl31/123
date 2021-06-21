<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>각기 분리된 내용을 하나로 묶기 - include</title>
</head>
<body>
	<table border="1" align="center" width="700">
		<tr height="150">
			<td align="center" colspan="2">
				<jsp:include page="top.jsp"/>
			</td>
		</tr>
		<tr height="300">
			<td align="center" width="200">
				<jsp:include page="LeftMenu.jsp"/>
			</td>
			<td align="center" width="500">
				<jsp:include page="Center.jsp"/>
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