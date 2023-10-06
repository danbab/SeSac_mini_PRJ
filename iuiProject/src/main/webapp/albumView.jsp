<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.*"%>
<jsp:useBean id="album" type="iuiProject.AlbumDTO" scope="session" />
<jsp:useBean id="albumService" type="iuiProject.AlbumDAO" scope="session" />
<jsp:useBean id="song" class="iuiProject.SongDTO" scope="session"/>
<jsp:useBean id="songService" class="iuiProject.SongDAO" scope="session"/>
<jsp:useBean id="commentService" type="iuiProject.UserCommentDAO" scope="session"/>
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session" />
<jsp:useBean id="memberService" type="iuiProject.MemberDAO" scope="application" />

<!DOCTYPE html>
<html>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">

<head>
<meta charset="UTF-8">
<title>albumView.jsp</title>
</head>
<%
int albumId = Integer.parseInt(request.getParameter("albumId"));
album = albumService.selectAlbum(albumId);
%>
<body>
	<!-- 앨범 정보 -->
	<div class="album-container">
		<%
		if (album != null) {
		%>
		<div class="album-cover">
			<img src="image/<%=album.getAlbumCover()%>" alt="앨범 커버">
		</div>

		<div class="album-info">
			<h1><%=album.getAlbumName()%></h1>
			<p>앨범타입: <%=album.getAlbumType()%></p>
			<p><strong>발매일: </strong><%=album.getReleaseDate()%></p>
			<p><strong>곡 수: </strong><%=album.getNumberSongs()%></p>
			<p><strong>앨범소개</strong></p>
			<div class="album-intro">
				<textarea rows="8" cols="80" readonly><%=album.getAlbumIntro()%></textarea>
			</div>
			<%if (member != null) {%>
			<button type="button" class="btn btn-primary"
				onclick="albumview('albumMod.jsp?albumId=<%=album.getAlbumId()%>')">정보수정</button>
			<%
			}
			%>
		</div>
		<%
		} else {
		%>
		<p>앨범을 찾을 수 없습니다.</p>
		<%
		}
		%>
	</div>

	<!-- 곡 정보 -->
	<div class="song-container">
		<div class="song-info">
			<table class="table" border="1">
				<thead class="table-light">
					<th>트랙</th>
					<th>곡명</th>
					<th>작사</th>
					<th>작곡</th>
					<th>재생시간</th>
					<th>타이틀</th>
				</thead>
				<%
				for (int i = 0; i < album.getNumberSongs(); i++) {
					song = songService.selectSong(albumId, i + 1);
				%>
				<tr>
					<td><%=song.getTrackNo()%></td>
					<td><%=song.getTitle()%></td>
					<td><%=song.getWriter()%></td>
					<td><%=song.getComposer()%></td>
					<td><%=song.getPlaytime()%></td>
					<td><%=song.getTitleCheck() == 0 ? "" : "&#10003"%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>

	<!-- 	댓글 컨테이너 -->
	<div class="comment-container">
		<h4>댓글</h4>
		<div>
			<table class="table" border="1">
				<thead class="table-light">
					<th>사용자</th>
					<th>댓글 내용</th>
					<th>작성일자</th>
				</thead>
				<%
 			List<UserCommentDTO> comments =commentService.getCommentsByAlbum(albumId);
 			if(comments.size() != 0) {	
 			for (int i = 0; i < comments.size(); i++) {
 					UserCommentDTO comment = comments.get(i);
			%>
				<tr data-comment-id="<%=comment.getCommentId()%>">
					<td><%=memberService.findNicknameByMemberNo(comment.getMemberNo())%></td>
					<td><%=comment.getText()%></td>
					<td class="regdate"><%=comment.getTimestamp()%>
						<div class="row">
							<!-- 로그인 되어 있고, 댓글 작성자이면 수정,삭제 가능 -->
							<%if( member!=null &&comment.getMemberNo()==member.getMemberNo() ){ %>
							<button type="button" class="update-btn"
								onclick="showEditForm(<%=comment.getCommentId()%>)">수정</button>
							<button type="button" class="delete-btn"
								onclick="deleteCommentAndShowAlbumView(<%=comment.getCommentId()%>,<%=album.getAlbumId()%>)">
							삭제</button>
							<% } %>

							<!-- 관리자면 삭제가능 -->
							<%if(member!=null && member.getStatus() == 2){ %>
							<button type="button" class="delete-btn"
								onclick="deleteCommentAndShowAlbumView(<%=comment.getCommentId()%>,<%=album.getAlbumId()%>)">댓글
								삭제</button>
							<% } %>
						</div></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr><td colspan="3">댓글이 없습니다</td></tr>
				<% } %>
			</table>
		</div>

		<!-- 댓글 작성 폼(로그인한 회원만 댓글작성창 뜸) -->
		<%if (member != null && member.getStatus() == 1) {%>
		<form class="comment-form">
			<!-- 댓글 ID (수정 시 사용) -->
			<input type="hidden" id="albumId" name="albumId"
				value="<%=album.getAlbumId()%>"> <input type="hidden"
				id="memberNo" name="memberNo" value="<%=member.getMemberNo()%>">
			<label for="nickname">닉네임:</label> <input type="text" id="nickname"
				name="nickname" value="<%=member.getNickname()%>" readonly required><br>
			<!-- 댓글 내용 입력란 -->
			<label for="comment">내용:</label>
			<textarea id="comment" name="comment" rows="4" cols="100" required></textarea>
			<br>

			<!-- 댓글 작성 -->
			<div class="comment-sub-upd-del-btn">
				<button type="button" class="btn btn-primary"
					onclick="submitCommentAndShowAlbumView(<%=album.getAlbumId()%>);">댓글 작성</button>
			</div>
		</form>
		<%}%>
	</div>
</body>
</html>