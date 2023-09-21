<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.invalidate();
%>
<script>
	alert('로그아웃');
	location.href = 'main.jsp';
</script>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
</body>
</html>