<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date"%>
<jsp:useBean id="album" class="iuiProject.AlbumDTO"></jsp:useBean>
<jsp:useBean id="albumService" class="iuiProject.AlbumDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="styles.css">

<head>
    <meta charset="UTF-8">
    <title>앨범 정보 페이지</title>
</head>
<%
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
            <h1><%= album.getAlbumName()%></h1>
            <p>앨범타입: <%= album.getAlbumType() %></p>
            <p><strong>발매일:</strong> <%= album.getReleaseDate() %></p>
            <p><strong>곡 수:</strong> <%= album.getNumberSongs() %></p>
            <p><strong>앨범소개</strong></p>
            <div class="album-intro">
                <textarea rows="8" cols="50" readonly><%= album.getAlbumIntro() %></textarea>
            </div>
        </div>
    <% } else { %>
        <p>앨범을 찾을 수 없습니다.</p>
    <% } %>
</div>
</body>
</html>
