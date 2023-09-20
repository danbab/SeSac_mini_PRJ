<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
@font-face {
	font-family: 'TTTtangsbudaejjigaeB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/TTTtangsbudaejjigaeB.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

body {
	font-family: TTTtangsbudaejjigaeB;
	background-color: rgb(255, 255, 255);
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.signup-container {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	width: 300px;
}

.signup-container h2 {
	text-align: center;
	margin-bottom: 20px;
}

.signup-form {
	display: flex;
	flex-direction: column;
}

.signup-form label {
	margin-bottom: 5px;
}

.signup-form input {
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.signup-form button {
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.signup-form button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<header>
		<div>
			<a href="main.jsp"> <img src="logo.jpg" width="200" height="100"
				alt="iui 홈페이지"></a>
		</div>
	</header>

	<div class="signup-container">
		<h2>회원가입</h2>
		<form class="signup-form" action="registerAction.jsp" method="GET">
			<label for="id">아이디:</label> <input type="text" id="id" name="id"
				placeholder="아이디" required> <label for="pw">비밀번호:</label> <input
				type="password" id="pw" name="pw" placeholder="비밀번호" required>
			<label for="pw">비밀번호 확인:</label> <input type="password" id="pwc"
				name="pwc" placeholder="비밀번호 확인" required> <label
				for="nickname">닉네임:</label> <input type="text" id="nickname"
				name="nickname" placeholder="닉네임" required> <label
				for="Email">Email: </label> <input type="email" id="email"
				name="email" placeholder="이메일" required><br>

			<button type="submit">가입</button>
			<br>
			<button type="reset">초기화</button>
		</form>
	</div>
</body>
</html>