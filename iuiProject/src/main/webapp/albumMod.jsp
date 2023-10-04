<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date,java.text.*"%>
<jsp:useBean id="album" type="iuiProject.AlbumDTO" scope="session" />
<jsp:useBean id="albumService" type="iuiProject.AlbumDAO" scope="session" />
<jsp:useBean id="song" type="iuiProject.SongDTO"  scope="session"/>
<jsp:useBean id="songService" type="iuiProject.SongDAO"  scope="session"/>

<!DOCTYPE html>
<html>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">

<head>
    <meta charset="UTF-8">
    <title>albumMod.jsp</title>
</head>
<%
MemberDTO member = (MemberDTO) session.getAttribute("member");
int albumId = Integer.parseInt(request.getParameter("albumId"));
album = albumService.selectAlbum(albumId);
%>
<body>
	<div class="album-container">
		<% if (album != null) { %>
		<div class="album-cover">
			<img src="image/<%= album.getAlbumCover() %>" alt="앨범 커버">
		</div>

		<div class="album-info">
			<h1><input type="text" id="new_albumName" name="new_albumName"  
			value="<%= album.getAlbumName()%>" required></h1>
			<p>앨범타입: <input type="text" id="new_albumType" name="new_albumType"  
			value="<%= album.getAlbumType()%>" required></p>
			<p>발매일: <input type="text" id="new_releaseDate" name="new_releaseDate"  
			value="<%= album.getReleaseDate()%>" required></p>
			<p>곡 수: <input type="text" id="new_numberSongs" name="new_numberSongs"  
			value="<%= album.getNumberSongs()%>" required></p>
			<p>앨범소개</p>
			<div class="album-intro">
				<textarea rows="8" cols="80" id="new_albumIntro"><%=album.getAlbumIntro()%></textarea>
			</div>
			<button type="button" class="btn btn-primary"
				onclick="updateAlbumAndShowAlbumView(<%=albumId%>);">수정완료
			</button>
		</div>
		<%	} else { %>
		<p>앨범을 찾을 수 없습니다.</p>
		<% } %>
	</div>
	
	<div class="song-container">
		<div class="song-info">
			<table border="1">
				<th>트랙</th>
				<th>곡명</th>
				<th>작사</th>
				<th>작곡</th>
				<th>재생시간</th>
				<th>타이틀</th>
				<%
				for (int i = 0; i < album.getNumberSongs(); i++) {
					song = songService.selectSong(albumId, i + 1);
					if (song != null) {
				%>
				<tr>
					<td><input type="text" id="new_trackNo" name="new_trackNo"  
						value="<%=song.getTrackNo()%>" required></td>
					<td><input type="text" id="new_title" name="new_title"  
						value="<%=song.getTitle()%>" required></td>
					<td><input type="text" id="new_writer" name="new_writer"  
						value="<%=song.getWriter()%>" required></td>
					<td><input type="text" id="new_composer" name="new_composer"  
						value="<%=song.getComposer()%>" required></td>
					<td><input type="text" id="new_playtime" name="new_playtime"  
						value="<%=song.getPlaytime()%>" required></td>
					<td><%=song.getTitleCheck() == 0 ? "" : "&#10003"%></td>
				</tr>
				<%
					}else { %>
				<tr>
					<td colspan="6">곡 정보를 찾을 수 없습니다.</td>
				</tr>
				<%
				break;
				}
				}
				%>
			</table>
		</div>
	</div>
	
</body>
</html>