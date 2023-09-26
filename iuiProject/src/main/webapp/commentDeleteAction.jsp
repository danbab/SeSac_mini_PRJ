<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comment" class="iuiProject.UserCommentDTO" />
<jsp:useBean id="CommentService" class="iuiProject.UserCommentDAO" />

<%
try {
    int deleteCommentId = Integer.parseInt(request.getParameter("deleteCommentId"));
    int albumId = Integer.parseInt(request.getParameter("albumId"));

    int isCommentDeleted = CommentService.deleteComment(deleteCommentId);

    if (isCommentDeleted == 1) {
        // 댓글 삭제 성공 시, 앨범 페이지로 리다이렉트
    	response.sendRedirect("home.jsp?albumId=" + comment.getAlbumId());
    } else {
        // 댓글 삭제 실패 시, 에러 메시지를 표시하거나 다른 처리를 수행
        out.println("댓글 삭제에 실패했습니다.");
    }
} catch (Exception e) {
    // 예외 처리: 데이터베이스 오류 또는 파라미터 오류 등에 대한 처리
    e.printStackTrace();
    out.println("오류가 발생했습니다.");
}
%>