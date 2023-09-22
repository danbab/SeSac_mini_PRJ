package iuiProject;

import java.util.Objects;

public class MemberDTO {
	private int memberNo;

	private String id;

	private String pw;

	private String email;

	private String nickname;

	private int status;

	public MemberDTO() {
		super();
	}

	public MemberDTO(String id, String pw, String email, String nickname) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.nickname = nickname;
	}

	public MemberDTO(int memberNo, String id, String pw, String email, String nickname, int status) {
		super();
		this.memberNo = memberNo;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.nickname = nickname;
		this.status = status;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getEmail() {
		return email;
	}

	public String getNickname() {
		return nickname;
	}

	public int getStatus() {
		return status;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MemberDTO [memberNo=" + memberNo + ", id=" + id + ", pw=" + pw + ", email=" + email + ", nickname="
				+ nickname + ", status=" + status + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(email, id, memberNo, nickname, pw, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDTO other = (MemberDTO) obj;
		return Objects.equals(email, other.email) && Objects.equals(id, other.id) && memberNo == other.memberNo
				&& Objects.equals(nickname, other.nickname) && Objects.equals(pw, other.pw) && status == other.status;
	}
}