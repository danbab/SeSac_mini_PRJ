<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="iuiProject.*, java.sql.SQLException"%>

<%
String action = request.getParameter("action");

// 댓글 작성
if (action.equals("addComment")) {
    String commentContent = request.getParameter("comment");
    int albumId = Integer.parseInt(request.getParameter("albumId"));
    MemberDTO member = (MemberDTO) session.getAttribute("member");

    if (member != null && member.getStatus() == 1) {
        UserCommentDTO comment = new UserCommentDTO();
        comment.setAlbumId(albumId);
        comment.setMemberNo(member.getMemberNo());
        comment.setText(commentContent);

        UserCommentDAO commentDAO = new UserCommentDAO();
        try {
            int result = commentDAO.addComment(comment);
            if (result > 0) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("댓글 추가에 실패했습니다.");
            }
        } catch (SQLException e) {
            response.getWriter().write("댓글 추가 중 오류가 발생했습니다.");
            e.printStackTrace();
        }
    } else {
        response.getWriter().write("로그인이 필요합니다.");
    }
}

//댓글 수정
else if (action.equals("updateComment")) {
    int commentId = Integer.parseInt(request.getParameter("commentId"));
    String commentContent = request.getParameter("comment");
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
}

// 댓글 삭제
else if (action.equals("deleteComment")) {
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
}
%>