<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.*"%>
<jsp:useBean id="album" type="iuiProject.AlbumDTO" scope="session" />
<jsp:useBean id="albumService" type="iuiProject.AlbumDAO" scope="session" />
<jsp:useBean id="song" class="iuiProject.SongDTO"/>
<jsp:useBean id="songService" class="iuiProject.SongDAO"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">

<head>
<meta charset="UTF-8">
<title>앨범 정보 페이지</title>
</head>
<%
int albumId = Integer.parseInt(request.getParameter("albumId"));
album = albumService.selectAlbum(albumId);
MemberDTO member = (MemberDTO) session.getAttribute("member");
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
			<%}%>
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

	<!-- 댓글 컨테이너 -->
	<div class="comment-container">
		<h4>댓글</h4>
		<table class="table" border="1">
			<thead class="table-light">
				<th>사용자</th>
				<th>댓글 내용</th>
				<th>작성일자</th>
			</thead>
		</table>

		<!-- 댓글 작성 폼(로그인한 회원만 댓글작성창 뜸) -->
		<%if (member != null && member.getStatus() == 1) {%>
		<form class="comment-form">
			<!-- 댓글 ID (수정 시 사용) -->
			<input type="hidden" id="commentId" name="commentId" value="">
			<label for="nickname">닉네임:</label> <input type="text" id="nickname"
				name="nickname" value="<%=member.getNickname()%>" readonly required><br>
			<!-- 댓글 내용 입력란 -->
			<label for="comment">내용:</label>
			<textarea id="commentText" name="comment" rows="4" cols="100" required></textarea><br>

			<!-- 댓글 작성, 수정, 삭제 버튼 -->
			<div class="comment-sub-upd-del-btn">
				<input type="button" value="댓글 작성"> 
				<input type="button" value="댓글 수정"> 
				<input type="button" value="댓글 삭제">
			</div>
		</form>
		<%
		}
		%>
	</div>

	<script>
		window.onpopstate = function(event) {
			if (event.state && event.state.page === "album") {
				test(event.state.albumId);
			} else {
				// 이전 페이지가 없거나 album 페이지가 아닌 경우 메인 페이지로 이동
				if (member == null) {
					window.location.href = 'main.jsp';
				} else
					window.location.href = 'home.jsp';
			}
		};
	</script>
</body>
</html>