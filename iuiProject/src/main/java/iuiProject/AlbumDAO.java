package iuiProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        String sql = "INSERT INTO album (album_Id, album_name, release_date, album_Type, number_songs, album_intro, album_cover) " +
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
        String sql = "SELECT * FROM album WHERE album_id = ?";
        AlbumDTO album=null;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, albumId);

            ResultSet resultSet = pstmt.executeQuery();
            
            if (resultSet.next()) {
                album = mapResultSetToAlbum(resultSet);
            }
            resultSet.close();
            pstmt.close();
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        pool.releaseConnection(conn);
        return album;
    }

    // 모든 앨범 조회
    public List<AlbumDTO> getAllAlbums() throws SQLException {
    	Connection conn = pool.getConnection();
        List<AlbumDTO> albums = new ArrayList<>();
        String sql = "SELECT * FROM album ORDER BY release_date desc" ;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                albums.add(mapResultSetToAlbum(resultSet));
               
            } resultSet.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
       
        pool.releaseConnection(conn);
        return albums;
    }

    // ResultSet에서 AlbumDTO 객체로 매핑
    private AlbumDTO mapResultSetToAlbum(ResultSet resultSet) throws SQLException {
    	Connection conn = pool.getConnection();
    	int albumId = resultSet.getInt("album_id");
        String albumName = resultSet.getString("album_name");
        Date releaseDate = resultSet.getDate("release_date");
        String albumType = resultSet.getString("album_type");
        int numberSongs = resultSet.getInt("number_songs");
        String albumIntro = resultSet.getString("album_intro");
        String albumCover = resultSet.getString("album_cover");
       
		pool.releaseConnection(conn);
        
        return new AlbumDTO(albumId, albumName, releaseDate, albumType, numberSongs, albumIntro, albumCover);
    }

    // 앨범 업데이트
    public boolean updateAlbum(AlbumDTO album) throws SQLException {
    	Connection conn = pool.getConnection();
        String sql = "UPDATE album SET album_Name = ?, release_Date = ?, album_Type = ?, number_Songs = ?, album_Intro = ?" +
                     "WHERE album_Id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, album.getAlbumName());
            pstmt.setDate(2, new java.sql.Date(album.getReleaseDate().getTime()));
            pstmt.setString(3, album.getAlbumType());
            pstmt.setInt(4, album.getNumberSongs());
            pstmt.setString(5, album.getAlbumIntro());
            pstmt.setInt(6, album.getAlbumId());

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
        String sql = "DELETE FROM album WHERE album_Id = ?";
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
    
    
    public Map<String, List<AlbumDTO>> loadAlbumByYear(List<AlbumDTO> albums) {
    	Map<String, List<AlbumDTO>> years = new HashMap<>();
    	SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");
    	for(AlbumDTO a : albums) {
    		Date releaseDate = a.getReleaseDate();
            String yyyy = yearFormat.format(releaseDate);
            
            if (years.containsKey(yyyy)) {
                years.get(yyyy).add(a); // 이미 연도가 있는 경우, 해당 연도의 리스트에 추가
            } else {
                List<AlbumDTO> yearAlbums = new ArrayList<>();
                yearAlbums.add(a);
                years.put(yyyy, yearAlbums); // 연도가 없는 경우, 새로운 연도로 매핑
            }
    	}
    	return years;
    }
}
