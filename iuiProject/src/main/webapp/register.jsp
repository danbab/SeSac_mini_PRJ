<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<!-- 외부 CSS 파일 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>

	<div class="register-logo">
		<a href="main.jsp"> <img src="image/logo2.webp"	alt="iui 홈페이지">
		</a>
	</div>

	<div class="signup-container">
		<h2>회원가입</h2>
		<form class="signup-form" action="registerAction.jsp" method="GET">
			<label for="id">아이디:</label> 
			<input type="text" id="id" name="id" placeholder="아이디" required> 
			<label for="pw">비밀번호:</label>
			<input type="password" id="pw" name="pw" placeholder="비밀번호" required>
			<label for="pw">비밀번호 확인:</label>
			<input type="password" id="pwc" name="pwc" placeholder="비밀번호 확인" required> 
			<label for="nickname">닉네임:</label> 
			<input type="text" id="nickname" name="nickname" placeholder="닉네임" required> 
			<label for="Email">Email: </label> 
			<input type="email" id="email" name="email" placeholder="이메일" required><br>

			<button type="submit">가입</button><br>
			<button type="reset">초기화</button>
		</form>
	</div>
</body>
</html>