<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품게시판 | 니꺼내꺼</title>
<!-- CSS -->
    <link rel="stylesheet" href="./css/basic.css" />
    <!-- 부트스트랩 CDN_CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <!-- 구글 아이콘 -->
    <link
      rel="stylesheet"
      href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <!--  부트스트랩 CDN_JS  -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>

/* 배너 */
.banner {
	background-image: url("/source/img/boardbanner.png");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	border-radius: 20px;
/* 	width: 800px; */
	height: 520px;
}

   a{
      text-decoration:none;
      color:black;
   }

   a:hover{
      cursor:pointer;
      text-decoration:underline;
      color:dodgerblue;
   }
   
   .thread {
        background-color: rgba(0, 0, 0, 0.05);
   }
   .boardSeq {
        width: 10%;
   }
   .thTitle,
   .title {
        width: 50%;
   }
   .boardTitle a{
   	font-size:17px;
   }
   tr {
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
   }
   .boardDate,
   .boardViewCount {
        color: gray;
   }
   #searchInput{
   margin-right:5px !important;
   height: 33px;
   }
   #searchBtn{
   margin-right:10px !important;
   }
   .boardBtn {
	border: 1px solid black !important;
/* 	font-size: 13px; */
	padding: 5px !important;
	margin: 0;
}
   .boardSearchBtn{
	border: 1px solid black !important;
/* 	font-size: 13px; */
	padding: 5px !important;
	margin: 0;
}

   .btnHover:hover{
   	border:1px solid #92B4EC !important;
	background-color: #92B4EC !important;
	color: white !important;
   }
   
   @media (max-width: 996px) {
        .boardTitle {
       width: 100%;
       display: block;
     }
     .boardSeq,
     .thWriter,
     .thDate,
     .thViewCount {
       display: none;
     }
     .m-inline {
       display: inline;
     }
     .boardDate,
     .boardViewCount {
       font-size: 14px;
     }
   
</style>
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
							<button class="btn searchBtn">검색</button>
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

<!-- 배너 -->
	<div class="container-fluid">
		<div class="row w-100 text-center m-0 mt-5 mb-5">
			<div class="col">
				<div class="banner"></div>
			</div>
		</div>
	</div>


   <div class="container">
   <div class="row">
   
   <div class="col-11 col-lg-8 m-auto">

   <table class="table table-borderless">
   
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
        
           <c:forEach var="i" items="${boardList }">
        
           <tr>
               <th scope="row" class="text-center boardSeq">${i.seq }</th>
               <td class="title boardTitle"><a href="/detail.productBoard?seq=${i.seq }">${i.title }</a></td>
               <td class="text-center m-inline boardWriter">${i.writer }</td>
               <td class="text-center m-inline boardDate">${i.formedDate }</td>
               <td class="text-center m-inline boardViewCount">${i.viewCount }</td>
           </tr>
        
           </c:forEach>
           
        </tbody>
           
    
    
        <tr style="border:0;">
            <td colspan="5" align="center">
               <a href="/list.productBoard?currPage=1" id=toStart>[처음]&nbsp;</a>
              <a href="/list.productBoard?currPage=${currPage-11 - (currPage-11)%10 + 1 }" id=prev>[이전]&nbsp;</a>
              <a href="/list.productBoard?currPage=${currPage+9 - (currPage+9)%10 + 1 }" id=next>[다음]&nbsp;</a>
              <a href="/list.productBoard?currPage=${totalPage }" id=toEnd>[마지막]</a>
            </td>
        </tr>
        <tr style="border:0;">
           <td colspan="5" align="right">
           		<input type=text id=boardSearchInput class="inputSearch" style="height:30px; margin-top:20px;">&nbsp;
           		<button id=boardSearchBtn class="btn btn-outline-dark boardSearchBtn btnHover" style="margin-bottom:4px;">검색</button>&nbsp;
           
               <a href="/index.jsp"><button class="btn btn-outline-dark boardBtn btnHover" style="margin-bottom:4px;">메인으로</button></a>&nbsp;
               
               <c:if test="${loginId ne null }">
               <a href="/write.productBoard"><button class="btn btn-outline-dark boardBtn btnHover" style="margin-bottom:4px;">작성하기</button></a>
               </c:if>
        </tr>
    </table>

    </div></div></div>
    
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
    
       let startNavi = ${currPage-1 }-(${currPage-1 }%10)+1
    
       // totalPage 10 이하 - 처음 이전 다음 마지막 모두 없음
       if(${totalPage } <= 10) {
          $("#prev").css("display", "none")
          $("#next").css("display", "none")
          $("#toStart").css("display", "none")
          $("#toEnd").css("display", "none")
          
          for(let i=1; i<=${totalPage }; i++) {
             let seq = $("<a href=/${from }.productBoard?keyWord=${keyWord }&currPage=" + i + " id=a" + i + ">" + i + "</a>")
             $("#next").before(seq)
             $("#next").before("\u00a0\u00a0")
          }
          
       // totalPage 10 초과, 현재페이지 10페이지 이하 - 처음 이전 없음
       } else if(${currPage } <= 10) {
          $("#prev").css("display", "none")
          $("#toStart").css("display", "none")
          
          for(let i=startNavi; i<=startNavi+9; i++) {
             let seq = $("<a href=/${from }.productBoard?keyWord=${keyWord }&currPage=" + i + " id=a" + i + ">" + i + "</a>")
             $("#next").before(seq)
             $("#next").before("\u00a0\u00a0")
          }
          
       // 현재 페이지가 10페이지씩 끊었을때 마지막일때 ex) 31~35 페이지 (totalPage 35) - 다음 마지막 없음
       } else if(${currPage - (currPage-1)%10 } == ${totalPage - (totalPage-1)%10 }) {
          $("#next").css("display", "none")
          $("#toEnd").css("display", "none")
          
          for(let i=startNavi; i<=${totalPage }; i++) {
             let seq = $("<a href=/${from }.productBoard?keyWord=${keyWord }&currPage=" + i + " id=a" + i + ">" + i + "</a>")
             $("#next").before(seq)
             $("#next").before("\u00a0\u00a0")
          }
          
       // 그 외 일반적인 경우 - 처음 이전 다음 마지막 모두 있음
       } else {
          for(let i=startNavi; i<=startNavi+9; i++) {
             let seq = $("<a href=/${from }.productBoard?keyWord=${keyWord }&currPage=" + i + " id=a" + i + ">" + i + "</a>")
             $("#next").before(seq)
             $("#next").before("\u00a0\u00a0")
          }
       }
       
       // 현재 페이지에 색깔과 밑줄
       $("#a" + ${currPage }).css({"color":"dodgerblue", "text-decoration":"underline"})
       
       
       
       // 검색기능
       $("#searchBtn").on("click", function(){
          let keyWord = $("#searchInput").val()
          location.href = "/search.productBoard?currPage=1&keyWord=" + keyWord
       })
       $("#boardSearchBtn").on("click", function(){
          let keyWord = $("#boardSearchInput").val()
          location.href = "/search.productBoard?currPage=1&keyWord=" + keyWord
       })
       
    </script>

</body>
</html>