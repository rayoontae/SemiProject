<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니꺼내꺼</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index.css" />
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

			<!-- 메인  -->
			<div class="container containerSetting mt-4">
				<!-- 메인 이미지 -->
				<div class="row mainTop">
					<div class="col-12 col-xl-8 mainImg m-0 mt-3 mb-5">
						<div class="bannerTitle">
							<h1 class="bannerNumb"></h1>
							<h1 class="bannerFont">개의 상품이 거래중이에요</h1>
						</div>

						<a href="#product" style="z-index: 900">
							<button class="btn btn-light m-0 mt-3 p-2 mainBtn">둘러보기</button>
						</a>
					</div>

					<!-- 회원 PC화면 -->
					<div class="col-12 col-xl-4 m-0 mt-2 mb-3 pd pt-2 addAdmin">
						<div class="row loginBox d-none d-lg-block w-100 m-0 p-0 pt-3">
							<div class="col-12 mb-2 text-center div">
								<img src="" class="profileImg" />
									<span class="loginId"><strong>${loginId }</strong>님</span>
								
									<c:choose>
                           <c:when test = "${level==-3}">
                             <img src="/source/icons/levelm3.svg" class="grade p-1" />
                          </c:when>
                           <c:when test = "${level==-2}">
                              <img src="/source/icons/levelm2.svg" class="grade p-1" />
                           </c:when>
                           <c:when test = "${level==-1}">
                              <img src="/source/icons/levelm1.svg" class="grade p-1" />
                           </c:when>
                           <c:when test = "${level==1}">
                              <img src="/source/icons/level1.svg" class="grade p-1" />
                           </c:when>
                           <c:when test = "${level==2}">
                              <img src="/source/icons/level2.svg" class="grade p-1" />
                           </c:when>
                           <c:when test = "${level==3}">
                              <img src="/source/icons/level3.svg" class="grade p-1" />
                           </c:when>
                           <c:when test = "${level==4}">
                              <img src="/source/icons/level4.svg" class="grade p-1" />
                           </c:when>
                           <c:when test = "${level==5}">
                              <img src="/source/icons/level5.svg" class="grade p-1" />
                           </c:when>
                        </c:choose>
								
							</div>
							<div class="col-12 mt-3 myMenu text-center div pt-1">
								<div class="d-inline" id="toMyPage">
									<a href="/myPage.member">마이페이지</a>
								</div>
								<div class="d-inline" id="toMyStore">
									<a href="/myShop.member?parentId=${loginId }">내상점</a>
								</div>
								<div class="d-inline">
									<a class="chatRoom" href="/chatRoom.chat?loginId=${loginId }">채팅함</a>
								</div>
								<div class="d-inline" id="logout">
									<a href="/logout.member">로그아웃</a>
								</div>
							</div>

							<!-- 관리자 -->
							<c:if test="${loginId eq 'admin1234'}">
								<script>
								console.log("test")
								$(".myMenu").css("display","none");
								$(".grade").css("display","none");
								
								
								let admin = $("<div class='col-12 mt-3 admin'>")
								
								let anker = $("<a href='/admin/admin.jsp'>")
								
								let adminBtn = $("<button id='toAdmin' class='btn btn-dark'>");
								adminBtn.text("관리자 페이지");
								
								anker.append(adminBtn);
								admin.append(anker);
								
								$(".loginBox").append(admin);
								</script>
							</c:if>

						</div>

						<!-- 로그인시 다중채팅창 -->
						<div id="board" class="row m-0 mt-3 mb-5 p-0 w-100">

							<div id="result" style="height: 86%;"></div>

							<div id="inputBox" style="height: 18%;">
								<div id="input" contenteditable="true" style="width: 75%; padding-left: 7px; padding-top: 7px; outline: 0px;"></div>
								<div style="width: 25%; height: 100%;"><button id="send" style="width: 100%; height: 100%;">Send</button></div>
							</div>
						</div>


					</div>

				</div>


				<!-- 카테고리 -->
				<div class="mt-5" style="text-align: center">
					<h5>Category</h5>
				</div>
				<div class="row mt-4 m-0 pCategoryDiv">
					<div class="col pCategory categoryBtn" category="잡화">
						<img src="./source/icons/bag.svg" class="categoryBtn" category="잡화" />
						<p class="pCategoryName mt-1 pb-0 categoryBtn" category="잡화">잡화</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="가전">
						<img src="./source/icons/device.svg" class="categoryBtn" category="가전" />
						<p class="pCategoryName mt-1 categoryBtn" category="가전">가전</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="의류" >
						<img src="./source/icons/clothes.svg" class="categoryBtn" category="의류" />
						<p class="pCategoryName mt-1 categoryBtn" category="의류">의류</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="취미">
						<img src="./source/icons/habit.svg" class="categoryBtn" category="취미" />
						<p class="pCategoryName mt-1 categoryBtn" category="취미">취미</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="아동">
						<img src="./source/icons/kids.svg" class="categoryBtn" category="아동" />
						<p class="pCategoryName mt-1 categoryBtn" category="아동">아동</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="기타" >
						<img src="./source/icons/etc.svg" class="categoryBtn" category="기타" />
						<p class="pCategoryName mt-1 categoryBtn" category="기타">기타</p>
					</div>
				</div>

				<!-- 자유게시판 & 플리마켓  -->
				<div class="row boardRow mt-5">
					<hr class="mt-5" style="background-color: rgba(0, 0, 0, 0.4)" />

					<div class="col-12 eventBanner">
						<h5 class="mb-3">플리마켓</h5>
						<div class="eventBannerImg">
							<h3>니꺼내꺼 플리마켓</h3>
							<h6>22년 6월 당신의 근처에 찾아갑니다.</h6>
							<a href="market.jsp"><button type="button"
									class="btn btn-outline-dark marketBtn mt-2">자세히</button></a>
						</div>
					</div>

					<hr class="mt-5" style="background-color: rgba(0, 0, 0, 0.4)" />
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<!-- 로그인 실패시 -->
			<c:if test="${isLoginOk == 0 }">
				<script>
					Swal.fire({
						title : "로그인 실패",
						text : "아이디 또는 비밀번호를 다시 확인해주세요.",
						icon : "info"
					}).then(function() {
						location.href = "/logout.member"
					})
				</script>
			</c:if>

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

			<!-- 메인  -->
			<div class="container containerSetting mt-4">
				<!-- 메인 이미지 -->
				<div class="row mainTop">
					<div class="col-12 col-lg-8 mainImg m-0 mt-3 mb-5">
						<div class="bannerTitle">
							<h1 class="bannerNumb"></h1>
							<h1 class="bannerFont">개의 상품이 거래중이에요</h1>
						</div>

						<a href="#product" style="z-index: 900">
							<button class="btn btn-light mb-2 p-2 mainBtn" style="margin-top:7px;">둘러보기</button>
						</a>
					</div>

					<!-- 비회원 PC화면 -->
					
					<!-- lg 사이즈 -->
					<div class="d-none d-lg-block col-lg-4 m-0 mt-3 mb-5 ps-3 pd">
						<div class="row loginBox d-none d-lg-block w-100 text-center test m-0" style="padding-top:20px; height:124px;">
							<div class="mb-2 pt-2" >
								<a href="/member/login.jsp"><button class="btn login toLogin">로그인하기</button></a>
							</div>
							<div class="text-end">
								<a href="/member/joinForm.jsp" class="join text-end" style="color: #726647" >회원가입</a>
							</div>
						</div>
						
						<div class="row m-0 mt-4 mb-5 p-0 w-100 guide">
							<div class="col-12 p-4 text-center guidecomment">
								니꺼내꺼 방문이 처음이신가요?<br>
								니꺼내꺼에 대한 궁금한 사항을 해결해 보세요!<br><br>
								<a href="/guide.jsp"><button class="guideBtn">알아보기</button></a>
							</div>
						</div>
					</div>
					
					<!-- md 사이즈 아래 -->
					<div class="col-12 d-block d-lg-none m-0 mt-3 mb-5 p-0">
					
						<div class="row m-0 mt-1 mb-5 p-0 w-100 guide">
							<div class="col-12 p-4 text-center guidecomment">
								니꺼내꺼 방문이 처음이신가요?<br>
								니꺼내꺼에 대한 궁금한 사항을 해결해 보세요!<br><br>
								<a href="/guide.jsp"><button class="guideBtn">알아보기</button></a>
							</div>
						</div>
					</div>
				</div>


				<!-- 카테고리 -->
				<div class="mt-5" style="text-align: center">
					<h5>Category</h5>
				</div>
				<div class="row mt-4 m-0 pCategoryDiv">
					<div class="col pCategory categoryBtn" category="잡화">
						<img src="./source/icons/bag.svg" class="categoryBtn" category="잡화" />
						<p class="pCategoryName mt-1 pb-0 categoryBtn" category="잡화">잡화</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="가전">
						<img src="./source/icons/device.svg" class="categoryBtn" category="가전" />
						<p class="pCategoryName mt-1 categoryBtn" category="가전">가전</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="의류" >
						<img src="./source/icons/clothes.svg" class="categoryBtn" category="의류" />
						<p class="pCategoryName mt-1 categoryBtn" category="의류">의류</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="취미">
						<img src="./source/icons/habit.svg" class="categoryBtn" category="취미" />
						<p class="pCategoryName mt-1 categoryBtn" category="취미">취미</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="아동">
						<img src="./source/icons/kids.svg" class="categoryBtn" category="아동" />
						<p class="pCategoryName mt-1 categoryBtn" category="아동">아동</p>
					</div>

					<div class="col-4 col-md pCategory categoryBtn" category="기타" >
						<img src="./source/icons/etc.svg" class="categoryBtn" category="기타" />
						<p class="pCategoryName mt-1 categoryBtn" category="기타">기타</p>
					</div>
				</div>

				<!-- 자유게시판 & 플리마켓  -->
				<div class="row boardRow mt-5">
					<hr class="mt-5" style="background-color: rgba(0, 0, 0, 0.4)" />

					<div class="col-12 eventBanner">
						<h5 class="mb-3">플리마켓</h5>
						<div class="eventBannerImg">
							<h3>니꺼내꺼 플리마켓</h3>
							<h6>22년 6월 당신의 근처에 찾아갑니다.</h6>
							<a href="market.jsp"><button type="button"
									class="btn btn-outline-dark marketBtn mt-2">자세히</button></a>
						</div>
					</div>

					<hr class="mt-5" style="background-color: rgba(0, 0, 0, 0.4)" />
				</div>
			</div>

		</c:otherwise>
	</c:choose>

	<!-- 둘러보기 버튼 클릭하면 도착 위치 -->
	<div id="product">
		<br> <br> <br>
	</div>
	
	<!-- 무한스크롤네 집 -->
	<div class="container-fluid scroll">
		<div class="row w-100 m-0">
			<div class="col-12 p-0">
				<div class="row w-100 m-0" id=productTable></div>
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
	
	// 상품 갯수
	$.ajax({
		url:"/count.productBoard"
	}).done(function(resp){
		$(".bannerNumb").text(resp)
	})
	
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
	
	// 범준 추가
    // 프로필이미지 ajax
    if("${isLoginOk}" == 1) {
       
       $.ajax({
          url : "/indexSysName.member",
          dataType : "json"
       }).done(function(sysName){
          $(".profileImg").attr("src", "/file/" + sysName)
       })
       
    }
	
	// 상품검색
	$("#searchBtn").on("click",function() {
		let keyWord = $("#searchInput").val()
		location.href = "/search.productBoard?currPage=1&keyWord=" + keyWord
	})
				
	// 카테고리별 출력
    $(".categoryBtn").on("click", function(){
         let category = $(this).attr("category")
         location.href = "/category.productBoard?currPage=1&keyWord=" + category
    })
		
	// 로그인 성공시 다중채팅창 띄우기 (웹소켓 접속)
      if("${isLoginOk}" == 1) {
          // 프로필이미지 ajax
            $.ajax({
            url : "/indexSysName.member",
            dataType : "json"
         }).done(function(sysName){
            $(".profileImg").attr("src", "/file/" + sysName)
         })
         
     // 다중채팅창
       let webSocket = new WebSocket("ws://218.144.199.10/multi.chat")
       
       let messageTextArea = document.getElementById("result")

       webSocket.onopen = function(message) {
        	  
	// 	다중채팅창의 기존 메시지 (최대 200개) 를 우선 출력한다.
            $.ajax({
               url : "/list.multichatAjax",
               type : "post",
               dataType : "json"
            }).done(function(list){
               $("#result").append("<br>")
               
               if(list.length > 199) {
                  for(let i=list.length-200; i<list.length; i++) {
                      
                       if(list[i].writer == "${loginId}") {
                          $("#result").append("<div style='text-align:right;'><div style='text-align:left; background-color:lemonchiffon;'>" + list[i].contents);
                       
                       } else {
                          $("#result").append("<div style='color:white; margin-bottom:-6px;'>&nbsp;<img src='/file/" + list[i].sysName + "' style='width:42px; height:42px; border-radius:50%; vertical-align:middle; object-fit:cover;'>&nbsp;" + list[i].writer + "</div><div><div>" + list[i].contents);
                          
                       }
                       
                       $("#result").scrollTop($("#result").prop("scrollHeight"));
                       
                    }
                  
               } else {
                  for(let i=0; i<list.length; i++) {
                    
                     if(list[i].writer == "${loginId}") {
                        $("#result").append("<div style='text-align:right;'><div style='text-align:left; background-color:lemonchiffon;'>" + list[i].contents);
                     
                     } else {
                        $("#result").append("<div style='color:white; margin-bottom:-6px;'>&nbsp;<img src='/file/" + list[i].sysName + "' style='width:42px; height:42px; border-radius:50%; vertical-align:middle; object-fit:cover;'>&nbsp;" + list[i].writer + "</div><div><div>" + list[i].contents);
                        
                     }
                     
                     $("#result").scrollTop($("#result").prop("scrollHeight"));
                     
                  }
               
               }
               
            })
            
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
              $("#result").append("<div style='color:white; margin-bottom:-6px;'>&nbsp;<img src='/file/" + result[0] + "' style='width:42px; height:42px; border-radius:50%; vertical-align:middle;'>&nbsp;" + result[1] + "</div><div><div>" + result[2]);
                $("#result").scrollTop($("#result").prop("scrollHeight"));
           }

         document.getElementById("send").addEventListener("click", function(){
            let user = "${loginId }"
              let message = $("#input").text()
            
              let blank_pattern = /^\s+|\s+$/g;
                 if(message.replace(blank_pattern,'') != ""){
                    
                $("#result").append("<div style='text-align:right;'><div style='text-align:left; background-color:lemonchiffon;'>" + message);
                   $("#input").text("");
                   $("#input").focus();
                   $("#result").scrollTop($("#result").prop("scrollHeight"));
                       
                  webSocket.send("{{" + user + "}}" + message)
                  message = ""
             } else {
                return false
             }
           })

           document.getElementById("input").addEventListener("keyup", function(e){
              if(e.which == 13) {
                 let user = "${loginId }"
                 let message = $("#input").text()
                 
                 let blank_pattern = /^\s+|\s+$/g;
                    if(message.replace(blank_pattern,'') != ""){
                       
                   $("#result").append("<div style='text-align:right;'><div style='text-align:left; background-color:lemonchiffon;'>" + message);
                      $("#input").text("");
                      $("#input").focus();
                      $("#result").scrollTop($("#result").prop("scrollHeight"));
                       
                     webSocket.send("{{" + user + "}}" + message)
                     message = ""
                 } else {
                    return false
                 }
              }
           })
      }
           

		$(function() {

			// 무한 스크롤

	         // 메인 로드시 기본 6개
	         $.ajax({
	            url : "/scrollImage.productBoard",
	            type : "post",
	            dataType : "json",
	            async : false
	         // 이미지
	         }).done(
	            function(list) {

	            for (let i = 0; i < 6; i++) {
	               let table = $("#productTable")

	               let col = $("<div class='col-12 col-lg-6'>");

//	               let tr = $("<div class='row productTR m-auto' id=tr"+i+" style='border:2px solid #92B4EC; border-radius:22px; width:100%; height:40vmin;'>")
// 				   let tr = $("<div class='row productTR m-auto' id=tr"+i+" style='background-color: #F8F9FA; border-radius:22px; width:100%; height:40vmin;'>")
//				   let tr = $("<div class='row productTR m-auto' id=tr"+i+" style='background-color: #F8F8FF; border-radius:22px; width:100%; height:40vmin;'>")
				   let tr = $("<div class='row productTR m-auto' id=tr"+i+" style='background-color: #F5F7F8; border-radius:22px; width:100%; height:40vmin;'>")
	               let td = $("<div style='padding:0; padding-left:15px;'>")
	               td.addClass("col-5 my-auto text-center")

	               let fileName = list[i].replaceAll(" ", "%20")
                   let image = $("<img src=/file/"+fileName+" style='object-fit:cover; width:95%; height:auto; max-height:35vmin; display:block; margin:0 auto;'>")
	               td.append(image)
	               tr.append(td)
	               col.append(tr)
	               table.append(col);
	               }
	         // 게시글
	            }).done(function() {
	                  
	                  $.ajax({
	                     url : "/scrollBoard.productBoard",
	                     type : "post",
	                     dataType : "json",
	                     async : false
	                  }).done(function(list2) {
	                     for (let i = 0; i < 6; i++) {
	                        
	                        if(list2[i].sellingOption == "물물교환만") {
	                        
	                               let price = list2[i].price;
	                              price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
	                        
	                              let tr = $("#tr" + i);
	                              let td = $("<div class='col my-auto' style='padding-left:20px;'>"
	                                       + "<div style='overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp:2; -webkit-box-orient: vertical; word-wrap:break-word; font-size:1.2rem;'><a class='pdAnker' href=/detail.productBoard?seq=" + list2[i].seq + ">"+ list2[i].title+ "</div></a>"
	                                       + "<hr style='background-color: rgba(0, 0, 0, 0.4); margin:10px;'>" 
	                                       + "<span class='statusTag' id='spanColor" + i + "'>"+ list2[i].status+ "</span>"
	                                       + "<br>"
	                                       + "<span class='payTag' style='margin-top:10px; display:inline-block;'>"+ list2[i].sellingOption+ "</span>"
	                                       
	                                       + "</div>")
	                              tr.append(td)
	                              tr.after("<br>")
	                           
	                        } else {
	                           
	                           let price = list2[i].price;
	                           price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
	                     
	                           let tr = $("#tr" + i);
	                           let td = $("<div class='col my-auto' style='padding-left:20px;'>"
	                                 + "<div style='overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp:2; -webkit-box-orient: vertical; word-wrap:break-word; font-size:1.2rem;'><a class='pdAnker' href=/detail.productBoard?seq=" + list2[i].seq + ">"+ list2[i].title+ "</div></a>"
	                                    + "<hr style='background-color: rgba(0, 0, 0, 0.4); margin:10px;'>" 
	                                    + "<h5 style='margin-bottom:10px; display:inline;'>"+ "￦ "+ price + "원"+ "</h5>"
	                                    + "<span style='margin-left:10px;' class='statusTag' id='spanColor" + i + "'>"+ list2[i].status+ "</span>"
	                                    + "<br>"
	                                    + "<span class='payTag' style='margin-top:10px; display:inline-block;'>"+ list2[i].sellingOption+ "</span>"

	                                    + "</div>")
	                           tr.append(td)
	                           tr.after("<br>")
	                           
	                        }
	                        
	                        if(list2[i].status == "판매중") {
	                           $("#spanColor" + i).css("color", "red")
	                        } else if(list2[i].status == "예약중") {
	                           $("#spanColor" + i).css("color", "green")
	                        } else if(list2[i].status == "판매완료") {
	                           $("#spanColor" + i).css("color", "grey")
	                        }
	                        
	                     }
	                  })
	               })
	               
	   // 스크롤시 6개씩 추가
	         let scrollCount = 6

	         $(document).scroll(function() {
	            var maxHeight = $(document).height();
	            var currentScroll = $(window).scrollTop()+ $(window).height();

	            if (maxHeight <= currentScroll + 300) {
	            $.ajax({
	               url : "/scrollImage.productBoard",
	               type : "post",
	               dataType : "json",
	               async : false
	            // 이미지
	            }).done(function(list) {

	               for (let i = scrollCount; i < scrollCount+6; i++) {

	                  if (i < list.length) {
	                   let table = $("#productTable")

	                 let col = $("<div class='col-12 col-lg-6'>");

// 	                 let tr = $("<div class='row productTR m-auto' id=tr"+i+" style='border:1px solid black; width:100%; height:40vmin;'>")
					  let tr = $("<div class='row productTR m-auto' id=tr"+i+" style='background-color: #F5F7F8; border-radius:22px; width:100%; height:40vmin;'>")
	                 let td = $("<div style='padding:0; padding-left:15px;'>")
	                 td.addClass("col-5 my-auto text-center")

	                 let fileName = list[i].replaceAll(" ", "%20")
                     let image = $("<img src=/file/"+fileName+" style='object-fit:cover; width:95%; height:auto; max-height:35vmin; display:block; margin:0 auto;'>")
	                 td.append(image)
	                 tr.append(td)
	                 col.append(tr)
	                 table.append(col);
	                  } else {
	                     break;
	                  }

	               }

	            // 게시글
	            }).done(function(list2) {
	               
	               $.ajax({
	                  url : "/scrollBoard.productBoard",
	                  type : "post",
	                  dataType : "json",
	                  async : false
	               }).done(function(list2) {
	                  for(let i=scrollCount; i<scrollCount+6; i++) {
	                     
	                     if(i<list2.length) {
	                     
	                        if(list2[i].sellingOption == "물물교환만") {
	                        
	                            let price = list2[i].price;
	                           price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
	                     
	                           let tr = $("#tr" + i);
	                           let td = $("<div class='col my-auto' style='padding-left:20px;'>"
	                                    + "<div style='overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp:2; -webkit-box-orient: vertical; word-wrap:break-word; font-size:1.2rem;'><a class='pdAnker' href=/detail.productBoard?seq=" + list2[i].seq + ">"+ list2[i].title+ "</div></a>"
	                                    + "<hr style='background-color: rgba(0, 0, 0, 0.4); margin:10px;'>" 
	                                    + "<span class='statusTag' id='spanColor" + i + "'>"+ list2[i].status+ "</span>"
	                                    + "<br>"
	                                    + "<span class='payTag' style='margin-top:10px; display:inline-block;'>"+ list2[i].sellingOption+ "</span>"

	                                    + "</div>")
	                           tr.append(td)
	                           tr.after("<br>")
	                           
	                        } else {
	                           
	                            let price = list2[i].price;
	                           price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
	                     
	                           let tr = $("#tr" + i);
	                           let td = $("<div class='col my-auto' style='padding-left:20px;'>"
	                                 + "<div style='overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp:2; -webkit-box-orient: vertical; word-wrap:break-word; font-size:1.2rem;'><a class='pdAnker' href=/detail.productBoard?seq=" + list2[i].seq + ">"+ list2[i].title+ "</div></a>"
	                                    + "<hr style='background-color: rgba(0, 0, 0, 0.4); margin:10px;'>" 
	                                    + "<h5 style='margin-bottom:10px; display:inline;'>"+ "￦ "+ price + "원"+ "</h5>"
	                                    + "<span style='margin-left:10px;' class='statusTag' id='spanColor" + i + "'>"+ list2[i].status+ "</span>"
	                                    + "<br>"
	                                    + "<span class='payTag' style='margin-top:10px; display:inline-block;'>"+ list2[i].sellingOption+ "</span>"

	                                    + "</div>")
	                           tr.append(td)
	                           tr.after("<br>")
	                           
	                        }
	                        
	                        if(list2[i].status == "판매중") {
	                           $("#spanColor" + i).css("color", "red")
	                        } else if(list2[i].status == "예약중") {
	                           $("#spanColor" + i).css("color", "green")
	                        } else if(list2[i].status == "판매완료") {
	                           $("#spanColor" + i).css("color", "grey")
	                        }
	                        
	                     } else {
	                        break;
	                     }
	                        
	                  }
	                  
	                  scrollCount += 6
	               })
	            })
	         }
	      })
		})
	</script>
</body>
</html>