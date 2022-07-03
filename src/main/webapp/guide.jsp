<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니꺼내꺼 이용안내</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/guide.css" />
<!-- 부트스트랩 CDN_CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<!-- 구글 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />
<!--  부트스트랩 CDN_JS  -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!--  jQuery CDN  -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- SweetAlert CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
@media ( max-width :990px) {
		.test{width: 450px !important;
	}
}

.btn{
    border:1px solid #92B4EC !important;
	background-color: white !important;
	color: #92B4EC !important;
}

.btn{
border:1px solid #92B4EC !important;
background-color: #92B4EC !important;
color: white !important;
}

.btn:hover{
opacity:0.8;
}
</style>
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
								href="/market.jsp">플리마켓</a></li>
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
								role="button" data-bs-toggle="dropdown" aria-expanded="false">${loginId }님</a>
								<ul class="dropdown-menu loginDrop"
									aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item noColor" href="/myPage.member"
										id="toMyPage">마이페이지</a></li>
									<li><a class="dropdown-item noColor"
										href="/myShop.member?parentId=${loginId }" id="toMyStore">내상점</a></li>
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
			<!-- 네비바 -->

			<nav class="navbar fixed-top navbar-expand-lg py-auto"
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
								href="/market.jsp">플리마켓</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect"
								href="/guide.jsp">이용안내</a></li>
						</ul>
						<div class="col d-flex search text-center">
							<input type=text id=searchInput class="searchInput"
								placeholder="상품을 검색하세요.">
							<button class="btn searchBtn" id="searchBtn">검색</button>
						</div>
						<ul
							class="navbar-nav mt-2 mb-2 mb-lg-0 text-end t-inline d-block d-lg-none">
							<li class="nav-item t-inline">
								<button class="btn btn-outline-dark loginBtn toLogin">로그인</button>
							</li>
							<li class="nav-item t-inline">
								<button class="btn btn-dark joinBtn toJoin"
									style="margin-left: 10px">회원가입</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			
		</c:otherwise>
	</c:choose>


	<div class="container containerSetting text-center">
		<div class="row mt-5 test" style="width:700px">
			<div class="col mb-4">
				<h3 style="font-weight: bold" class="jalnanche">니꺼내꺼 이용안내</h3>
				<div class="mt-5 mb-4 text-center" style="justify-content: space-between">
					<c:if test="${isLoginOk ne 1}">
					아직 회원이 아니시라면, 니꺼내꺼를 바로 이용해보세요.
					<a href="/member/joinForm.jsp" style="text-decoration: none">
						<button class="btn btn-dark joinBtn" type="submit" style="margin-left: 10px">회원가입</button>
					</a>
					</c:if>
				</div>
				<!-- 판매 -->
				<div class="col-12 p-3" align="left" style="color: white; background-color: #FFD24C; font-weight: bold ; line-height: 27px; border-radius: 20px; padding-left: 15px; padding-top: 10px; font-size:1.2rem;">
					<h5 style="color: #726647; background-color: #FFE69A; width:120px; font-weight: bold; font-family: 고딕체; margin-bottom: 5px; text-align:center; border-radius:18px; padding-top:5px; padding:5px;">판매하기</h5>
					1.판매하고 싶은 상품을 등록하세요! <img src="/source/icons/money.png" style="width: 50px; margin-bottom: 5px;"/><br>
					 2.물물교환과 금전거래 중 원하는 거래방식을 선택해주세요!<br> 3.완료! 이제 거래를 희망하는 구매자의 연락을 기다리세요!
				</div>
				<hr width="675px">
				<div class="col-12 p-3" align="left" style="color: white; background-color: #FFD24C; font-weight: bold ; line-height: 27px; border-radius: 20px; padding-left: 15px; padding-top: 10px; font-size:1.2rem;">
					<h5  style="color: #726647; background-color: #FFE69A; width:120px; font-weight: bold; font-family: 고딕체; margin-bottom: 5px; text-align:center; border-radius:18px; padding-top:5px; padding:5px;">구매하기</h5> 
					1.상품을 둘러보세요! <img src="/source/icons/cate.png" style="width: 80px; margin-bottom: 5px;"/><br>
					 2.구매하고 싶은 상품을 찾으셨나요?<br>3.구매하고 싶은 상품의 판매자과 채팅을 해보세요!<br> 4.잠시후 판매자에게 연락이 올겁니다! 구매완료!
				</div>
				<hr width="675px">
				<div class="col-12 p-3" align="left" style="color: white; background-color: #FFD24C; font-weight: bold ; line-height: 27px; border-radius: 20px; padding-left: 15px; font-size:1.2rem;">
					<h5  style="color: #726647; background-color: #FFE69A; width:180px; font-weight: bold; font-family: 고딕체; margin-bottom: 5px; text-align:center; border-radius:18px; padding-top:5px; padding:5px;">신뢰도 평가하기</h5> 1.상품 거래를 완료하셨나요?
					<img src="/source/icons/verygood.png" style="width: 35px; margin-bottom: 5px;"/>
					<img src="/source/icons/good.png" style="width: 35px; margin-bottom: 5px;""/>
					<img src="/source/icons/normal.png" style="width: 35px; margin-bottom: 5px;""/>
					<img src="/source/icons/bad.png" style="width: 35px; margin-bottom: 5px;""/>
					<img src="/source/icons/verybad.png" style="width: 35px; margin-bottom: 5px;""/><br> 2.채팅함에 들어가 나와 거래한 상대방을
					평가해주세요!<br> 3.평가가 완료 된다면 신뢰도에 따라 뱃지가 변화합니다!<br> 높은 신뢰도는 추후 판매와 구매 시 도움이 됩니다!
				</div>
				<hr width="675px">
				<div class="col-12 p-3" align="left"
					style="color: white; background-color: #FFD24C; font-weight: bold ; line-height: 27px; border-radius: 20px; padding-left: 15px; padding-top: 10px; font-size:1.2rem;">
					<h5  style="color: #726647; background-color: #FFE69A; width:270px; font-weight: bold; font-family: 고딕체; margin-bottom: 5px; text-align:center; border-radius:18px; padding-top:5px; padding:5px;">동네주민들과 실시간 채팅</h5> 1.상품 구경이 끝났다면 동네주민들과 실시간 대화는 어떠세요?<img src="/source/icons/chat.png" style="width: 75px; margin-bottom: 5px;""/><br>
					2.메인 화면에 준비 된 채팅창에 메세지를 작성해보세요!<br> 3.동네 주민들과 다양한 정보를 실시간으로
					공유해보세요!
				</div>
				<hr width="675px">
				<div class="col-12 p-3" align="left"
					style="color: white; background-color: #FFD24C; font-weight: bold ; line-height: 27px; border-radius: 20px; padding-left: 15px; padding-top: 10px; font-size:1.2rem;">
					<h5  style="color: #726647; background-color: #FFE69A; width:170px; font-weight: bold; font-family: 고딕체; margin-bottom: 5px; text-align:center; border-radius:18px; padding-top:5px; padding:5px;">전기차 게시판</h5> 1.전기차 충전소를 찾고 계신가요? <img src="/source/icons/car.png" style="width: 80px; margin-bottom: 5px;"/><br> 2.니꺼내꺼에는 위치기반 서비스의
					전기차 게시판을 운영하고 있습니다!<br> 3.전기차 충전소에 관한 정보를 자유롭게 공유해보세요!
				</div>
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col-12">지금 바로 상품을 구경해보세요!</div>
			<div class="col-12">
				<a href="/list.productBoard?currPage=1"><button class="btn" style="width:200px; margin-top:10px;">둘러보기</button></a>
				
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