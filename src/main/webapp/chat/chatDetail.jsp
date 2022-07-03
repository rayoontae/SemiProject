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
	href="${pageContext.request.contextPath}/css/chatDetail.css" />

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

	<div class="container containerSetting">

		<div class="row w-75">
		
			<div class="col-12 chatDiv p-0" >
				<div class="row w-100">
					<div class="col-9 chatWithDiv ">
						<div class="chatWith p-2 text-start">${with }님과의 대화</div>
					</div>
					<div class="col text-end cancelDiv">
						<a href="/chatRoom.chat?loginId=${loginId }" class="cancel mouse-effect">
							<img src="/source/icons/toChatRoom.svg">
						</a>
					</div>
				</div>
			</div>
		
			<div class="col-12 p-0">

				<div id="board">
					
					<div id="result" style="height: 85%; background-color: lightblue;">

						<br>

						<c:forEach var="i" items="${list }">
							<c:if test="${i.sender eq loginId }">
								<div style='text-align: right;'>
									<div style='text-align: left; background-color: lemonchiffon;'>${i.contents }</div>
								</div>
							</c:if>
							<c:if test="${i.sender ne loginId }">
								<div style='color: white; margin-bottom: -6px;'>
									&nbsp;<img class="profileImg" src="/file/${sysName }"
										style='width: 42px; height: 42px; border-radius: 50%; vertical-align: middle; object-fit: cover;'>&nbsp;${i.sender }
								</div>
								<div>
									<div>${i.contents }</div>
								</div>

							</c:if>
						</c:forEach>

					</div>

					<div id="inputBox" style="height: 15%;">
						<div id="input" contenteditable="true"
							style="width: 75%; padding-left: 7px; padding-top: 7px; outline: 0px;"></div>
						<div style="width: 25%; height: 100%;">
							<button id="send" style="width: 100%; height: 100%;">Send</button>
						</div>
					</div>
				</div>
				<br>
				<div style="text-align: center;">
					
				</div>

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
	
		$("#result").scrollTop($("#result").prop("scrollHeight"));

		let webSocket = new WebSocket("ws://218.144.199.10/broadsocket?loginId=${loginId}")

		let messageTextArea = document.getElementById("result")

		webSocket.onopen = function(message) {
			$("#input").html("");
			$("#input").focus();
		}

		webSocket.onclose = function(message) {
			messageTextArea.innerHTML += message.code + ""
			messageTextArea.innerHTML += "Server is now Disconnected...\n"
		}

		webSocket.onerror = function(message) {
			messageTextArea.innerHTML += "error...\n"
		}

		webSocket.onmessage = function(message) {
			let result = message.data.split("!%!")
			$("#result")
					.append(
							"<div style='color:white; margin-bottom:-6px;'>&nbsp;<img src='/file/"
									+ result[0]
									+ "' style='width:42px; height:42px; object-fit:cover; border-radius:50%; vertical-align:middle;'>&nbsp;"
									+ result[1] + "</div><div><div>"
									+ result[2]);
			$("#result").scrollTop($("#result").prop("scrollHeight"));
		}

		document
				.getElementById("send")
				.addEventListener(
						"click",
						function() {
							let user = "${loginId }"
							let message = $("#input").text()

							let blank_pattern = /^\s+|\s+$/g;
							if (message.replace(blank_pattern, '') != "") {

								$("#result")
										.append(
												"<div style='text-align:right;'><div style='text-align:left; background-color:lemonchiffon;'>"
														+ message);
								$("#input").text("");
								$("#input").focus();
								$("#result").scrollTop(
										$("#result").prop("scrollHeight"));

								webSocket.send("${loginId}{=}${with }{=}"
										+ message)
								message = ""
							} else {
								return false;
							}
						})

		document
				.getElementById("input")
				.addEventListener(
						"keyup",
						function(e) {
							if (e.which == 13) {
								let user = "${loginId }"
								let message = $("#input").text()

								let blank_pattern = /^\s+|\s+$/g;
								if (message.replace(blank_pattern, '') != "") {

									$("#result")
											.append(
													"<div style='text-align:right;'><div style='text-align:left; background-color:lemonchiffon;'>"
															+ message);
									$("#input").text("");
									$("#input").focus();
									$("#result").scrollTop(
											$("#result").prop("scrollHeight"));

									webSocket.send("${loginId}{=}${with }{=}"
											+ message)
									message = ""
								} else {
									return false
								}
							}
						})

		//       document.getElementById("disconnect").addEventListener("click", function(){
		//           webSocket.close()
		//       })
		
		window.history.forward();      
      	function noBack() {   window.history.forward();}
	</script>

</body>
</html>