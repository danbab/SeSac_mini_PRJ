<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="loginError.jsp"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.*"%>
<jsp:useBean id="memberService" type="iuiProject.MemberDAO" scope = "application"/>
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session"/>
<jsp:useBean id="album" type="iuiProject.AlbumDTO" scope="session"/>
<jsp:useBean id="albumService" type="iuiProject.AlbumDAO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>IUI.home</title>
</head>
<% List<AlbumDTO> albums = albumService.getAllAlbums(); %>
<% Map<String, List<AlbumDTO>> years= albumService.loadAlbumByYear(albums);%>
<% List<String> yearList = new ArrayList<String>(years.keySet());%>
<% Collections.sort(yearList);%>
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
		
		<div class="dropdown">
    		<a href="#">아이유의 음원 목록</a>
    		<div class="dropdown-content">
				<% for(AlbumDTO a : albums){ %>
				<a href="#" onclick="albumview('albumView.jsp?albumId=<%=a.getAlbumId()%>')">
				   <%=a.getAlbumName()%></a>
				<%}%>
			</div>
    	</div>
		
		<% for(String year : yearList) {%>
			<div class="dropdown">
			<a href="#"><%=year%>년</a>
			<div class="dropdown-content">
			<% for (int i=years.get(year).size()-1;i>=0;i--){%>
				<a href="#" onclick="albumview('albumView.jsp?albumId=<%=years.get(year).get(i).getAlbumId()%>')">
				<%=years.get(year).get(i).getAlbumName()%></a>
			<% }%>			
    		</div>
    		<%}%>
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
    
    function albumview(i) {
		console.log('함수가 albumId와 함께 호출되었습니다:', i);
	    // AJAX 요청 생성
	    const xhr = new XMLHttpRequest();
	 //   const target = 'albumView.jsp?albumId=' + i;
	    const target = i;
	    console.log(target);
	    
	    // 요청을 보낼 페이지 URL 설정
	    xhr.open('GET', target, true);

	    // 요청이 완료되면 실행될 함수 정의
	    xhr.onload = function () {
	        if (xhr.status === 200) {
	            // 응답으로 받은 HTML을 section 요소에 삽입
	            document.querySelector('section').innerHTML = xhr.responseText;
	            // 이전 페이지로 돌아가기 기능 활성화
	            /* window.history.pushState({ page: "album", albumId: i }, null, target); */
	        } else {
	            alert('페이지 로드 중 오류가 발생했습니다.');
	        }
	    };
	    
	    // 요청 보내기
	    xhr.send();
	}
    
	</script>
</body>
</html>