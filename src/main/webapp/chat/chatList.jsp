<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅함 | 니꺼내꺼</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/chatList.css" />

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

<style>
	
	.roomOut:hover{
		cursor:pointer;
	}

</style>

</head>
<body>

	<c:choose>
		<c:when test="${isLoginOk == 1}">
			<!-- 로그인시 네비바 -->
			<nav class="navbar fixed-top navbar-expand-lg navbar-light py-auto rr"
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

			<nav class="navbar fixed-top navbar-expand-lg py-auto" id="mainNav">
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


	<div class="container containerSetting mb-5">
		<div class="row w-100 chatting text-center">
			<div class="col-12 text-start">
				<span class="chattingDiv">
					<h5 style="font-weight: bold" class="chatH5">채팅함</h5>
				</span>
			</div>
		</div>

		<!-- 채팅 목록 리스트 -->
		<div class="row w-100 chatList">
			<!-- loginId가 user1인지 또는 user2인지에 따라 2가지 조건 필요 -->
			<c:if test="${list[0].user1 ne null }">
				<c:forEach var="i" items="${list}" varStatus="status">

					<c:if test="${(i.user1 eq loginId)}">

						<div class="col-12 mb-3">

							<div class="row w">
								<div class="col-12 test" id="box${status.count }">
									<img src="/file/${sysNameList[status.index] }" class="chatImg p-1" />
									<span>
										<a href="/chatWith.chat?with=${i.user2}">${i.user2 }님과의 대화</a>
									</span>
								</div>
							</div>

							<c:forEach var="j" items="${list2}">
								<c:if test="${(j.sender eq i.user1 && j.receiver eq i.user2) or (j.receiver eq i.user1 && j.sender eq i.user2) }">
									<div class="row w-100">
										<div class="col-12 chatDiv" >
											<span class="recentMsg">${j.contents }</span>
										<c:if test="${j.receiver eq loginId && j.read == 0 }">
											<script language="javaScript">
												$("#box${status.count }").append("<span style='color:red;'>New</span>");
											</script>
										</c:if> 
											<span>
												<img src="/source/icons/delete.png" class="roomOut text-end" opponentId=${i.user2 } invisibleTo=${i.invisibleTo }>
											</span>
										</div>
									</div>
								
								</c:if>
							</c:forEach>
							<hr>
						</div>

					</c:if>

					<c:if test="${(i.user2 eq loginId)}">

						<div class="col-12 mb-3">

							<div class="row w-100">
								<div class=col-12>
									<img src="/file/${sysNameList[status.index] }" class="chatImg p-1" />
									<span class="test" id="box${status.count }">
										<a href="/chatWith.chat?with=${i.user1}">${i.user1 }님과의 대화</a>
										
									</span>
								</div>
							</div>

							<c:forEach var="j" items="${list2}">
								<c:if test="${(j.sender eq i.user1 && j.receiver eq i.user2) or (j.receiver eq i.user1 && j.sender eq i.user2) }">
									<div class="row w-100">
										<div class="col-12 chatDiv">
											<span class="recentMsg">${j.contents }</span>
											<c:if test="${j.receiver eq loginId && j.read == 0 }">
												<script language="javaScript">
													$("#box${status.count }").append("<span style='color:red;'>New</span>");
												</script>
											</c:if> 
											<span>
												<img src="/source/icons/delete.png" class="roomOut text-end" opponentId=${i.user1 } invisibleTo=${i.invisibleTo }>
											</span>
										</div>
									</div>
									
								</c:if>
							</c:forEach>
							<hr>
						</div>

					</c:if>

				</c:forEach>
			</c:if>

			<c:if test="${list[0].user1 eq null }">
				<div class="col-12  text-center">
					<img src="/source/img/empty.png" class="chatEmpty p-1" />
					
					<div class="text-center">
						주고 받은 채팅이 존재하지 않습니다.</br> 상품 판매자와 채팅을 주고 받고 거래를 해보세요.
					</div>
				</div>
			</c:if>

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
	
		$(".roomOut").on("click", function() {
			
			Swal.fire({
				  title: "채팅방 나가기",
				  text: "채팅방을 나가면 대화 내용과 채팅 목록이 삭제됩니다.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: "나갈래요.",
				  cancelButtonText: "취소할래요."
				}).then((result) => {
				  if (result.isConfirmed) {
					  $.ajax({
							url : "/invisibleTo.chat",
							data : {
								loginId : "${loginId}",
								opponentId : $(this).attr("opponentId"),
								invisibleTo : $(this).attr("invisibleTo")
							},
							dataType:"json"	
						}).done(function(resp) {
							location.reload();
						})
				  }
				})
				
// 			$.ajax({
// 				url : "/invisibleTo.chat",
// 				data : {
// 					loginId : "${loginId}",
// 					opponentId : $(this).attr("opponentId"),
// 					invisibleTo : $(this).attr("invisibleTo")
// 				},
// 				dataType:"json"	
// 			}).done(function(resp) {
// 				location.reload();
// 			})
		})
	</script>
</body>
</html>