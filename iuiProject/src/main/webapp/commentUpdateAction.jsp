<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuiProject.*, java.sql.SQLException" %>

<%
String commentContent = request.getParameter("comment");
int commentId = Integer.parseInt(request.getParameter("commentId"));

UserCommentDTO comment = new UserCommentDTO();
comment.setCommentId(commentId);
comment.setText(commentContent);

UserCommentDAO commentDAO = new UserCommentDAO();
try {
    int result = commentDAO.updateComment(comment);
    if (result > 0) {
        response.getWriter().write("success");
    } else {
        response.getWriter().write("댓글 수정에 실패했습니다.");
    }
} catch (SQLException e) {
    response.getWriter().write("댓글 수정 중 오류가 발생했습니다.");
    e.printStackTrace();
}
%>