package iuiProject;

import java.sql.Timestamp;
import java.util.*;

public class UserCommentDTO {
	private int commentId;

	private int albumId;

	private int memberNo;

	private String text;

	private Timestamp timestamp;

	public UserCommentDTO() {
		super();
	}

	public UserCommentDTO(int commentId, int albumId, int memberNo, String text, Timestamp timestamp) {
		super();
		this.commentId = commentId;
		this.albumId = albumId;
		this.memberNo = memberNo;
		this.text = text;
		this.timestamp = timestamp;
	}

	public int getCommentId() {
		return commentId;
	}

	public int getAlbumId() {
		return albumId;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public String getText() {
		return text;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	@Override
	public String toString() {
		return "UserCommentDTO [commentId=" + commentId + ", albumId=" + albumId + ", memberNo=" + memberNo + ", text="
				+ text + ", timestamp=" + timestamp + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(albumId, commentId, memberNo, text, timestamp);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserCommentDTO other = (UserCommentDTO) obj;
		return albumId == other.albumId && commentId == other.commentId && memberNo == other.memberNo
				&& Objects.equals(text, other.text) && Objects.equals(timestamp, other.timestamp);
	}
}