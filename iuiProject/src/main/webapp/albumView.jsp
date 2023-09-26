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
	<div class="album-container">
		<% if (album != null) { %>
		<div class="album-cover">
			<img src="image/<%= album.getAlbumCover() %>" alt="앨범 커버">
		</div>

		<div class="album-info">
			<h1><%=album.getAlbumName()%></h1>
			<p>앨범타입: <%=album.getAlbumType()%></p>
			<p><strong>발매일:</strong><%=album.getReleaseDate()%></p>
			<p><strong>곡 수:</strong><%=album.getNumberSongs()%></p>
			<p><strong>앨범소개</strong></p>
			<div class="album-intro">
				<textarea rows="8" cols="80" readonly><%=album.getAlbumIntro()%></textarea>
			</div>
			<button type="button" class="btn btn-primary" 
						 onclick="albumview('albumMod.jsp?albumId=<%=album.getAlbumId()%>')">정보수정</button>
		</div>
		<%
		} else {
		%>
		<p>앨범을 찾을 수 없습니다.</p>
		<%
		}
		%>
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
					<td><%=song.getTrackNo()%></td>
					<td><%=song.getTitle()%></td>
					<td><%=song.getWriter()%></td>
					<td><%=song.getComposer()%></td>
					<td><%=song.getPlaytime()%></td>
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

	<script>
	function albummod(i) {
		console.log('함수가 albumId와 함께 호출되었습니다:', i);
	    // AJAX 요청 생성
	    const xhr = new XMLHttpRequest();
	    const target = 'albumMod.jsp?albumId=' + i;
	    console.log(target);
	    
	    // 요청을 보낼 페이지 URL 설정
	    xhr.open('GET', target, true);

	    // 요청이 완료되면 실행될 함수 정의
	    xhr.onload = function () {
	        if (xhr.status === 200) {
	            // 응답으로 받은 HTML을 section 요소에 삽입
	            document.querySelector('section').innerHTML = xhr.responseText;
	            // 이전 페이지로 돌아가기 기능 활성화
	            /* window.history.pushState({ page: "album", albumId: i }, null, target); */
	        } else {
	            alert('페이지 로드 중 오류가 발생했습니다.');
	        }
	    };
	    
	    // 요청 보내기
	    xhr.send();
	}
	 
	 window.onpopstate = function(event) {
    if (event.state && event.state.page === "album") {
        test(event.state.albumId);
    } else {
        // 이전 페이지가 없거나 album 페이지가 아닌 경우 메인 페이지로 이동
        if(member==null){
        	window.location.href = 'main.jsp';
        }else window.location.href = 'home.jsp';
    }
};
</script>

</body>

</html>
