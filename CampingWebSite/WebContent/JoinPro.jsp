<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String hobby[] = request.getParameterValues("hobby");
	String job = request.getParameter("job");
	String age = request.getParameter("age");
	String info = request.getParameter("info");
	
	if(!pass1.equals(pass2)) {
%>
	<script>
		alert("비밀번호가 틀립니다. 확인해주시기 바랍니다.");
		history.go(-1);
	</script>
<%
	}
%>
	아이디: <%=id%><br>
	패스워드1: <%=pass1%><br>
	패스워드2: <%=pass2%><br>
	전자우편: <%=email%><br>
	전화번호: <%=tel%><br>
	관심분야: 
	<%
		for(int i=0; i<hobby.length; i++) {
			out.println(hobby[i] + " ");
		}
	%><br>
	직업: <%=job%><br>
	연령대: <%=age%><br>
	하고 싶은 말: <%=info%>
</body>
</html>