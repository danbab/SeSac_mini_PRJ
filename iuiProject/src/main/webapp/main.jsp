<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>IUI.main</title>
</head>

<body>
	<header>
		<div class="login-button" onclick="toggleLoginPopup()">로그인</div>
		<div class="register-button" onclick="toggleRegisterPopup()">회원가입</div>
	</header>
	
	<!-- 로그인 팝업 -->
    <div id="login-popup" class="popup">
        <div class="popup-content">
            <span class="close-button" onclick="toggleLoginPopup()">&times;</span>
            <h2>로그인</h2>
            <br>
            <form class="login-form" action="loginAction.jsp" method="GET">
                <label for="id">아이디:</label>
                <input type="text" id="id" name="id" placeholder="아이디" required>
                <label for="password">비밀번호:</label>
                <input type="password" id="pw" name="pw"  placeholder="비밀번호" required>
				<br>
                <button type="submit">로그인</button>
            </form>
        </div>
    </div>
    
    <aside>
		<div class="logo">
			<a href="main.jsp" > 
			<img src="image/logo2.webp" alt="iui 홈페이지">
			</a>
		</div>

		<div>
    		<a href="#">아이유의 음원 목록</a>
    	</div>
    	
		<div class="dropdown">
			<a href="#">앨범명1</a>
			<div class="dropdown-content">
				<a href="#">수록곡 1</a>
				<a href="#">수록곡 2</a>
				<a href="#">수록곡 3</a>
				<a href="#">수록곡 4</a>
				<a href="#">수록곡 5</a>
			</div>
		</div>
		<div class="dropdown">
			<a href="#">앨범명2</a>
			<div class="dropdown-content">
				<a href="#">수록곡 1</a>
				<a href="#">수록곡 2</a>
				<a href="#">수록곡 3</a>
				<a href="#">수록곡 4</a>
				<a href="#">수록곡 5</a>
			</div>
		</div>
		<div class="dropdown">
			<a href="#">앨범명3</a>
			<div class="dropdown-content">
				<a href="#">수록곡 1</a>
				<a href="#">수록곡 2</a>
				<a href="#">수록곡 3</a>
				<a href="#">수록곡 4</a>
				<a href="#">수록곡 5</a>
			</div>
		</div>
		<div class="dropdown">
			<a href="#">앨범명4</a>
			<div class="dropdown-content">
				<a href="#">수록곡 1</a>
				<a href="#">수록곡 2</a>
				<a href="#">수록곡 3</a>
				<a href="#">수록곡 4</a>
				<a href="#">수록곡 5</a>
			</div>
		</div>
	</aside>
	
	<section>
	<jsp:include page="view.jsp" />
	</section>

    <!-- JavaScript 스크립트 -->
    <script>
    function toggleLoginPopup() {
        var loginPopup = document.getElementById('login-popup');
        var registerPopup = document.getElementById('register-popup');
        var usernameInput = document.getElementById('id'); // 아이디 입력 필드
        var passwordInput = document.getElementById('pw'); // 비밀번호 입력 필드
        usernameInput.value = '';
        passwordInput.value = '';

        if (loginPopup.style.display === 'block') {
            loginPopup.style.display = 'none';
            // 팝업이 닫힐 때 입력 필드 초기화
            usernameInput.value = '';
            passwordInput.value = '';
        } else {
            loginPopup.style.display = 'block';
            // 회원가입 팝업 닫기
            registerPopup.style.display = 'none';
        }
    }

    function toggleRegisterPopup() {
    	  window.location.href = 'register.jsp';
    }
	</script>
</body>
</html>