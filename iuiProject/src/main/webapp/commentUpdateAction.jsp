<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comment" class="iuiProject.UserCommentDTO" />
<jsp:useBean id="CommentService" class="iuiProject.UserCommentDAO" />

<%
int commentId = Integer.parseInt(request.getParameter("commentId"));
String editedCommentText = request.getParameter("editedCommentText");
int albumId = Integer.parseInt(request.getParameter("albumId"));

comment.setCommentId(commentId);
comment.setText(editedCommentText);

int isCommentUpdated = CommentService.updateComment(comment);

if (isCommentUpdated == 1) {
    // 댓글 수정 성공 시, 앨범 페이지로 리다이렉트
	response.sendRedirect("home.jsp?albumId=" + comment.getAlbumId());
} else {
    // 댓글 수정 실패 시, 에러 메시지를 표시하거나 다른 처리를 수행
    System.out.println("댓글 수정에 실패했습니다.");
}
%>