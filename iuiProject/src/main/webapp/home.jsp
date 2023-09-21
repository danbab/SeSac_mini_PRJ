<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="loginError.jsp"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date"%>
<jsp:useBean id="service" type="iuiProject.MemberDAO" scope = "application"/>
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>IUI.home</title>

</head>
<body>
	<header>
		<div style="margin-right: 10px; margin-top:5px;"> <%=member.getNickname()%>님 </div>
		<div class="login-button" onclick="logout()">로그아웃</div>
		<div class="register-button" onclick="modInfo()">정보수정</div>
	</header>

    
    <aside>
		<div>
			<a href="home.jsp" style="padding: 0; margin: 0; width: 200px; height: 100px;"> 
			<img src="logo.jpg" style="padding: 0; margin: 0;" width="200"
				height="100" alt="iui 홈페이지">
			</a>
		</div>
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
	
	<section>
	<jsp:include page="view.jsp"/>
	</section>

    <!-- JavaScript 스크립트 -->
    <script>
    function logout() {
        // 서버에 로그아웃 요청을 보내고, 성공적으로 로그아웃되면 리다이렉트 처리
        fetch('logout.jsp', { // 로그아웃을 처리할 서블릿의 URL을 넣으세요.
            method: 'GET',
        }).then(response => {
            if (response.status === 200) {
                window.location.href = 'main.jsp'; // 로그아웃 후 이동할 페이지 URL을 넣으세요.
            }
        }).catch(error => {
            console.error('로그아웃 요청 중 오류 발생:', error);
        });
    }

    function modInfo() {
    	 window.location.href = 'modInfo.jsp';
    }
	</script>
</body>
</html>