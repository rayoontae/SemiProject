<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전기차 게시판 | 니꺼내꺼</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/carBoardList.css" />
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
<!-- 지도 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=910e416a7395262cfff884bcfe25ea70"></script>

<style>
	button{
		font-size:14px;
	}
	.btnHover:hover{
    border:1px solid #92B4EC !important;
	background-color: #92B4EC !important;
	color: white !important;
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
						style="font-weight: bold;">니꺼내꺼</a>
					<button class="navbar-toggler navbar-toggler-right"
						id="navBtn" type="button"
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
			<!-- 비회원 네비바 -->
			
			<nav class="navbar fixed-top navbar-expand-lg navbar-light py-auto" id="mainNav">
				<div class="container-fluid px-4 px-lg-5" id="subNav">
					<a class="navbar-brand jalnanche" id="navTitle" href="/index.jsp"
						style="font-weight: bold;">니꺼내꺼</a>
					<button class="navbar-toggler navbar-toggler-right"
						id="navBtn" type="button"
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
						<ul
							class="navbar-nav mt-2 mb-2 mb-lg-0 text-end t-inline d-block d-lg-none">
							<li class="nav-item t-inline">
								<a href="/member/login.jsp"><button class="btn btn-outline-dark loginBtn toLogin">로그인</button></a>
							</li>
							<li class="nav-item t-inline">
								<a href="/member/joinForm.jsp"><button class="btn btn-dark joinBtn toJoin" style="margin-left: 10px">회원가입</button></a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</c:otherwise>
	</c:choose>

	<!-- 테마 게시판 -->
	<div class="container containerSetting">
		<div class="row freeBoard m-0 mt-5 mb-2">
			<h5 class="text-center">전기차 게시판</h5>
			<p class="text-center mb-1">우리 동네 전기차 충전소를 알아보세요.</p>
		</div>
		<!-- 지도 -->
		<div class="row">
			<div class="col">
				<div id="map" class="carMap"></div>
			</div>
		</div>

		<!-- 게시판 테이블 -->
		<table class="table table-borderless mt-5">
			<thead>
				<tr class="text-center thread">
					<th class="boardSeq"></th>
					<th class="thTitle">제목</th>
					<th class="thWriter">작성자</th>
					<th class="thDate">날짜</th>
					<th class="thViewCount">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${list }">
					<tr>
						<th scope="row" class="text-center boardSeq">${i.seq}</th>
						<td class="title boardTitle"><a href="detail.carBoard?seq=${i.seq }">${i.title }</a></td>
						<td class="text-center m-inline boardWriter">${i.writer }</td>
						<td class="text-center m-inline boardDate">${i.formedDate }</td>
						<td class="text-center m-inline boardViewCount">${i.viewCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- Navi Page -->
		<div class="row w-100 mb-3">
			<div class="col text-center">${navi }</div>
		</div>

		<!-- 게시판 리스트 버튼 -->
		<div class="row w-100">
			<div class="col text-end">
				<form action="/searchtitle.carBoard" style="display:inline">
               			<input type=text name=searchtitle class="inputSearch">&nbsp;
               			<button type=submit class="btn boardSearchBtn btnHover" style="margin-bottom:4px;">검색</button>&nbsp;
         		</form>
			
				<a href="/index.jsp"><button class="btn toMain boardBtn btnHover" style="margin-bottom:4px;">돌아가기</button></a>&nbsp;
				
				<c:if test="${loginId ne null}">
					<a href="/write.carBoard"><button class="btn boardBtn btnHover" id="electwrite" style="margin-bottom:4px;">작성하기</button></a>
				</c:if>
				
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

	<script type="module">

        import { item } from "/carBoard/electinfo.js";
        var mapContainer = document.getElementById('map'), // 지도의 중심좌표
            mapOption = {
                center: new kakao.maps.LatLng(37.567247, 126.982793), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
      // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      var mapTypeControl = new kakao.maps.MapTypeControl();
      // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
      // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      
        // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

         for(var i = 0; i < 1000; i++) {
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: new kakao.maps.LatLng(item[i].lat,item[i].lng) // 마커의 위치
            });

            // 마커에 표시할 인포윈도우를 생성합니다 
            var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width: 350px; padding: 13px;">'+'<h4 class="p-2 m-0 mb-1 statnm" style="background-color: #2c8ff7; color: white; border-radius: 18px">'+item[i].statnm+'</h4>'+'<div style="margin-left: 8px">'+item[i].addr+'</div>'+'<div style="margin-left: 8px">'+item[i].usetime +'</div>'+'<div style="margin-left: 8px">'+'주차료무료(Y/N) : '+item[i].parkingfree+'</div>'+'<div style="margin-left: 8px">'+'연락처 : '+item[i].busicall+'</div>'+'</div>'
         });

            // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
            // 이벤트 리스너로는 클로저를 만들어 등록합니다 
            // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        }

        // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
        function makeOverListener(map, marker, infowindow) {
            return function () {
                infowindow.open(map, marker);
            };
        }

        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        function makeOutListener(infowindow) {
            return function () {
                infowindow.close();
            };
        }

	 </script>
	</body>
</html>