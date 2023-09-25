<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.*"%>
 
<jsp:useBean id="memberService" type="iuiProject.MemberDAO" scope = "application"/>
<jsp:useBean id="member" type="iuiProject.MemberDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function black(member_no) {
	window.location.href = 'blackAction.jsp?member_no='+member_no;
}
function revokeblack(member_no) {
	window.location.href = 'revokeblackAction.jsp?member_no='+member_no;
}
</script>
</head>
<body>
 <h1>관리자 페이지</h1>
    
    <h2>전체 회원 리스트</h2>
    <table border="1">
        <thead>
            <tr>
                <th>회원 ID</th>
                <th>닉네임</th>
                <th>이메일</th>
                <th>상태</th>
                <!-- 추가 필요한 열을 여기에 포함하세요 -->
            </tr>
        </thead>
        <tbody>
            <!-- 전체 회원 목록을 조회하고 표시하는 부분 -->
            <%
                // memberService를 사용하여 전체 회원 목록을 가져옵니다.
                ArrayList<MemberDTO> memberList = memberService.getAllMembers();
                
                for (MemberDTO m : memberList) {
            %>
            <tr>
                <td><%= m.getId() %></td>
                <td><%= m.getNickname() %></td>
                <td><%= m.getEmail() %></td>
                <td><%= m.getStatus() %></td>
                <td><button onclick="black(<%= m.getMemberNo() %>)" >차단</button></td>
                <!-- 추가 필요한 열을 여기에 포함하세요 -->
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
    <h2>블랙리스트</h2>
    <table border="1">
        <thead>
            <tr>
                <th>회원 ID</th>
                <th>닉네임</th>
                <th>이메일</th>
                <th>상태</th>
                <!-- 추가 필요한 열을 여기에 포함하세요 -->
            </tr>
        </thead>
        <tbody>
            <!-- 전체 회원 목록을 조회하고 표시하는 부분 -->
            <%
                // memberService를 사용하여 전체 회원 목록을 가져옵니다.
                ArrayList<MemberDTO> blackList = memberService.getAllBlacks();
                
                for (MemberDTO m : blackList) {
            %>
            <tr>
                <td><%= m.getId() %></td>
                <td><%= m.getNickname() %></td>
                <td><%= m.getEmail() %></td>
                <td><%= m.getStatus() %></td>
                <td><button onclick="revokeblack(<%= m.getMemberNo() %>)" >해제</button></td>
                <!-- 추가 필요한 열을 여기에 포함하세요 -->
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>