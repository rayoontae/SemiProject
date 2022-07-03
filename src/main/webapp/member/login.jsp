<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니꺼내꺼 로그인</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css" />
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
</head>
<body>
	<!-- 네비바 -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-light py-auto"
		id="mainNav">
		<div class="container-fluid px-4 px-lg-5" id="subNav">
			<a class="navbar-brand jalnanche" id="navTitle" href="/index.jsp"
				style="font-weight: bold">니꺼내꺼</a>
			<div class="" style="justify-content: space-between">
				<a href="/member/login.jsp"><button class="btn btn-outline-dark loginBtn toLogin">로그인</button></a>
				<a href="/member/joinForm.jsp"><button class="btn btn-dark joinBtn toJoin" style="margin-left: 10px">회원가입</button></a>
			</div>
		</div>
	</nav>
	
	<!-- 로그인  -->
	<div class="container containerSetting mt-5 text-center">
		<div class="row mt-5">
			<div class="col mb-4">
				<h3 style="font-weight: bold">로그인</h3>
			</div>
		</div>
		<form action="/login.member" method="post">
			<div class="row text-center">
				<div class="col-12 mb-2">
					<input type="text" name="id" id="id" class="id" placeholder="아이디" />
				</div>
				<div class="col-12 mb-2">
					<input type="password" name="pw" id="pw" class="pw"
						placeholder="비밀번호" />
				</div>
				<div class="col-12 mt-3 mb-4 login-action">
					<div class="row loginOption">
						<div class="col-5 text-start p-0">
							<input type="checkbox" name="idRemember" id="idRemember"
								class="idRemember" /> <span class="loginText">아이디 저장</span>
						</div>
						<div class="col-7 text-end p-0">
							<a href="/member/findId.jsp" class="loginText">아이디 찾기</a> | <a
								href="/member/findPw.jsp" class="loginText">비밀번호 찾기</a>
						</div>
					</div>
				</div>
				<div class="col-12">
					<button class="btn btn-primary loginbtn">로그인</button>
				</div>
			</div>
		</form>

		<!-- 회원가입 유도 -->
		<div class="row mt-5 join">
			<div class="col">
				<span>아직 니꺼내꺼 계정이 없나요?</span> <span class="joinUrl"><a
					href="/member/joinForm.jsp">회원가입</a></span>
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
	<!-- 	쿠키코드 하나 -->
	<script>
		//		아이디기억하기 cookie 하나
		$(document).ready(function() {

			// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
			var key = getCookie("key");
			$("#id").val(key);

			if ($("#id").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
				$("#idRemember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			}

			$("#idRemember").change(function() { // 체크박스에 변화가 있다면,
				if ($("#idRemember").is(":checked")) { // ID 저장하기 체크했을 때,
					setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
				} else { // ID 저장하기 체크 해제 시,
					deleteCookie("key");
				}
			});

			// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
			$("#id").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
				if ($("#idRemember").is(":checked")) { // ID 저장하기를 체크한 상태라면,
					setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
				}
			});
		});

		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires="
							+ exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}

		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}

		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	</script>
</body>
</html>