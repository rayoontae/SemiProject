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
	href="${pageContext.request.contextPath}/css/find.css" />
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
				<a href="/member/login.jsp"><button class="btn btn-outline-dark toLogin">로그인</button></a>
				<a href="/member/joinForm.jsp"><button class="btn btn-outline-dark toJoin" style="margin-left: 10px">회원가입</button></a>
			</div>
		</div>
	</nav>

	<!-- 아이디 찾기 -->
	<div class="container containerSetting mt-5 text-center">
		<div class="row mt-5">
			<div class="col mb-4">
				<h3 style="font-weight: bold">비밀번호 찾기</h3>
			</div>
		</div>
		<form action="" class="text-center">
			<!-- input -->
        <div class="row findDiv mb-2">
          <div class="col-12 text-start">아이디</div>
          <div class="col-12">
            <input type="text" name="id" id=id class="id" placeholder="아이디" />
          </div>
        </div>
        <div class="row findDiv personal-field mb-2">
          <div class="col-12 text-start">개인질문</div>
          <div class="col-12">
            <input type="text" class="answer" placeholder="나의 보물 1호는?" disabled/>
          </div>
          <div class="col-12">
            <input type="text" name=personalanswer id=personalanswer class="answer" placeholder="답변" />
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button class="btn btn-primary findBtn" id=find>찾기</button>
          </div>
        </div>
      </form>
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
	$("#find").on("click", function() {
		
		let idRegex = /^[a-z][a-z\d_]{5,13}$/;
		// 아이디 검사
		if ($("#id").val() == "") {
            alert("아이디를 입력해주세요.")
            $("#id").focus()
            return false
        } else if (idRegex.test($("#id").val()) == false) {
            alert("아이디는 6~14자의 소문자, 숫자, '_' 만 사용 가능하며 숫자와 '_' 는 첫 글자로 올 수 없습니다.")
            $("#id").val("")
            $("#id").focus()
            return false
        }else if ($("#personalanswer").val() == "") {
            alert("답변을 입력해주세요!")
            $("#personalanswer").focus()
            return false
        }
		
		$.ajax({
			url : "/missingPw.member",
			data : {
				id : $("#id").val(),
				personalanswer : $("#personalanswer").val()
			},
			dataType : "json"
			
		}).done(function(id2){
			if(id2 != null){
   				alert("정답입니다!")
   				location.replace("pwUpdate.jsp") 
     		}else{
     			alert("틀렸습니다!")
     			$("#id").val("")
     			$("#personalanswer").val("")
                $("#id").focus()
     		}
		})

	});
	
	$("#back").on("click",function(){
		location.href="index.jsp";
	})
	</script>
</body>
</html>