package iuiProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;

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

	// 회원가입 기능
	public int join(MemberDTO member) throws SQLException {
		Connection conn = pool.getConnection();
		String sql = "INSERT INTO member (id, pw, email, nickname, member_no, status) VALUES (?, ?, ?, ?, member_no.nextval, 1)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt = conn.prepareStatement(sql);
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
		String sql = "SELECT pw FROM member WHERE id = ?";

		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(pw)) {
					System.out.println("로그인 성공");
					result = 1; // 로그인 성공
				} else {
					System.out.println("비밀번호 불일치");
					result = 0; // 비밀번호 불일치
				}
			} else {
				System.out.println("회원정보 없음");
				result = -1; // 아이디가 없음
			}
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		pool.releaseConnection(conn);
		return result;
	}

	// ID,PW 매칭 후 블랙리스트인 사람이면 거부
	public MemberDTO select(String id, String pw) throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		String sql = "SELECT * FROM member WHERE id=? and pw=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		MemberDTO member = null;
		ResultSet rs = pstmt.executeQuery(); // executeQuery 메서드 인자 제거
		while (rs.next()) {
			if (rs.getInt("status") > 0) {
				member = new MemberDTO(
						rs.getInt("member_no"), 
						rs.getString("id"), 
						rs.getString("pw"),
						rs.getString("email"), 
						rs.getString("nickname"), 
						rs.getInt("status"));
			} else {
				// 이 사람은 블랙리스트임
				member = null;
			}
		}
		System.out.println(member);
		rs.close();
		pstmt.close();
		pool.releaseConnection(conn);
		return member;
	}
	
	// 회원번호로 닉네임 찾기
	public String findNicknameByMemberNo(int memberNo) throws SQLException {
	    Connection conn = pool.getConnection();
	    String nickname = null;
	    String sql = "SELECT nickname FROM member WHERE member_no = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, memberNo);
	    ResultSet rs = pstmt.executeQuery();

	    if (rs.next()) {
	        nickname = rs.getString("nickname");
	    }

	    rs.close();
	    pstmt.close();
	    pool.releaseConnection(conn);
	    return nickname;
	}
	
	// 회원정보 수정
	public int updateMemberInfo(MemberDTO member) throws SQLException {
		Connection conn = pool.getConnection();
		String sql = "UPDATE member SET pw = ?, nickname = ?, email = ? WHERE member_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getPw());
		pstmt.setString(2, member.getNickname());
		pstmt.setString(3, member.getEmail());
		pstmt.setInt(4, member.getMemberNo());
		int result = pstmt.executeUpdate();

		pstmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	public ArrayList<String> getAllIds() throws SQLException{
		ArrayList<String> ids = new ArrayList<String>();
		Connection conn = pool.getConnection();
		String sql = "SELECT id FROM member";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
				ids.add(rs.getString("id"));
		}
		rs.close();
		pstmt.close();
		pool.releaseConnection(conn);
		
		return ids;
	}
	
	public ArrayList<MemberDTO> getAllMembers() throws SQLException{
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
		Connection conn = pool.getConnection();
		String sql = "SELECT * FROM member";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		MemberDTO member = null;
		while (rs.next()) {
			if (rs.getInt("status") > 0 &&rs.getInt("status")!=2) {
				member = new MemberDTO(
						rs.getInt("member_no"), 
						rs.getString("id"), 
						rs.getString("pw"),
						rs.getString("email"), 
						rs.getString("nickname"), 
						rs.getInt("status"));
				members.add(member);
			} 
		}
		rs.close();
		pstmt.close();
		pool.releaseConnection(conn);
		
		return members;
	}
	
	public ArrayList<MemberDTO> getAllBlacks() throws SQLException{
		ArrayList<MemberDTO> blacks = new ArrayList<MemberDTO>();
		Connection conn = pool.getConnection();
		String sql = "SELECT * FROM member";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		MemberDTO member = null;
		while (rs.next()) {
			if (rs.getInt("status") <= 0&&rs.getInt("status")!=2) {
				member = new MemberDTO(
						rs.getInt("member_no"), 
						rs.getString("id"), 
						rs.getString("pw"),
						rs.getString("email"), 
						rs.getString("nickname"), 
						rs.getInt("status"));
				blacks.add(member);
			} 
		}
		rs.close();
		pstmt.close();
		pool.releaseConnection(conn);
		
		return blacks;
	}
	
	public int addBlack(int memberNo) throws SQLException {
		Connection conn = pool.getConnection();
		String sql = "UPDATE member SET status = 0 WHERE member_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memberNo);
		int result = pstmt.executeUpdate();

		pstmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	public int revokeBlack(int memberNo) throws SQLException {
		Connection conn = pool.getConnection();
		String sql = "UPDATE member SET status = 1 WHERE member_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memberNo);
		int result = pstmt.executeUpdate();

		pstmt.close();
		pool.releaseConnection(conn);
		return result;
	}
}


