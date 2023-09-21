<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IUI 앨범뷰</title>
<!-- 부트스트랩 CSS 링크 -->
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<div class="container">
		<h3 align="center">아이유 앨범 갤러리</h3>
		<div class="row">
			<!-- 앨범 재킷 카드 -->
			<div class="col-md-3">
				<div class="card">
					<img src="image/piece.webp" class="card-img-top" alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">조각집</h5>
						<!-- 모달 트리거 버튼 -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="image/strawberry moon.webp" class="card-img-top" alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">strawberry moon</h5>
						<!-- 모달 트리거 버튼 -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="image/LILAC.webp" class="card-img-top"
						alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">라일락</h5>
						<!-- 모달 트리거 버튼 -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="image/Into the I-LAND.webp" class="card-img-top" alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">Into the I-LAND</h5>
						<!-- 모달 트리거 버튼 -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="image/eight.webp" class="card-img-top"
						alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">에잇</h5>
						<!-- 모달 트리거 버튼 -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="image/giveheart.webp" class="card-img-top" alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">마음을 드려요</h5>
						<!-- 모달 트리거 버튼 -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div>
			<!-- <div class="col-md-3">
				<div class="card">
					<img src="image/LILAC.webp" class="card-img-top" alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">라일락</h5>
						모달 트리거 버튼
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="image/LILAC.webp" class="card-img-top" alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">라일락</h5>
						모달 트리거 버튼
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="image/LILAC.webp" class="card-img-top" alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">라일락</h5>
						모달 트리거 버튼
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="image/LILAC.webp" class="card-img-top" alt="앨범 재킷">
					<div class="card-body">
						<h5 class="card-title">라일락</h5>
						모달 트리거 버튼
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#albumModal">앨범 정보</button>
					</div>
				</div>
			</div> -->
			
			
		</div>
	</div>
	<script>
	function test() {
	    // AJAX 요청 생성
	    var xhr = new XMLHttpRequest();
	    
	    // 요청을 보낼 페이지 URL 설정
	    xhr.open('GET', 'login.html', true);

	    // 요청이 완료되면 실행될 함수 정의
	    xhr.onload = function () {
	        if (xhr.status === 200) {
	            // 응답으로 받은 HTML을 section 요소에 삽입
	            document.querySelector('section').innerHTML = xhr.responseText;
	        } else {
	            alert('페이지 로드 중 오류가 발생했습니다.');
	        }
	    };
	    
	    // 요청 보내기
	    xhr.send();
	}
	</script>

	<!-- 부트스트랩 JavaScript 및 jQuery 스크립트 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>