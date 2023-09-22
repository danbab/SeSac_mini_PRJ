package iuiProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AlbumDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;

	public AlbumDAO() {
		super();
		
		try {
			Class.forName(jdbcclass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			pool = ConnectionPool.getInstance(url, user, password, 3, 5, true, 500);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

    // 앨범 추가
    public boolean addAlbum(AlbumDTO album) throws SQLException {
    	Connection conn = pool.getConnection();
        String sql = "INSERT INTO albums (albumId, albumName, releaseDate, albumType, numberSongs, albumIntro, albumCover) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	pstmt.setInt(1, album.getAlbumId());
        	pstmt.setString(2, album.getAlbumName());
        	pstmt.setDate(3, new java.sql.Date(album.getReleaseDate().getTime()));
        	pstmt.setString(4, album.getAlbumType());
        	pstmt.setInt(5, album.getNumberSongs());
        	pstmt.setString(6, album.getAlbumIntro());
        	pstmt.setString(7, album.getAlbumCover());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 앨범 조회 by ID
    public AlbumDTO selectAlbum(int albumId) throws SQLException {
    	Connection conn = pool.getConnection();
        String sql = "SELECT * FROM albums WHERE albumId = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, albumId);

            ResultSet resultSet = pstmt.executeQuery();
            resultSet.close();
            pstmt.close();
            pool.releaseConnection(conn);
            
            if (resultSet.next()) {
                return mapResultSetToAlbum(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
        return null;
    }

    // 모든 앨범 조회
    public List<AlbumDTO> getAllAlbums() throws SQLException {
    	Connection conn = pool.getConnection();
        List<AlbumDTO> albums = new ArrayList<>();
        String sql = "SELECT * FROM albums";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                albums.add(mapResultSetToAlbum(resultSet));
                resultSet.close();
                pstmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
       
        pool.releaseConnection(conn);
        return albums;
    }

    // ResultSet에서 AlbumDTO 객체로 매핑
    private AlbumDTO mapResultSetToAlbum(ResultSet resultSet) throws SQLException {
    	Connection conn = pool.getConnection();
    	int albumId = resultSet.getInt("albumId");
        String albumName = resultSet.getString("albumName");
        Date releaseDate = resultSet.getDate("releaseDate");
        String albumType = resultSet.getString("albumType");
        int numberSongs = resultSet.getInt("numberSongs");
        String albumIntro = resultSet.getString("albumIntro");
        String albumCover = resultSet.getString("albumCover");
       
		pool.releaseConnection(conn);
        
        return new AlbumDTO(albumId, albumName, releaseDate, albumType, numberSongs, albumIntro, albumCover);
    }

    // 앨범 업데이트
    public boolean updateAlbum(AlbumDTO album) throws SQLException {
    	Connection conn = pool.getConnection();
        String sql = "UPDATE albums SET albumName = ?, releaseDate = ?, albumType = ?, numberSongs = ?, albumIntro = ?, albumCover = ? " +
                     "WHERE albumId = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, album.getAlbumName());
            pstmt.setDate(2, new java.sql.Date(album.getReleaseDate().getTime()));
            pstmt.setString(3, album.getAlbumType());
            pstmt.setInt(4, album.getNumberSongs());
            pstmt.setString(5, album.getAlbumIntro());
            pstmt.setString(6, album.getAlbumCover());
            pstmt.setInt(7, album.getAlbumId());

            int rowsAffected = pstmt.executeUpdate();
            
            pstmt.close();
    		pool.releaseConnection(conn);
    		
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 앨범 삭제
    public boolean deleteAlbum(int albumId) throws SQLException {
    	Connection conn = pool.getConnection();
        String sql = "DELETE FROM albums WHERE albumId = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, albumId);

            int rowsAffected = pstmt.executeUpdate();
            pstmt.close();
    		pool.releaseConnection(conn);
    		
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
