package iuiProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;
	private ResultSet rs;
	

	public MemberDAO() {
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

	/*
	 * // 회원가입 기능 public int join(MemberDTO member) throws SQLException { Connection
	 * conn = pool.getConnection();
	 * System.out.println("이곳은 DAO "+member.toString()); String SQL =
	 * "INSERT INTO MEMBER (id, pw, email, nickname, member_no, status) VALUES (?, ?, ?, ?, member_no.nextval, 1)"
	 * ; PreparedStatement pstmt = conn.prepareStatement(SQL); try { pstmt =
	 * conn.prepareStatement(SQL); pstmt.setString(1, member.getId());
	 * pstmt.setString(2, member.getPw()); pstmt.setString(3, member.getEmail());
	 * pstmt.setString(4, member.getNickname()); return pstmt.executeUpdate(); }
	 * catch (Exception e) { e.printStackTrace(); } pstmt.close();
	 * pool.releaseConnection(conn); return -1; }
	 */
		// 회원가입 기능
		public int join(MemberDTO member) throws SQLException {
			Connection conn = pool.getConnection();
			System.out.println("이곳은 DAO "+member.toString());
			String SQL = "INSERT INTO MEMBER (id, pw, email, nickname, member_no, status) VALUES (?, ?, ?, ?, member_no.nextval, 1)";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPw());
				pstmt.setString(3, member.getEmail());
				pstmt.setString(4, member.getNickname());
				int result = pstmt.executeUpdate();
			
			pstmt.close();
			pool.releaseConnection(conn);
			return result;
		}

	// 회원 로그인 기능
	public int login(String id, String pw) throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		String SQL = "SELECT pw FROM MEMBER WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(SQL);

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(pw)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		pstmt.close();
		pool.releaseConnection(conn);
		return -2; // 데이터베이스 오류
	}
}