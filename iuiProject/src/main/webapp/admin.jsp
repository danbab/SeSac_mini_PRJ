<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="loginError.jsp"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.Date"%>
<jsp:useBean id="memberService" type="iuiProject.MemberDAO" scope = "application"/>
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>IUI.home</title>

</head>
<body>
	<header>
		<div style="margin-right: 10px; margin-top:5px;"> <%=member.getNickname()%>님 </div>
		<div class="login-button" onclick="logout()">로그아웃</div>
		<div class="register-button" onclick="modInfo()">정보수정</div>
		
		<!-- 관리자 버튼 -->
        <% if (member.getStatus() == 2) { %>
        <div class="register-button" onclick="gotoAdminPage()">관리자 페이지</div>
        <% } %>
        
	</header>

    
    <aside>
		<div class="logo">
			<a href="home.jsp" > 
			<img src="image/logo2.webp" alt="iui 홈페이지">
			</a>
		</div>

		<div>
    		<a href="admin.jsp">관리자 페이지</a>
    	</div>
		<div class="dropdown">
			<a href="#">회원 리스트</a>
			<div class="dropdown-content">
				<a href="#">전체 회원</a>
				<a href="#">블랙리스트</a>
				
			</div>
		</div>
		<div class="dropdown">
			<a href="#">정보수정 요청</a>
		</div>
	</aside>
	
	<section>
	<jsp:include page="adminview.jsp"/>
	</section>

    <!-- JavaScript 스크립트 -->
    <script>
    function logout() {
        // 서버에 로그아웃 요청을 보내고, 성공적으로 로그아웃되면 리다이렉트 처리
        fetch('logout.jsp', { // 로그아웃을 처리할 서블릿의 URL을 넣으세요.
            method: 'GET',
        }).then(response => {
            if (response.status === 200) {
            	alert('로그아웃 완료');
                window.location.href = 'main.jsp'; // 로그아웃 후 이동할 페이지 URL을 넣으세요.
            }
        }).catch(error => {
            console.error('로그아웃 요청 중 오류 발생:', error);
        });
    } 
    
   
    function modInfo() {
    	 window.location.href = 'modInfo.jsp';
    }
    
    function gotoAdminPage() {
        window.location.href = 'admin.jsp';
    }
	</script>
</body>
</html>