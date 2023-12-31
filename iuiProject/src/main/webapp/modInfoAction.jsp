<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberService" type="iuiProject.MemberDAO" scope="application" />
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
	<script>
		function showAlertAndRedirect(message, redirectTo) {
			alert(message);
			window.location.href = redirectTo;
		}
	</script>

	<%
	// 사용자가 입력한 정보 가져오기
	String newpw = request.getParameter("newpw");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");

	// 사용자 정보 업데이트 로직 수행
	member.setPw(newpw);
	member.setNickname(nickname);
	member.setEmail(email);
	System.out.println("modinfoAction에서 member 확인"+member.toString());

	int result = memberService.updateMemberInfo(member);
	%>
</body>
<body onload="showAlertAndRedirect('<%=(result == 1) ? "회원정보가 수정되었습니다." : "회원정보 수정에 실패하였습니다. 다시 시도해주세요."%>',
	 '<%=(result == 1) ? "home.jsp" : "modInfo.jsp"%>');">
</body>
</html>