package iuiProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserCommentDAO {
	// 데이터베이스 연결 관련 필드
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;

	// 생성자에서 데이터베이스 연결 초기화
	public UserCommentDAO() {
		super();
		// jdbc 1단계
		try {
			Class.forName(jdbcclass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// jdbc Connection 관리 -> ConnectionPool이 관리
		try {
			pool = ConnectionPool.getInstance(url, user, password, 3, 5, true, 500);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 댓글 추가
	public int addComment(UserCommentDTO comment) throws SQLException {
		Connection conn = pool.getConnection();
		String sql = "INSERT INTO user_comment (album_id, comment_id, member_no, text, timestamp1) VALUES (?,comment_id_seq.nextval, ?, ?, sysdate)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, comment.getAlbumId());
		pstmt.setInt(2, comment.getMemberNo());
		pstmt.setString(3, comment.getText());
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		pool.releaseConnection(conn);
		if (result > 0) {
			return 1;
		} else
			return 0;
	}
	
	// 댓글 조회
	public UserCommentDTO selectComment(int commentId) throws SQLException, ClassNotFoundException {
	    Connection conn = pool.getConnection();
	    UserCommentDTO comment = null;
	    String sql = "SELECT * FROM user_comment WHERE comment_id = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, commentId);
	    ResultSet rs = pstmt.executeQuery();

	    if (rs.next()) {
	        comment = new UserCommentDTO(
	                rs.getInt("comment_id"),
	                rs.getInt("album_id"),
	                rs.getInt("member_no"),
	                rs.getString("text"),
	                rs.getTimestamp("timestamp1"));
	    }

	    rs.close();
	    pstmt.close();
	    pool.releaseConnection(conn);
	    return comment;
	}

	
	// 댓글 업데이트
	public int updateComment(UserCommentDTO comment) throws SQLException {
	    Connection conn = pool.getConnection();
	    String sql = "UPDATE user_comment SET text = ?, timestamp1 = sysdate WHERE comment_id = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, comment.getText());
	    pstmt.setInt(2, comment.getCommentId());
	    int result = pstmt.executeUpdate();

	    pstmt.close();
	    pool.releaseConnection(conn);
	    if (result > 0) {
	        return 1;
	    } else {
	        return 0;
	    }
	}

	// 댓글 삭제
	public int deleteComment(int commentId) throws SQLException {
	    Connection conn = pool.getConnection();
	    String sql = "DELETE FROM user_comment WHERE comment_id = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, commentId);
	    int result = pstmt.executeUpdate();

	    pstmt.close();
	    pool.releaseConnection(conn);
	    if (result > 0) {
	        return 1;
	    } else {
	        return 0;
	    }
	}

	public List<UserCommentDTO> getCommentsByAlbum(int albumId) throws SQLException, ClassNotFoundException {
	    Connection conn = pool.getConnection();
	    List<UserCommentDTO> comments = new ArrayList<>();
	    String sql = "SELECT * FROM user_comment WHERE album_id = ? ORDER BY timestamp1 DESC";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, albumId);
	    ResultSet rs = pstmt.executeQuery();
	    UserCommentDTO comment = null;
	    while (rs.next()) {
	        comment = new UserCommentDTO(
	                rs.getInt("comment_id"),
	                rs.getInt("album_id"),
	                rs.getInt("member_no"),
	                rs.getString("text"),
	                rs.getTimestamp("timestamp1"));
	        comments.add(comment);
	    }

	    rs.close();
	    pstmt.close();
	    pool.releaseConnection(conn);
	    return comments;
	}
}