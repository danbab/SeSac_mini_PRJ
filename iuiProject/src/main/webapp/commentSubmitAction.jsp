<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comment" class="iuiProject.UserCommentDTO" />
<jsp:useBean id="CommentService" class="iuiProject.UserCommentDAO" />
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session"/>

<%
try {
    String nickname = request.getParameter("nickname");
    String text = request.getParameter("text");
    int albumId = Integer.parseInt(request.getParameter("albumId"));

    comment.setAlbumId(albumId);
    comment.setMemberNo(member.getMemberNo()); // 세션을 통해 가져온 값으로 설정
    comment.setText(text);

    int isCommentAdded = CommentService.addComment(comment);

    if (isCommentAdded > 0) {
        // 댓글 추가 성공 시, 앨범 페이지로 리다이렉트
    	response.sendRedirect("albumView.jsp?albumId=" + comment.getAlbumId());

    } else {
        // 댓글 추가 실패 시, 에러 메시지를 표시하거나 다른 처리를 수행
        out.println("댓글 추가에 실패했습니다.");
    }
} catch (Exception e) {
    // 예외 처리: 데이터베이스 오류 또는 파라미터 오류 등에 대한 처리
    e.printStackTrace();
    out.println("오류가 발생했습니다.");
} finally {
    // 필요한 자원을 닫는다 (예: 데이터베이스 연결 등)
    // CommentService.close(); // CommentService가 자원을 닫는 메서드를 제공하는 경우 호출
}
%>