<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date,java.text.*"%>
<jsp:useBean id="commentService" type="iuiProject.UserCommentDAO" scope="session" />

<head>
<meta charset="UTF-8">
<title>commentUpdateAction.jsp</title>
</head>

<html>
<body>
	<%
	int commentId = Integer.parseInt(request.getParameter("commentId"));
	String newText = request.getParameter("newComment");

	UserCommentDTO c = commentService.selectComment(commentId);
	commentService.updateComment(c, newText);
	%>
</body>
</html>