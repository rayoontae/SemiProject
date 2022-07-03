<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>아이디 찾기 | 니꺼내꺼</title>
<!-- CSS External -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css" />
    <!-- 구글 아이콘 -->
    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"/>
    <!-- 부트스트랩 CDN-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <!--  부트스트랩 CDN_JS  -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
    <style>
    	.findDiv{
    		width: 370px;
  			margin-bottom: 15px;
    	}
    	.inputForm {
  width: 360px;
  height: 50px;
  padding: 10px;
}
    </style>
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

    <!-- 아이디 찾기 -->
    <div class="container containerSetting mt-5 text-center">
      <div class="row mt-5">
        <div class="col mb-4">
          <h3 style="font-weight: bold">비밀번호 재설정</h3>
        </div>
      </div>
      
     <form action="/pwUpdate.member" method=post id=form>
        <div class="row findOption text-center"></div>

        <!-- input -->
        <div class="row findDiv useByEmail mb-2">
          <div class="col-12 text-start">비밀번호</div>
          <div class="col-12 mb-2">
            <input type="password" class="pw inputForm" name=pw id=pw placeholder="비밀번호를 입력하세요"/>
          </div>
          <div class="col-12 text-start">PW 재설정</div>
          <div class="col-12">
           <input type="password" id="pwCheck" class="pw_check_msg inputForm" placeholder="비밀번호를 다시 입력하세요"/>
           <div class="text-start" id="result" ></div>
<!--            <input type="text" id="result" style="border:0; width:300px;"> -->
          </div>
        </div>
          <div class="row">
         	 <div class="col-12">
          	 <button class="btn btn-primary findBtn" id=submit>확인</button>
             <button type="button" class="btn btn-primary findBtn" id=back>뒤로</button>
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
	//pw 검사
	$("#pwCheck").on("input", function(){
         if($("#pw").val() == $(this).val()) {
            $("#result").html("패스워드가 일치합니다.").css("color", "dodgerblue")
         } else {
            $("#result").html("패스워드가 일치하지 않습니다.").css("color", "crimson")
         }
      })
      
      $("#pw").on("input", function(){
         
         if($("#pwCheck").val() != "") {
         
            if($("#pwCheck").val() == $(this).val()) {
               $("#result").html("패스워드가 일치합니다.").css("color", "dodgerblue")
            } else {
               $("#result").html("패스워드가 일치하지 않습니다.").css("color", "crimson")
            }
         
         }
      })

		//유효성 검사
		$("#submit").on("click", function() {
			let pwRegex = /.{8,16}/;
			
			// 패스워드 검사
			if ($("#pw").val() == "") {
                alert("비밀번호를 입력해주세요.")
                $("#pw").focus()
                return false
            } else if (pwRegex.test($("#pw").val()) == false) {
                alert("PW는 8~16자로 구성되어야 합니다.")
                $("#pw").val("")
                $("#pwCheck").val("");
                $("#pw").focus()
                return false
             // 비번 일치 체크
            }  else if ($("#pw").val() != $("#pwCheck").val()) {
                alert("pw가 일치하지 않습니다. 다시입력해주세요.")
                $("#pw").val("")
                $("#pwCheck").val("")
                $("#result").text("")
                $("#pw").focus()
                return false
            }else{
               alert("pw변경완료! 메인화면으로 돌아갑니다!") 
                  }
		});
		
		$("#back").on("click",function(){
			location.href="/member/login.jsp";
		})
	</script>
  </body>
</html>
