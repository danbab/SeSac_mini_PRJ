<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date,java.text.*"%>
<jsp:useBean id="comment" type="iuiProject.UserCommentDTO" scope="session" />
<jsp:useBean id="commentService" type="iuiProject.UserCommentDAO" scope="session" />

<head>
<meta charset="UTF-8">
<title>commentDeleteAction.jsp</title>
</head>

<%
int commentId = Integer.parseInt(request.getParameter("commentId"));
commentService.deleteComment(commentId);
%>