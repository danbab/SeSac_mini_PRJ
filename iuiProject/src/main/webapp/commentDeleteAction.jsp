<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuiProject.*, java.sql.SQLException" %>

<%
int commentId = Integer.parseInt(request.getParameter("commentId"));

UserCommentDAO commentDAO = new UserCommentDAO();
try {
    int result = commentDAO.deleteComment(commentId);
    if (result > 0) {
        response.getWriter().write("success");
    } else {
        response.getWriter().write("댓글 삭제에 실패했습니다.");
    }
} catch (SQLException e) {
    response.getWriter().write("댓글 삭제 중 오류가 발생했습니다.");
    e.printStackTrace();
}
%>