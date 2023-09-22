<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*"%>
<jsp:useBean id="memberService" type="iuiProject.MemberDAO" scope="application"/>
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<div class="modInfo-logo">
		<a href="home.jsp"> <img src="logo.jpg"	alt="iui 홈페이지">
		</a>
	</div>
	<div class="modInfo-container">
		<h2>회원정보 수정</h2>
		<form class="modInfo-form" action="modInfoAction.jsp" method="POST">
			<label for="id">아이디:</label> 
			<input type="text" id="id" name="id" placeholder="아이디" 
			value="<%= member.getId()%>" readonly required>
			
			<label for="currentpw">기존 비밀번호:</label>
			<input type="password" id="currentpw" name="currentpw" placeholder="기존 비밀번호" 
			value="<%= member.getPw()%>" readonly required>
			
			<label for="pw">새 비밀번호:</label> 
			<input type="password" id="newpw" name="newpw" placeholder="변경할 비밀번호" required>
			 
			<label for="nickname">닉네임:</label> 
			<input type="text" id="nickname" name="nickname" placeholder="닉네임" 
			value="<%= member.getNickname()%>" required>
			 
			<label for="email">이메일:</label> 
			<input type="email" id="email" name="email" placeholder="이메일" 
			value="<%= member.getEmail()%>"><br>
			
			<button type="submit">수정</button><br>
			<button type="reset">초기화</button>
		</form>
	</div>
</body>
</html>