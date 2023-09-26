package iuiProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SongDAO {
	// 데이터베이스 연결 관련 필드
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;

	public SongDAO() {
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

	// 노래 추가
	public int addSong(SongDTO song) throws SQLException {
		Connection conn = pool.getConnection();
		String sql = "INSERT INTO song (album_id, track_no, title, writer, composer, playtime, title_check) VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, song.getAlbumId());
		pstmt.setInt(2, song.getTrackNo());
		pstmt.setString(3, song.getTitle());
		pstmt.setString(4, song.getWriter());
		pstmt.setString(5, song.getComposer());
		pstmt.setString(6, song.getPlaytime());
		pstmt.setInt(7, song.getTitleCheck());
		int result = pstmt.executeUpdate();

		pstmt.close();
		pool.releaseConnection(conn);
		if (result > 0) {
			return 1;
		} else
			return 0;
	}
	
	// 노래 조회
	public SongDTO selectSong(int albumId, int trackNo) throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		String sql = "SELECT * FROM song WHERE album_id = ? AND track_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, albumId);
	    pstmt.setInt(2, trackNo);
	    ResultSet rs = pstmt.executeQuery();
		SongDTO song = null;
		if (rs.next()) {
			song = new SongDTO(
					rs.getInt("album_id"), 
					rs.getInt("track_no"), 
					rs.getString("title"),
					rs.getString("writer"), 
					rs.getString("composer"), 
					rs.getString("playtime"),
					rs.getInt("title_check"));
		}
		
		pstmt.close();
		pool.releaseConnection(conn);
		return song;
	}
	
	// 노래 전체목록 조회
	public List<SongDTO> selectAllSongs() throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		List<SongDTO> songs = new ArrayList<>();
		String sql = "SELECT * FROM song";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		SongDTO song = null;
		while (rs.next()) {
			song = new SongDTO(
					rs.getInt("album_id"), 
					rs.getInt("track_no"), 
					rs.getString("title"),
					rs.getString("writer"), 
					rs.getString("composer"), 
					rs.getString("playtime"),
					rs.getInt("title_check"));
			songs.add(song);
		}

		rs.close();
		pstmt.close();
		pool.releaseConnection(conn);
		return songs;
	}
	
	// 노래 업데이트
		public int updateSong(SongDTO song) throws SQLException, ClassNotFoundException {
			Connection conn = pool.getConnection();
			String sql = "UPDATE song SET title = ?, writer = ?, composer = ?, playtime = ?, title_check = ? WHERE album_id = ? AND track_no = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, song.getTitle());
			pstmt.setString(2, song.getWriter());
			pstmt.setString(3, song.getComposer());
			pstmt.setString(4, song.getPlaytime());
			pstmt.setInt(5, song.getTitleCheck());
			pstmt.setInt(6, song.getAlbumId());
			pstmt.setInt(7, song.getTrackNo());
			int result = pstmt.executeUpdate();

			pstmt.close();
			pool.releaseConnection(conn);
			if (result > 0) {
				return 1;
			} else
				return 0;
		}
		
	// 노래 삭제
	public int deleteSong(int albumId, int trackNo) throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		String sql = "DELETE FROM song WHERE album_id = ? AND track_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, albumId);
		pstmt.setInt(2, trackNo);
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		pool.releaseConnection(conn);
		if (result > 0) {
			return 1;
		} else
			return 0;
	}
}