<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.*"%>
<jsp:useBean id="member" class="iuiProject.MemberDTO" />
<jsp:useBean id="memberService" class="iuiProject.MemberDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerAction.jsp</title>
<script>
	function showAlertAndRedirect(message, redirectTo) {
		alert(message);
		window.location.href = redirectTo;
	}
</script>
</head>
<jsp:setProperty property="*" name="member"/>
<%
// 회원가입 로직 수행
System.out.println("여기는 registerAction: " + member.toString());
ArrayList<String> ids = memberService.getAllIds();
if(!ids.contains(member.getId())){
int result = memberService.join(member);

if (result == 1) { // 회원가입이 성공한 경우
%>
<body onload="showAlertAndRedirect('회원가입이 완료되었습니다.', 'main.jsp');">
</body>
<%
} else { // 회원가입 실패한 경우
%>
<body
	onload="showAlertAndRedirect('회원가입에 실패하였습니다. 다시 시도해주세요.', 'register.jsp');">
</body>
<%
}
}else{%>
	<body
	onload="showAlertAndRedirect('이미 존재하는 아이디입니다. 다시 시도해주세요.', 'register.jsp');">
</body>
<%}
%>
</html>