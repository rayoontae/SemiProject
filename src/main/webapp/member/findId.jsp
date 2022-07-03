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
          <h3 style="font-weight: bold">아이디 찾기</h3>
        </div>
      </div>
      <form method=post id=form>
        <div class="row findOption text-center">
          <!-- radio -->
          <div class="col-6 mb-2">
            <input type="radio" id="email2" checked name="findID" />
            <label for="email2">이메일로 찾기</label>
          </div>
          <div class="col-6 mb-2">
            <input type="radio" id="phone2" name="findID" />
            <label for="phone2">번호로 찾기</label>
          </div>
        </div>

        <!-- input -->
        <div class="row findDiv useByEmail mb-2">
          <div class="col-12 text-start">이름</div>
          <div class="col-12 mb-2">
            <input type="text" name="name" id="name" class="name" placeholder="이름" />
          </div>
          <div class="col-12 text-start">이메일</div>
          <div class="col-12">
            <input
              type="text"
              name="email"
              id="email"
              class="email"
              placeholder="이메일"
            />
          </div>
          <div class="row">
          <div class="col-12">
            <button class="btn btn-primary findBtn" id=find1>찾기</button>
          </div>
        </div>
        </div>
        <div class="row findDiv useByPhone mb-2" style="display: none">
          <div class="col-12 text-start">이름</div>
          <div class="col-12 mb-2">
            <input type="text" name="name2" id="name2" class="name" placeholder="이름" />
          </div>
          <div class="col-12 text-start">전화번호</div>
          <div class="col-12">
            <input
              type="text"
              name="phone"
              id="phone"
              class="phone"
              placeholder="전화번호"
            />
          </div>
          <div class="row">
          <div class="col-12">
            <button class="btn btn-primary findBtn" id=find2>찾기</button>
          </div>
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
	$("#email2").on("change", function () {
        console.log("test");
        $(".useByEmail").css("display", "block");
        $(".useByPhone").css("display", "none");
      });
      $("#phone2").on("change", function () {
        $(".useByEmail").css("display", "none");
        $(".useByPhone").css("display", "block");
      });
    </script>
    
    <!-- email로 찾기 -->
    <script>
	// 유효성 검사
	$("#find1").on("click", function() {
		let nameRegex = /^[가-힣]{2,5}$/;
		let emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	
		// 이름 검사
		if ($("#name").val() == "") {
            alert("이름을 입력해주세요.")
            $("#name").focus()
            return false
        } else if (nameRegex.test($("#name").val()) == false) {
        	alert("이름은 한글 2~5자로 입력해주세요.");
            $("#name").val("")
            $("#name").focus()
            return false
        }
		// 이메일 검사
		if ($("#email").val() == "") {
            alert("이메일을 입력해주세요.")
            $("#email").focus()
            return false
        } else if (emailRegex.test($("#email").val()) == false) {
        	alert("이메일 형식에 맞게 입력하세요.");
            $("#email").val("")
            $("#email").focus()
            return false
        }
    
		$.ajax({
			url : "/missingIdEmail.member",
			data : {
				name : $("#name").val(),
				email : $("#email").val()
			},
			dataType : "json"
			
		}).done(function(id){
			if(id != null){
   				alert("고객님 아이디는 : " + id + "\n로그인 화면으로 돌아갑니다!")
   				location.replace("/member/login.jsp") 
     		}else{
     			alert("가입된 아이디가 없습니다.")
     			$("#name").val("")
     			$("#email").val("")
                $("#name").focus()
     		}
		})
	});
 	</script>
 	
 	<!-- phone로 찾기 -->
 	<script>
	// 유효성 검사
	$("#find2").on("click", function() {
		let nameRegex = /^[가-힣]{2,5}$/;
		let phoneRegex = /^01[\d]-?\d{3,4}-?\d{4}$/;
		// 이름 검사
		if ($("#name2").val() == "") {
            alert("이름을 입력해주세요.")
            $("#name2").focus()
            return false
        } else if (nameRegex.test($("#name2").val()) == false) {
        	alert("이름은 한글 2~5자로 입력해주세요.");
            $("#name2").val("")
            $("#name2").focus()
            return false
        }
		// 핸드폰 검사
    	if ($("#phone").val() == "") {
        	alert("전화번호를 입력해주세요.")
        	$("#phone").focus()
        	return false
    	}else if (phoneRegex.test($("#phone").val()) == false) {
    		alert("전화번호를 형식에 맞게 입력해주세요.");
       		$("#phone").val("")
        	$("#phone").focus()
        	return false
        }
    
		//email로 찾는 ajax
		$.ajax({
			url : "/missingIdPhone.member",
			data : {
				name2 : $("#name2").val(),
				phone : $("#phone").val()
			},
			dataType : "json"
			
		}).done(function(id){
			if(id != null){
   				alert("고객님 아이디는 : " + id + "\n로그인 화면으로 돌아갑니다!")
   				location.replace("/member/login.jsp") 
     		}else{
     			alert("가입된 아이디가 없습니다.")
     			$("#name2").val("")
     			$("#phone").val("")
                $("#name2").focus()
     		}
		})
	});
 	</script>
</body>
</html>