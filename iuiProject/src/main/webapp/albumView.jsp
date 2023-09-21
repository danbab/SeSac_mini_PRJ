<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
int albumId=Integer.parseInt(request.getParameter("albumId"));
%>
<body>
여기는 <%=albumId %>의 view 페이지 입니다
</body>
</html>