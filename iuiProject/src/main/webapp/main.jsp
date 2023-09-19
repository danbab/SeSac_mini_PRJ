<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date"%>
<jsp:useBean id="service" class="iuiProject.MemberDAO"/>
<jsp:useBean id="member" class="iuiProject.MemberDTO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>IUI</title>
<!-- <style>
        /* 스타일링 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
          

        header {
            background-color: rgb(255, 255, 255);
            color: #fff;
            padding: 10px;
            display: flex;
            justify-content: flex-end; /* 로그인 바를 오른쪽 정렬합니다. */
        }

        .login-button {
            cursor: pointer;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            margin-right: 10px;
        }
        
        .register-button {
            cursor: pointer;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
        }

        /* 팝업 스타일링 v1 */
        .popup {
            
			display: none;
            position: fixed;
            top: 50%; /* 화면 상단에서 50% 위치에 배치합니다. */
            left: 50%; /* 화면 왼쪽에서 50% 위치에 배치합니다. */
            transform: translate(-50%, -50%); /* 팝업을 수평 및 수직으로 중앙에 배치합니다. */
            width: 300px; /* 팝업의 크기 조절 */
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1;
            justify-content: center;
            align-items: center;
           
        }
        

        .popup-content {
                       
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            width: 300px;
            position: relative;
            
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-form {
            display: flex;
            flex-direction: column;
        }

        .login-form label {
            margin-bottom: 5px;
        }

        .login-form input {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .login-form button {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .login-form button:hover {
            background-color: #0056b3;
        }
        
        
        
        

        .close-button {
            position: absolute;
            top: 5%;
            right: 5%;
            cursor: pointer;
            font-size: 24px;
            color: #333;
        }
    </style> -->
</head>
<body>
<header>
		
        <div class="login-button" onclick="toggleLoginPopup()">로그인</div>
        <div class="register-button" onclick="toggleRegisterPopup()">회원가입</div>
    </header>
    <div>
		<a href="main.jsp"> <img src="logo.jpg" width="200" height="100"
			alt="iui 홈페이지">
		</a>
	</div>

    <!-- 로그인 팝업 -->
    <div id="login-popup" class="popup">
        <div class="popup-content">
            <span class="close-button" onclick="toggleLoginPopup()">&times;</span>
            <h2>로그인</h2>
            <br>
            <form class="login-form" action="main.jsp" method="post">
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
		<div class="dropdown">
			<a href="#">아이유의 음원 목록</a>
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