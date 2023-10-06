<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuiProject.*,java.sql.*,java.util.*"%>
<jsp:useBean id="album" type="iuiProject.AlbumDTO" scope="session"/>
<jsp:useBean id="albumService" type="iuiProject.AlbumDAO" scope="session"/>
<jsp:useBean id="commentService" class="iuiProject.UserCommentDAO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IUI 앨범뷰</title>
<!-- 부트스트랩 CSS 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<%
	List<AlbumDTO> albums = albumService.getAllAlbums();
	%>
	<div class="container">
		<h3 align="center" style="margin-top: 10px;">아이유 앨범 갤러리</h3>
		<div class="row">
			<!-- 앨범 재킷 카드 -->
			<% for(AlbumDTO a : albums){%>
			<div class="col-md-3">
				<div class="card">
					<img src="image/<%=a.getAlbumCover()%>" class="card-img-top"
						alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title"><%=a.getAlbumName()%></h5>
						<button type="button" class="btn btn-primary" 
						 onclick="albumview('albumView.jsp?albumId=<%=a.getAlbumId()%>')">앨범 정보</button>
						
					</div>
				</div>
			</div>
			<%}%>
			
		</div>
	</div>

	<script>
	
		function albumview(i) {
			// AJAX 요청 생성
			const xhr = new XMLHttpRequest();
			const target = i;
			// 요청을 보낼 페이지 URL 설정
			xhr.open('GET', target, true);
			// 요청이 완료되면 실행될 함수 정의
			xhr.onload = function() {
				if (xhr.readyState == 4 && xhr.status === 200) {
					// 응답으로 받은 HTML을 section 요소에 삽입
					document.querySelector('section').innerHTML = xhr.responseText;
				} else {
					alert('페이지 로드 중 오류가 발생했습니다.');
				}
			};
			// 요청 보내기
			xhr.send();
		}

		function updateAlbumAndShowAlbumView(albumId) {
			// updateAlbum 함수 호출
			updateAlbum(albumId, function() {
				// updateAlbum이 완료되면 albumView 함수 호출
				albumview('albumView.jsp?albumId=' + albumId);
			});
		}

		function submitCommentAndShowAlbumView(albumId) {
			submitComment(albumId, function() {
				albumview('albumView.jsp?albumId=' + albumId);
			});
		}

		function deleteCommentAndShowAlbumView(commentId, albumId) {
			deleteComment(commentId, function() {
				albumview('albumView.jsp?albumId=' + albumId);
			});
		}
		
		function updateCommentAndShowAlbumView(commentId, albumId) {
			updateComment(commentId, function() {
				albumview('albumView.jsp?albumId=' + albumId);
			});
		}
		
		function updateAlbum(i, callback) {
			var newAlbumName = document.getElementById("new_albumName").value;
			var newAlbumType = document.getElementById("new_albumType").value;
			var newReleaseDate = document.getElementById("new_releaseDate").value;
			var newNumberSongs = document.getElementById("new_numberSongs").value;
			var newAlbumIntro = document.getElementById("new_albumIntro").value;
			var newAlbumId = i;

			// AJAX를 사용하여 albumModAction.jsp로 데이터 전송
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "albumModAction.jsp", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded; charset=UTF-8");
			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE) { // 요청이 완료되었을 때
					if (xhr.status == 200) {
						// 성공적으로 응답을 받았을 때의 동작
						alert('앨범이 성공적으로 수정되었습니다.');
						if (callback && typeof callback === 'function') {
							callback();
						}
					} else {
						alert('앨범 수정 오류');
					}
				}
			};

			// 전송할 데이터를 URL-encoded 형식으로 만듭니다.
			var data = "newAlbumName=" + encodeURIComponent(newAlbumName)
					+ "&newAlbumType=" + encodeURIComponent(newAlbumType)
					+ "&newReleaseDate=" + encodeURIComponent(newReleaseDate)
					+ "&newNumberSongs=" + encodeURIComponent(newNumberSongs)
					+ "&newAlbumIntro=" + encodeURIComponent(newAlbumIntro)
					+ "&newAlbumId=" + encodeURIComponent(i);

			xhr.send(data);
		}
		
		function submitComment(i, callback) {
			var memberNo = document.getElementById("memberNo").value;
			var comment = document.getElementById("comment").value;

			// AJAX를 사용하여 submitCommentAction.jsp로 데이터 전송
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "commentSubmitAction.jsp", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded; charset=UTF-8");
			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE) { // 요청이 완료되었을 때
					if (xhr.status == 200) { // 성공적으로 응답을 받았을 때의 동작
						if (callback && typeof callback === 'function') {
							callback();
						}
					} else {
						// 에러 처리
						alert('댓글 작성 중 오류가 발생했습니다.');
					}
				}
			};
			// 전송할 데이터를 URL-encoded 형식으로 만듭니다.
			var data = "albumId=" + encodeURIComponent(i)
					+ "&memberNo=" + encodeURIComponent(memberNo)
					+ "&comment="  + encodeURIComponent(comment);
			xhr.send(data);
		}

		function deleteComment(i, callback) {
			// AJAX를 사용하여 commentDeleteAction.jsp로 데이터 전송
			var commentId = i;
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "commentDeleteAction.jsp", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded; charset=UTF-8");
			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE) { // 요청이 완료되었을 때
					if (xhr.status == 200) {
						// 성공적으로 응답을 받았을 때의 동작
						if (callback && typeof callback === 'function') {
							callback();
						}
					} else {
						alert('댓글 삭제 실패');
					}
				}
			};

			// 전송할 데이터를 URL-encoded 형식으로 만듭니다.
			var data = "&commentId=" + encodeURIComponent(commentId);
			xhr.send(data);
		}


		function updateComment(i, callback) {
			var commentId = i;
			var newComment = document.getElementById("edit-comment").value;

			// AJAX를 사용하여 updateCommentAction.jsp로 데이터 전송
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "commentUpdateAction.jsp", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded; charset=UTF-8");
			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE) { // 요청이 완료되었을 때 
					if (xhr.status == 200) { // 성공적으로 응답을 받았을 때의 동작
						if (callback && typeof callback === 'function') {
							callback();
						}
					} else {
						alert('댓글 수정이 실패했습니다.');
						console.error("댓글 수정 실패: " + xhr.status);
					}
				}
			};
			// 전송할 데이터를 URL-encoded 형식으로 만듭니다.
			var data = "commentId=" + encodeURIComponent(i) + 
					   "&comment="	+ encodeURIComponent(newComment);
			xhr.send(data);
		}
		function showEditForm(commentId,albumId) {
		    $(document).ready(function() {
		        // 기존에 수정 폼이 열려있다면 제거
		        var existingForm = document.getElementById('edit-comment-form');
		        if (existingForm) {
		            existingForm.remove();
		        }

		        // 선택한 댓글의 row 선택
				var commentRow = document.querySelector('[data-comment-id="' + commentId + '"]');
				var commentText = commentRow.getAttribute('data-comment-text');

				// 새로운 div 생성 (댓글 수정 폼)
				var editDiv = document.createElement('div');
				editDiv.id = 'edit-comment-form';

				// form 안에 들어갈 HTML 설정
				<%-- editDiv.innerHTML = `
						<textarea id="edit-comment" name="edit-comment" rows="1" cols="50">${commentText}</textarea>
						<button type="button" onclick="updateCommentAndShowAlbumView(<%=commentId%>,albumId)">수정</button>
						<button type="button" onclick="(function() { var form = document.getElementById('edit-comment-form'); form.parentNode.removeChild(form); })()">취소</button>
					`; --%>
				editDiv.innerHTML = `
    <textarea id="edit-comment" name="edit-comment" rows="1" cols="50">${commentText}</textarea>
`;

				var updateButton = document.createElement('button');
				updateButton.type = 'button';
				updateButton.textContent = '수정';
				updateButton.addEventListener('click', function() {
  				updateCommentAndShowAlbumView(commentId, albumId);
				});
				editDiv.appendChild(updateButton);

				var cancelButton = document.createElement('button');
				cancelButton.type = 'button';
				cancelButton.textContent = '취소';
				cancelButton.addEventListener('click', function() {
 				   var form = document.getElementById('edit-comment-form'); 
				    form.parentNode.removeChild(form);
				});
				editDiv.appendChild(cancelButton);
				
					
				var textarea = editDiv.querySelector('#edit-comment');
				textarea.addEventListener('input', autoResizeTextarea);

			   // 생성한 div를 선택한 댓글 바로 아래에 삽입
			   commentRow.parentNode.insertBefore(editDiv, commentRow.nextSibling);
		    });
		}
		
		 function autoResizeTextarea() {
				this.style.height = 'auto';
				this.style.height = (this.scrollHeight) + 'px';
			}
		 
	
</script>
	
	<!-- 부트스트랩 JavaScript 및 j Query 스크립트 링크 -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>