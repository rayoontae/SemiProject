<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전기차 게시판 | 니꺼내꺼</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/carBoardWrite.css" />
	
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>

/* 폰트 */
@font-face {
  font-family: "yg-jalnan";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}
.jalnanche {
  font-family: "yg-jalnan", verdana, tahoma;
  font-size: 30px;
  color: #726647 !important;
}

/* 전체 */
* {
  padding: 0px;
  margin: 0px;
  box-sizing: border-box;
}

/* 기본 버튼 모양 */
button {
  border-radius: 10px !important;
  padding: 5px 15px !important;
}

/* container 셋팅(가운데정렬) */
.containerSetting {
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* 네비바 css 설정 */
/* 네비바 fixed */
body {
	padding-top: 60px;
}

/* navBar */
.navbar {
/* 	background-color: #FFD24C; */
	background-color: #FFE69A;
	z-index: 10000;
}

/* 네비 */
li>a{
	text-decoration: none !important;
}

.navbar a{
	color:black;
	text-decoration:none;
}
.navbar a:hover{
	color:black;
	text-decoration:none;
}

.search {
	margin-left: 50px !important;
}

.searchInput {
	border: none;
	outline: none;
	border-radius: 10px !important;
	width: 50%;
	padding-left: 7px;
	color: black !important;
	margin-right: 10px !important;
}

.searchInput::placeholder {
	color: gray
}

.searchBtn {
	border:1px solid #92B4EC !important;
	background-color: #92B4EC !important;
	color: white !important;
}
.searchBtn:hover {
	background-color: white !important;
	color: #92B4EC !important;
}

.logout {
	font-size: 14px;
	background-color: transparent;
}

.logout:hover {
	background-color: #92B4EC !important;
	border-color: #92B4EC !important;
	color: white !important;
	cursor: pointer;
}

.mouse-effect {
	position: relative;
}

.mouse-effect:after {
	content: "";
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	transition: 0.3s;
}

.mouse-effect:hover:after {
	cursor: pointer;
	background-color: #ffffff44;
	color: #001e30;
	border-radius: 30px;
}

.mouse-effect:active:after {
	background-color: #ffffff3e;
	border-radius: 30px;
}

/* 채팅 알람 */
.new {
	border-radius: 50%;
	padding: 3px 6px;
	font-size: 10px;
	font-weight: bold;
	background-color: red;
	color: white;
	margin-bottom: 5px !important;
	margin-left: 3px !important;
}

/* 채팅함 옆에  */
.ds-inline {
	display: inline-block !important;
}


/* footer */
.footer {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 330px;
	background-color: rgba(0, 0, 0, 0.05);
	margin-top: 180px;
}

.footerData {
	padding: 70px 50px 0px 70px;
}

.d-inline div {
	display: inline-block;
}

.footerInfo {
	line-height: 40px;
	margin-right: 30px;
}

.cs {
	padding: 30px 50px 0px 70px;
	display: flex;
	align-items: center;
}

.csText {
	margin: 0px;
	font-size: 14px;
}

.pd {
	padding-left: 30px;
}

#summernoteTR *{
    font-family: "맑은 고딕", serif;
}

</style>
<body>

	<c:choose>
	<c:when test="${isLoginOk == 1}">
		<div class="container">
   			<div class="row">
   				<div class="col-12">

   					<nav class="navbar navbar-expand-md navbar-light navbar-fixed-top m-0 p-0" id="mainNav" style="background-color:#FFE69A;">
        			<div class="container m-0" id="subNav" style="">
         				<div style="width:100%; text-align:right;">
            				<button class="navbar-toggler navbar-toggler-right" style="color:transparent; height:49px;" id="navBtn" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
         				</div>
         				<br><br>
           
            		<div class="collapse navbar-collapse" id="navbarResponsive" style="border:0px solid black; ">
                		<ul class="navbar-nav ms-auto m-0 p-0" style="width:1200px;">
                    		<li class="nav-item jalnanche" style="display:block; width:120px; font-size:2rem;"><a class="nav-link" id="navMenu" href="/index.jsp">니꺼내꺼</a></li>
                    		<li class="nav-item"><a class="nav-link active mouse-effect" aria-current="page" href="/list.productBoard?currPage=1">상품보기</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect" href="/list.carBoard?cpage=1">전기차</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect" href="/market.jsp">플리마켓</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect" href="/guide.jsp">이용안내</a></li>
                    
                     		<li class="nav-item dropdown">
                        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">${loginId }님</a>
                        		<ul class="dropdown-menu loginDrop text-center" aria-labelledby="navbarDropdown" style="width:190px;">
                           			<li style="width:190px;"><a class="dropdown-item noColor" href="/myPage.member" id="toMyPage">마이페이지</a></li>
                           			<li style="width:190px;"><a class="dropdown-item noColor" href="/myShop.member?parentId=${loginId }" id="toMyStore">내상점</a></li>
                           			<li style="width:190px;"> <a class="chatRoom dropdown-item noColor ds-inline" href="/chatRoom.chat?loginId=${loginId }">채팅함</a></li>
                           			<li><hr class="dropdown-divider" /></li>
                           			<li style="width:190px; margin-right:20px;">
                           				<a class="dropdown-item text-center" href="/logout.member"><button class="logout btn btn-outline-dark btnStyle">로그아웃</button></a>
                           			</li>
                        		</ul>
                     		</li>
                		</ul>
            		</div>
        			</div>
    				</nav>
    			</div>
    		</div>
  		 </div>
	</c:when>

	<c:otherwise>
		<div class="container">
   			<div class="row">
  				 <div class="col-12">
   
				<nav class="navbar navbar-expand-md navbar-light navbar-fixed-top m-0 p-0" id="mainNav" style="background-color:#FFE69A;">
        			<div class="container m-0" id="subNav" style="">
         				<div style="width:100%; text-align:right;">
            				<button class="navbar-toggler navbar-toggler-right" style="color:transparent; height:49px;" id="navBtn" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
         				</div>
         				<br><br>
           
            			<div class="collapse navbar-collapse" id="navbarResponsive" style="border:0px solid black; ">
                		<ul class="navbar-nav ms-auto m-0 p-0" style="width:1200px;">
                    		<li class="nav-item jalnanche" style="display:block; width:120px; font-size:2rem;"><a class="nav-link" id="navMenu" href="/index.jsp">니꺼내꺼</a></li>
                    		<li class="nav-item"><a class="nav-link active mouse-effect" aria-current="page" href="/list.productBoard?currPage=1">상품보기</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect" href="/list.carBoard?cpage=1">전기차</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect" href="/market.jsp">플리마켓</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect" href="/guide.jsp">이용안내</a></li>
                		</ul>
            			</div>
        			</div>
    			</nav>
    			</div>
    		</div>
   		</div>
	</c:otherwise>
	</c:choose>


	<div class="container containerSetting">

		<div class="row">

			<div class="col-12 col-lg-7 m-auto">

				<div class="row">

					<div class="col-12">

						<form action="/writeProc.carBoard" method="post" id="myform"
							enctype="multipart/form-data">
							<table class="table">

								<tr>
									<th style="text-align:center; vertical-align:middle; height:100px; font-size:2.5rem;">게시판 글쓰기</th>
								</tr>

								<tr>
									<td>&nbsp; <input type="text" id=title name=title
										placeholder="글 제목을 입력하세요." style="width: 90%;">
									</td>
								</tr>

								<tr>
									<td colspan="3" id="mytd">
										<button type=button class="btn btn-success" id=plusbtn
											style="width: 120px; margin: 10px;">파일첨부</button>
									</td>
								</tr>

								<tr id="summernoteTr">
									<td colspan="3"><br>
									<textarea id=summernote class=summernote name=contents></textarea>
								</tr>



								<tr>
									<td colspan="3" align=center style="height:50px;">
										<a href="javascript:history.back()">
											<button type="button" class="btn btn-primary back">목록으로</button>
										</a>
										<button type="submit" class="btn btn-primary submit">작성완료</button>
									</td>
								</tr>


							</table>
						</form>



					</div>
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
	
		$("#title").focus()

		$('.summernote').summernote(
				{
					disableResizeEditor : false,
					height : 500,
					leng : 'ko-KR',
					disableDragAndDrop : true,
					toolbar : [
							[ 'fontname', [ 'fontname' ] ],
							[ 'fontsize', [ 'fontsize' ] ],
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							[ 'color', [ 'forecolor', 'color' ] ],
							[ 'table', [ 'table' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'height', [ 'height' ] ],
							[ 'view', [ 'fullscreen', 'help' ] ] ],
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체',
							'바탕체' ],
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72' ]
				});

		$(document).ready(function() {
			$('#summernote').summernote();

		});

		$("#filebtn").on("click", function() {
			$.ajax({
				url : "/upload.carFile",
			}).done(function(resp) {

			})
		})

		let i = 1;

		$("#plusbtn").on("click",function(){
	         let tr=$("<tr>");
	         let td=$("<td>");
	         let inputplus=$("<input>");   
	         let filename="file"+i;
	         inputplus.attr("type","file");
	         inputplus.attr("class","files");
	         inputplus.css("display","inline");
	         
	         inputplus.attr("name",filename);
	         i++;
	         
	         td.append(inputplus);
	      
//	          $("#mytd").append(inputplus);
//	          윤태추가 6월1일
	         
	         let realxbox=$("<button>");
	         realxbox.attr("type","button");
	         realxbox.addClass("realxbox");
	         realxbox.append("x");
	         td.append(realxbox);
	         
	         tr.append(td);
	         $("#mytd").append(tr);
	         
//	          $("#mytd").append(realxbox);

	         $(".realxbox").on("click",function(){
	            $(this).prev().remove();
	            $(this).remove();
	            
	         })
	         
	         $(".files").on("change",function(e){
              let input = e.target
              
              if(input.files && input.files[0]){
                 var maxSize=5*1024*1024;
                 var fileSize = input.files[0].size;
                 
                 if(fileSize>maxSize){
                    alert("파일 사이즈는 5MB 이내로 등록 가능합니다.");
                    $(this).val('');
                    return false;
                    }
                 }
              
            })
	         
	      })
	      
	      $("#myform").on("submit", function(){
         
        
         if($("#title").val() == "") {
            alert("제목을 입력해주세요.")
            $("#title").focus()
            return false
         }
         
         if($("#summernote").summernote('isEmpty')) {
            alert("내용을 입력해주세요.")
            $("#summernote").summernote('focus')
            return false
         }
         
        
         if(confirm("게시글을 등록하시겠습니까?")) { 
            return true
         } else {
            return false;
         }
      })
	      
	</script>

</body>
</html>