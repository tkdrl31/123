<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<h2 align="center">회원가입 페이지</h2>
	<form action="memberJoinPro2.jsp" method="post">
		<table align="center" width="600" border="1">
			<tr height="50">
				<td align="center" width="250">아이디</td>
				<td align="center" width="350">
					<input type="text" name="id" size="40" placeholder="id를 입력해 주세요.">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="250">패스워드</td>
				<td align="center" width="350">
					<input type="password" name="pass1" size="40" placeholder="영문대문자와 소문자, 특수문자, 숫자를 8자리 이상 15자리 이하로 입력해 주세요.">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="250">패스워드 확인</td>
				<td align="center" width="350">
					<input type="password" name="pass2" size="40" placeholder="위의 패스워드와 같이 입력해 주세요.">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="250">전자우편</td>
				<td align="center" width="350">
					<input type="text" name="email" size="40" placeholder="kim@kim.com">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="250">전화번호</td>
				<td align="center" width="350">
					<input type="text" name="tel" size="40" placeholder="01033114531">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="250">관심분야</td>
				<td align="center" width="350">
					<input type="checkbox" name="hobby" value="캠핑">캠핑&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="등산">등산&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="영화">영화&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="독서">독서&nbsp;&nbsp;
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="250">직업</td>
				<td align="center" width="350">
					<select name="job">
						<option>교수</option>
						<option>전문직</option>
						<option>강사</option>
						<option>공무원</option>
					</select>
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="200">연령대</td>
				<td align="center" width="350">
					<input type="radio" name="age" value="10">10대&nbsp;&nbsp;
					<input type="radio" name="age" value="20">20대&nbsp;&nbsp;
					<input type="radio" name="age" value="30">30대&nbsp;&nbsp;<br>
					<input type="radio" name="age" value="40">40대&nbsp;&nbsp;
					<input type="radio" name="age" value="50">50대&nbsp;&nbsp;
					<input type="radio" name="age" value="60">60대&nbsp;&nbsp;
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="200">하고 싶은 말</td>
				<td align="center" width="350"><textarea rows="7" cols="60" name="info"></textarea></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="submit" value="가입버튼">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소버튼">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>