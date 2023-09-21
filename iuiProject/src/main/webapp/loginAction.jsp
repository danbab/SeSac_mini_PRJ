<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date"%>


<jsp:useBean id="service" class="iuiProject.MemberDAO" scope = "application"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction</title>
</head>

<body>
	<%
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");

		int result = service.login(id,pw);
		if (result == 1) {
			MemberDTO member = service.select(id, pw);
			System.out.println("select :: " + member);
			session.setAttribute("member", member);
			response.sendRedirect("home.jsp");
		} else if (result == 0) {
			// 비밀번호 불일치 처리
			%>
			<script>
			alert("비밀번호가 일치하지 않습니다. 메인페이지로 돌아갑니다");
			location.href="main.jsp"
			</script>
			<%
			/* response.sendRedirect("testmain.jsp"); 얘가 먼저 실행돼버림 */
		} else {
			// 아이디가 없음 처리
			%>
			<script>
			alert("계정이 없으시군요. 회원가입 페이지로 이동합니다");
			location.href="register.jsp"
			</script>
			<%
			
		}

	%>
	

</body>
</html>