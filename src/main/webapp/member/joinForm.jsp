<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니꺼내꺼 회원가입</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/joinForm.css" />
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
<!-- 카카오 API -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

	<!-- 회원가입  -->
	<div class="container containerSetting mt-3">
		<div class="row joinRow mt-5 text-center">
			<div class="col mb-4">
				<h3 style="font-weight: bold">회원가입</h3>
			</div>
		</div>

		<form action="/insert.member" method="post" id="form" class="text-center">
			<div class="row joinRow id-field">
				<div class="col-12 text-start">아이디</div>
				<div class="col-12 text-start idInputDiv">
					<div class="row m-0 p-0">
						<div class="col-9 m-0 p-0">
							<input type="text" id="id" name="id" class="id idInput" placeholder="아이디" style="inline-block"/>
						</div>
						<div class="col m-0 p-0 text-end">
							<button type="button" id="duplCheck" class="btn btn-outline-dark duplCheckBtn" >중복검사</button>
						</div>
					</div>
				</div>
			</div>

					
			<div class="row joinRow pw-field">
				<div class="col-12 text-start">비밀번호</div>
				<div class="col-12 mb-2">
					<input type="password" id="pw" name="pw" class="pw inputForm" placeholder="비밀번호" />
				</div>
				<div class="col-12">
						<input type="password" id="pwCheck" class="pwCheck inputForm" placeholder="비밀번호 재입력">
<!-- 						<div class="text-start" id="result" ></div> -->
                		<input type="text" id="result" style="border:0; width:300px;">
				</div>
			</div>

			<div class="row joinRow name-field">
				<div class="col-12 text-start">이름</div>
				<div class="col-12">
					<input type="text" id="name" name="name" class="name inputForm" placeholder="이름" />
				</div>
			</div>

			<div class="row joinRow phone-field">
				<div class="col-12 text-start">전화번호</div>
				<div class="col-12">
					<input type="text" id="phone" name="phone" class="phone inputForm" placeholder="전화번호" />
				</div>
			</div>

			<div class="row joinRow email-field">
				<div class="col-12 text-start">이메일</div>
				<div class="col-12">
					<input type="text" id="email" name="email" class="email inputForm" placeholder="이메일" />
				</div>
			</div>

			<div class="row joinRow zipcode-field">
				<div class="col-12 text-start">우편번호</div>
				<div class="col-12 text-start zipcodeInput">
					<input type="text" id="zipcode" name="zipcode" class="zipcode" placeholder="우편번호" style="inline-block"/>
					<button type="button" id="search" class="btn btn-outline-dark addressBtn" >찾기</button>
				</div>
			</div>

			<div class="row joinRow road-field">
				<div class="col-12 text-start">도로명 주소</div>
				<div class="col-12">
					<input type="text" id="roadAddress" name="roadAddress" class="road inputForm" placeholder="도로명 주소" />
				</div>
			</div>

			<div class="row joinRow jibun-field">
				<div class="col-12 text-start">지번 주소</div>
				<div class="col-12">
					<input type="text" id="jibunAddress" name="jibunAddress" class="jibun inputForm" placeholder="지번 주소" />
				</div>
			</div>

			<div class="row joinRow spec-field">
				<div class="col-12 text-start">상세 주소</div>
				<div class="col-12">
					<input type="text" id="specAddress" name="specAddress" class="spec inputForm" placeholder="상세 주소" />
				</div>
			</div>

			<div class="row joinRow personal-field">
				<div class="col-12 text-start">개인질문</div>
				<div class="col-12 mb-2">
					<input type="text" name="personal" class="personal" placeholder="나의 보물 1호는?" disabled/>
		
				</div>
				<div class="col-12">
				<input type="text" name="personalAnswer" id="personalAnswer" class="answer" placeholder="답변" />
				</div>
			</div>

			<div class="col-12 mt-5">
				<button class="btn btn-primary joinBtn">회원가입</button>
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
		// 네비바 로그인, 회원가입 버튼
		$(".toLogin").on("click", function() {
			console.log("test");
			location.href = "/member/login.jsp"
		})
		$(".toJoin").on("click", function() {
			console.log("test");
			location.reload();
		})

		// 카카오 지도 api
		document.getElementById("search").onclick = execDaumPostcode;

		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							document.getElementById('zipcode').value = data.zonecode;
							document.getElementById("roadAddress").value = data.roadAddress;
							document.getElementById("jibunAddress").value = data.jibunAddress;

						}
					}).open();
		}

		let isDuplCheckDone = 0;
		
		// 아이디 중복검사
		$("#duplCheck").on("click", function(){
    		let idRegex = /^[a-z][a-z\d_]{5,13}$/g;
    		
			if($("#id").val() == "") {
				alert("아이디를 입력해주세요.")
				$("#id").focus()
				return false
			} else if(idRegex.test($("#id").val()) == false) {
				alert("아이디는 6~14자의 소문자, 숫자, '_' 만 사용 가능하며 숫자와 '_' 는 첫 글자로 올 수 없습니다.")
				$("#id").val("")
				$("#id").focus()
				return false
			}
			
			$.ajax({
				url : "/duplCheck.member",
				data : {id : $("#id").val()},
				dataType : "json"
			}).done(function(result){
				if(result) {
					alert("이미 존재하는 아이디입니다.")
					$("#id").val("")
					$("#id").focus()
				} else {
					if(confirm("사용가능한 아이디입니다. 사용하시려면 확인을 눌러주세요.")) {
						$("#pw").focus()
						isDuplCheckDone = $("#id").val();
					} else {
						$("#id").val("")
						$("#id").focus()
					}
				}
			})
			
		})
		
		// 패스워드 일치 확인
		$("#pwCheck").on("input", function(){
         if($("#pw").val() == $(this).val()) {
            $("#result").val("패스워드가 일치합니다.").css("color", "dodgerblue")
         } else {
            $("#result").val("패스워드가 일치하지 않습니다.").css("color", "crimson")
         }
      })
      
      $("#pw").on("input", function(){
         
         if($("#pwCheck").val() != "") {
         
            if($("#pwCheck").val() == $(this).val()) {
               $("#result").val("패스워드가 일치합니다.").css("color", "dodgerblue")
            } else {
               $("#result").val("패스워드가 일치하지 않습니다.").css("color", "crimson")
            }
         
         }
      })

		// 유효성 검사
		$("#form").on("submit", function(e){
			let idRegex = /^[a-z][a-z\d_]{5,13}$/;
			let pwRegex = /.{8,16}/;
			let nameRegex = /^[가-힣]{2,5}$/;
			let phoneRegex = /^01[\d]-?\d{3,4}-?\d{4}$/;
			let emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
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
            
			// 패스워드 검사
			}else if ($("#pw").val() == "") {
                alert("비밀번호를 입력해주세요.")
                $("#pw").focus()
                return false
            } else if (pwRegex.test($("#pw").val()) == false) {
                alert("PW는 8~16자로 구성되어야 합니다.")
                $("#pw").val("")
                $("pw_check").val("");
                $("#pw").focus()
                return false
                
             // 비번 일치 체크
            }  else if ($("#pw").val() != $("#pwCheck").val()) {
                alert("pw가 일치하지 않습니다. 다시입력해주세요.")
                $("#pw").val("")
                $("#pwCheck").val("")
                $("#result").val("")
                $("#pw").focus()
                return false
                
			// 이름 검사
            }else if ($("#name").val() == "") {
                alert("이름을 입력해주세요.")
                $("#name").focus()
                return false
            } else if (nameRegex.test($("#name").val()) == false) {
            	alert("이름은 한글 2~5자로 입력해주세요.");
                $("#name").val("")
                $("#name").focus()
                return false
            
			// 핸드폰 검사
            }else if ($("#phone").val() == "") {
                alert("휴대폰 번호를 입력해주세요.")
                $("#phone").focus()
                return false
            } else if (phoneRegex.test($("#phone").val()) == false) {
            	alert("휴대전화번호를 형식에 맞게 입력해주세요.");
                $("#phone").val("")
                $("#phone").focus()
                return false
            
			// 이메일 검사
            }else if ($("#email").val() == "") {
                alert("이메일을 입력해주세요.")
                $("#email").focus()
                return false
            } else if (emailRegex.test($("#email").val()) == false) {
            	alert("이메일 형식에 맞게 입력하세요.");
                $("#email").val("")
                $("#email").focus()
                return false
            
			//zip code
            }else if ($("#zipcode").val() == "") {
				alert("주소를 입력해주세요.");
				$("#zipcode").focus();
				return false;
			}else if ($("#roadAddress").val() == "") {
            	alert("도로명주소를 입력해주세요.")
            	$("#roadAddress").focus()
            	return false
            }else if ($("#jibunAddress").val() == "" ) {
            	alert("지번주소를 입력해주세요.")
            	$("#jibunAddress").focus()
            	return false
            } else if ($("#specAddress").val() == "") {
            	alert("상세주소를 입력해주세요.")
            	$("#specAddress").focus()
            	return false
            // 개인질문답변
            } else if ($("#personalAnswer").val() == "") {
            	alert("개인질문답변을 입력해주세요.")
            	$("#personalAnswer").focus()
            	return false
            	
            // 중복체크 했는지 확인
            } else if (isDuplCheckDone == 0 || isDuplCheckDone != $("#id").val()) {
               alert("아이디 중복체크를 해주세요.")
               return false
               
            // 가입완료
            } else {
				e.preventDefault()
    			
    			Swal.fire({
    				title : "Welcome!",
    				text : "회원가입이 완료되었습니다!",
    				icon : "success"
    			}).then(function(){
    				document.getElementById("form").submit();
    			})
            }
		});

		// 뒤로가기
		$("#back").on("click", function() {
			location.href = "/index.jsp"
		})
	</script>

</body>
</html>