<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date,java.text.*"%>

<jsp:useBean id="album" type="iuiProject.AlbumDTO" scope="session" />
<jsp:useBean id="albumService" type="iuiProject.AlbumDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>albumModAction.jsp</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
String newAlbumName = request.getParameter("newAlbumName");
String newAlbumType = request.getParameter("newAlbumType");

String releaseDateString = request.getParameter("newReleaseDate");
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date newReleaseDate = dateFormat.parse(releaseDateString);

int newNumberSongs = Integer.parseInt(request.getParameter("newNumberSongs"));
String newAlbumIntro = request.getParameter("newAlbumIntro");
int newAlbumId = Integer.parseInt(request.getParameter("newAlbumId"));

AlbumDTO m = new AlbumDTO();
m.setAlbumName(newAlbumName);
m.setAlbumType(newAlbumType);
m.setReleaseDate(newReleaseDate);
m.setNumberSongs(newNumberSongs);
m.setAlbumIntro(newAlbumIntro);
m.setAlbumId(newAlbumId);

albumService.updateAlbum(m);
%>
</body>
</html>