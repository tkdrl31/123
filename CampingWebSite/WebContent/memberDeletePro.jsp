<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.memberDAO"%>
<%@ page import ="model.memberBean"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제 페이지 구현 - memberDeletePro.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
		<jsp:useBean id = "mBean" class = "model.memberBean">	
			
		<jsp:setProperty name = "mBean" property="*" /> 
			
		</jsp:useBean>

	<%
	
		String id = request.getParameter("id"); // ex)kayeon
		
		// 데이터 베이스에서 모든 회원 정보를 가져오기
		memberDAO mdao = new memberDAO(); // 객체 생성
			
		String pass = mdao.getPass(mBean.getId()); // ex)kayeon
	
		// 사용자 입력 암호와 DB 암호화 비교
		if(mBean.getPass1().equals(pass)){
			
		mdao.deleteCampingmember(mBean.getId());
			
		// 회원정보 목록 페이지로 이동
		response.sendRedirect("memberList.jsp");	
		}else{	
		
	%>

	<script>
		alert("패스워드가 틀렸습니다. 다시 확인 바랍니다.");
		history.go(-1);
	</script>
	<% } %>	

</body>
</html>