<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*"%>
<%-- <jsp:useBean id="service" type="iuiProject.MemberDAO" scope="application"/> --%>
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<!-- 외부 CSS 파일 링크 -->
<!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
<style>
.modifyInfo-container {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	width: 300px;
}

.modifyInfo-container h2 {
	text-align: center;
	margin-bottom: 20px;
}

.modifyInfo-form {
	display: flex;
	flex-direction: column;
}

.modifyInfo-form label {
	margin-bottom: 5px;
}

.modifyInfo-form input {
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.modifyInfo-form button {
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.modifyInfo-form button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<header>
		<div>
			<img src="logo.jpg" width="200" height="100">
		</div>
	</header>
	<div class="modifyInfo-container">
		<h2>회원정보 수정</h2>
		<form class="modifyInfo-form" action="modInfoAction.jsp" method="POST">
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