<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.*"%>

<jsp:useBean id="memberService" type="iuiProject.MemberDAO" scope="application"/>
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blackAction</title>
</head>
<body>
<%
// member_no 값을 가져와서 JavaScript 변수에 할당
int member_no = Integer.parseInt(request.getParameter("member_no"));
int i = memberService.revokeBlack(member_no);

if (i == 1) { 
%>
    <script>
        alert("성공: 정상회원으로 복구");
    </script>
<%
} else {
%>
    <script>
        alert("오류 : 정상회원 복구 실패");
    </script>
<%
}
%>
<script>
    window.location.href = 'admin.jsp';
</script>
</body>
</html>
