<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session을 이용한 회원정보 로그인 화면 페이지</title>
</head>
<body>
	<h2 align="center">Session Login</h2>
	
	<form action="LoginPro.jsp" method="post">
		<table align="center" width="400" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td align="center" width="250">
					<input type="text" name="id" placeholder="아이디를 입력해주세요.">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td align="center" width="250">
					<input type="password" name="pass1" placeholder="비밀번호를 입력해주세요.">
				</td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="submit" value="로그인버튼">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>