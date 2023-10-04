<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date,java.text.*"%>
<jsp:useBean id="commentService" type="iuiProject.UserCommentDAO" scope="session" />
<head>
<meta charset="UTF-8">
<title>commentSubmitAction.jsp</title>
</head>

<html>
<body>
	<%
	int albumId = Integer.parseInt(request.getParameter("albumId"));
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	String text = request.getParameter("comment");
	UserCommentDTO c = new UserCommentDTO();
	c.setAlbumId(albumId);
	c.setMemberNo(memberNo);
	c.setText(text);
	commentService.addComment(c);
	%>
</body>
</html>