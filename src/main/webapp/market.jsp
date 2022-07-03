<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플리마켓 | 니꺼내꺼</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/market.css" />

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 부트스트랩 CDN_CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- 구글 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />
<!--  부트스트랩 CDN_JS  -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- SweetAlert CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>

	<c:choose>
		<c:when test="${isLoginOk == 1}">

			<!-- 로그인시 네비바 -->
			<nav class="navbar fixed-top navbar-expand-lg navbar-light py-auto"
				id="mainNav">
				<div class="container-fluid px-4 px-lg-5" id="subNav">
					<a class="navbar-brand jalnanche" id="navTitle" href="/index.jsp"
						style="font-weight: bold">니꺼내꺼</a>
					<button class="navbar-toggler navbar-toggler-right"
						style="color: transparent;" id="navBtn" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
						aria-controls="navbarResponsive" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ">
							<li class="nav-item"><a class="nav-link active mouse-effect"
								aria-current="page" href="/list.productBoard?currPage=1">상품보기</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect"
								href="/list.carBoard?cpage=1">전기차</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect"
								href="#">플리마켓</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect"
								href="/guide.jsp">이용안내</a></li>
						</ul>
						<div class="col d-flex search text-center">
							<input type=text id=searchInput class="searchInput"
								placeholder="상품을 검색하세요.">
							<button class="btn searchBtn" id="searchBtn">검색</button>
						</div>
						<!-- 로그인한 사용자 이름 띄우기 -->
						<ul class="navbar-nav loginNav text-center">
							<li class="nav-item dropdown text-center"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									${loginId }님 </a>
								<ul class="dropdown-menu loginDrop"
									aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item noColor" href="/myPage.member"
										id="toMyPage">마이페이지</a></li>
									<li><a class="dropdown-item noColor" href="/myPage.member"
										id="toMyStore">내상점</a></li>
									<li><a style="width: 158px;"
										class="chatRoom dropdown-item noColor ds-inline"
										href="/chatRoom.chat?loginId=${loginId }">채팅함</a></li>
									<li><hr class="dropdown-divider" /></li>
									<li><a class="dropdown-item text-center"
										href="/logout.member"><button
												class="w-100 logout btn btn-outline-dark noColor">로그아웃</button></a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
		</c:when>

		<c:otherwise>
			<!-- 비회원 네비바 -->

			<nav class="navbar fixed-top navbar-expand-lg navbar-light py-auto"
				id="mainNav">
				<div class="container-fluid px-4 px-lg-5" id="subNav">
					<a class="navbar-brand jalnanche" id="navTitle" href="/index.jsp"
						style="font-weight: bold">니꺼내꺼</a>
					<button class="navbar-toggler navbar-toggler-right"
						style="color: transparent;" id="navBtn" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
						aria-controls="navbarResponsive" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse text-center"
						id="navbarResponsive">
						<ul class="navbar-nav ">
							<li class="nav-item"><a class="nav-link active mouse-effect"
								aria-current="page" href="/list.productBoard?currPage=1">상품보기</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect"
								href="/list.carBoard?cpage=1">전기차</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect"
								href="#">플리마켓</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect"
								href="/guide.jsp">이용안내</a></li>
						</ul>
						<div class="col d-flex search text-center">
							<input type=text id=searchInput class="searchInput"
								placeholder="상품을 검색하세요.">
							<button class="btn btn-outline-dark searchBtn" id="searchBtn">검색</button>
						</div>
						<ul class="navbar-nav mt-2 mb-2 mb-lg-0 text-end t-inline">
							<li class="nav-item t-inline">
								<a href="/member/login.jsp"><button class="btn btn-outline-dark toLogin">로그인</button></a>
							</li>
							<li class="nav-item t-inline">
								<a href="/member/joinForm.jsp"><button class="btn btn-outline-dark toJoin" style="margin-left: 10px">회원가입</button></a>
							</li>
						</ul>
					</div>
				</div>
			</nav>

		</c:otherwise>
	</c:choose>

	<div class="container containerSetting">
		<div class="row w-100">
			<div class="col-12 banner text-center  m-0 mt-5 mb-5">
				<div class="font">니꺼내꺼 플리마켓</div>
				<div class="font">22년 6월 당신의 근처에 찾아갑니다.</div>
			</div>
		</div>

		<div class="row w-100">
			<div class="col-12 text-center font2 mt-5 mb-5">
				니꺼내꺼와 함께하는 플리마켓<br> 여러분을 초대합니다!
			</div>
		</div>

		<div class="row w-100 mb-5">
			<div class="col-12 text-center">
					<span class="info" style="margin-left:27px;">장소</span> <span>서울시 중구 명동</span><br><br>
					<span class="info" style="margin-left:18px;">일시</span> <span>2022년 6월 1일</span><br><br>
					<span class="info" >주최</span> <span style="margin-right:31px;">니꺼내꺼</span><br><br>
				
			</div>
		</div>
		
				
		<div class="row w-100">
			<div class="col-12 text-center mt-3 mb-5 comment">
				* 플리마켓 수익금 중 일부는 환경 단체 기부에 사용됩니다.
			</div>
		</div>
	</div>
	
		<!-- footer -->
	<div class="container-fluid footer">
		<div class="row footerData">
			<div class="col-12 col-md-4 jalnanche">니꺼내꺼</div>
			<div class="col-12 col-md-8 d-inline">
				<div class="footerInfo">회사소개</div>
				<div class="footerInfo">이용안내</div>
				<div class="footerInfo">제휴문의</div>
			</div>
		</div>

		<div class="row cs">
			<p class="col-12 mb-2" style="font-size: 18px">고객센터</p>
			<h5 class="col-12" style="font-weight: bold">1599-1600</h5>
			<p class="col-12 csText">평일 10:00 - 17:00</p>
			<p class="col-12 csText">(점심시간 12:00 - 13:00)</p>
		</div>
	</div>
	
	<script>
	// 채팅

	let span = $('<div>');
	span.addClass("new ds-inline");
	span.text("N");

	$.ajax({
		url : "/notice.chat",
		data : {
			loginId : "${loginId}"
		},
		dataType : "json"
	}).done(function(resp) {
		if (resp > 0) {
			$(".chatRoom").append(span);

		}
	})
	
		
	// 상품검색
	$("#searchBtn").on("click",function() {
		let keyWord = $("#searchInput").val()
		location.href = "/search.productBoard?currPage=1&keyWord=" + keyWord
	})
	</script>
</body>
</html>