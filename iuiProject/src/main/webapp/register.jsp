<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
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
		<a href="main.jsp"> <img src="logo.jpg" width="350" height="175"
			alt="iui 홈페이지">
		</a>
	</div>
</header>
	<div class="signup-container">
        <h2>회원가입</h2>
        <form class="signup-form" action="registerAction.jsp" method="GET">
            <label for="id">아이디:</label>
                <input type="text" id="id" name="id" required>

                <label for="pw">비밀번호:</label>
                <input type="password" id="pw" name="pw" required>
                
                <label for="pw">비밀번호 확인:</label>
                <input type="password" id="pwc" name="pwc" required>
                
                <label for="nickname">닉네임:</label>
                <input type="text" id="nickname" name="nickname" required>
                
                <label for="Email">Email:</label>
                <input type="email" id="email" name="email" required><br>

                
               
            <button type="submit">가입</button><br>
            <button type="reset">초기화</button>
            
        </form>
    </div>
</body>
</html>