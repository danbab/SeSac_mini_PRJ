<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date"%>
<jsp:useBean id="member" class="iuiProject.MemberDTO"/>
<jsp:useBean id="service" class="iuiProject.MemberDAO"/>
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
System.out.println("여기는 registerAction: "+ member.toString());
int result = service.join(member);

if (result == 1) { // 회원가입이 성공한 경우
%>
<body onload="showAlertAndRedirect('회원가입이 완료되었습니다.', 'main.jsp');">


result:<%=result %><br>
아이디:<%=member.getId() %><br>
비밀번호:<%=member.getPw() %><br>
닉네임:<%=member.getNickname() %><br>
이메일:<%=member.getEmail() %>
</body>
<%
} else { // 회원가입 실패한 경우
%>
<body onload="showAlertAndRedirect('회원가입에 실패하였습니다. 다시 시도해주세요.', 'register.jsp');">
result:<%=result %><br>
아이디:<%=member.getId() %><br>
비밀번호:<%=member.getPw() %><br>
닉네임:<%=member.getNickname() %><br>
이메일:<%=member.getEmail() %>
</body>
<%
}
%>
</html>
