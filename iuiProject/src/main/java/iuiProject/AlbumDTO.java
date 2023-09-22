package iuiProject;

import java.util.*;

public class AlbumDTO {
	private int albumId;

	private String albumName;

	private Date releaseDate;

	private String albumType;

	private int numberSongs;

	private String albumIntro;

	private String albumCover;

	public AlbumDTO() {
		super();
	}

	public AlbumDTO(int albumId, String albumName, Date releaseDate, String albumType, int numberSongs,
			String albumIntro, String albumCover) {
		super();
		this.albumId = albumId;
		this.albumName = albumName;
		this.releaseDate = releaseDate;
		this.albumType = albumType;
		this.numberSongs = numberSongs;
		this.albumIntro = albumIntro;
		this.albumCover = albumCover;
	}

	public int getAlbumId() {
		return albumId;
	}

	public String getAlbumName() {
		return albumName;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public String getAlbumType() {
		return albumType;
	}

	public int getNumberSongs() {
		return numberSongs;
	}

	public String getAlbumIntro() {
		return albumIntro;
	}

	public String getAlbumCover() {
		return albumCover;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public void setAlbumType(String albumType) {
		this.albumType = albumType;
	}

	public void setNumberSongs(int numberSongs) {
		this.numberSongs = numberSongs;
	}

	public void setAlbumIntro(String albumIntro) {
		this.albumIntro = albumIntro;
	}

	public void setAlbumCover(String albumCover) {
		this.albumCover = albumCover;
	}

	@Override
	public String toString() {
		return "AlbumDTO [albumId=" + albumId + ", albumName=" + albumName + ", releaseDate=" + releaseDate
				+ ", albumType=" + albumType + ", numberSongs=" + numberSongs + ", albumIntro=" + albumIntro
				+ ", albumCover=" + albumCover + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(albumCover, albumId, albumIntro, albumName, albumType, numberSongs, releaseDate);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AlbumDTO other = (AlbumDTO) obj;
		return Objects.equals(albumCover, other.albumCover) && albumId == other.albumId
				&& Objects.equals(albumIntro, other.albumIntro) && Objects.equals(albumName, other.albumName)
				&& Objects.equals(albumType, other.albumType) && numberSongs == other.numberSongs
				&& Objects.equals(releaseDate, other.releaseDate);
	}
}