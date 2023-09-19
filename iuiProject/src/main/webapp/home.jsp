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
<title>IUI</title>
<style>
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
    </style>
</head>
<body>
<header>
		<div>환영합니다</div>
        <div class="login-button" onclick="toggleLogoutPopup()">로그아웃</div>
        <div class="register-button" onclick="toggleRegisterPopup()">정보수정</div>
    </header>
    <div>
         <a href="home.jsp">
			 <img src="logo.jpg" width="350" height="175" alt="iui 홈페이지">
		 </a>
    </div>

    <!-- 로그인 팝업 -->
    <div id="login-popup" class="popup">
        <div class="popup-content">
            <span class="close-button" onclick="toggleLoginPopup()">&times;</span>
            <h2>로그인</h2>
            <br>
            <form class="login-form" action="Main.html" method="post">
                <!--<label for="username">아이디:</label>-->
                <input type="text" id="id" name="id" placeholder="아이디" required>

                <!--<label for="password">비밀번호:</label>-->
                <input type="password" id="pw" name="pw"  placeholder="비밀번호" required>
				<br>
                <button type="submit">로그인</button>
            </form>
        </div>
    </div>
    
    

    <!-- 나머지 콘텐츠 -->
    <p>이곳에 나머지 웹 페이지 내용을 추가하세요.</p>

    <!-- JavaScript 스크립트 -->
    <script>
    function toggleLogoutPopup() {
       
    }

    function toggleRegisterPopup() {
       
    }
    
    
   

</script>

</body>
</html>