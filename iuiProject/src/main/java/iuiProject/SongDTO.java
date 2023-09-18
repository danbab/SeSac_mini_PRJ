package iuiProject;

import java.util.*;

public class SongDTO {
	private int albumId;

	private int trackNo;

	private String title;

	private String writer;

	private String composer;

	private String playtime;

	private int titleCheck;

	public SongDTO() {
		super();
	}

	public SongDTO(int albumId, int trackNo, String title, String writer, String composer, String playtime,
			int titleCheck) {
		super();
		this.albumId = albumId;
		this.trackNo = trackNo;
		this.title = title;
		this.writer = writer;
		this.composer = composer;
		this.playtime = playtime;
		this.titleCheck = titleCheck;
	}

	public int getAlbumId() {
		return albumId;
	}

	public int getTrackNo() {
		return trackNo;
	}

	public String getTitle() {
		return title;
	}

	public String getWriter() {
		return writer;
	}

	public String getComposer() {
		return composer;
	}

	public String getPlaytime() {
		return playtime;
	}

	public int getTitleCheck() {
		return titleCheck;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public void setTrackNo(int trackNo) {
		this.trackNo = trackNo;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setComposer(String composer) {
		this.composer = composer;
	}

	public void setPlaytime(String playtime) {
		this.playtime = playtime;
	}

	public void setTitleCheck(int titleCheck) {
		this.titleCheck = titleCheck;
	}

	/*
	 * @Override public String toString() { return "SongDTO [albumId=" + albumId +
	 * "]"; }
	 * 
	 * @Override public int hashCode() { return Objects.hash(albumId, composer,
	 * playtime, title, titleCheck, trackNo, writer); }
	 * 
	 * @Override public boolean equals(Object obj) { if (this == obj) return true;
	 * if (obj == null) return false; if (getClass() != obj.getClass()) return
	 * false; SongDTO other = (SongDTO) obj; return albumId == other.albumId &&
	 * Objects.equals(composer, other.composer) && Objects.equals(playtime,
	 * other.playtime) && Objects.equals(title, other.title) && titleCheck ==
	 * other.titleCheck && trackNo == other.trackNo && Objects.equals(writer,
	 * other.writer); }
	 */
}