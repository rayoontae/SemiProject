<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전기차 게시판 | 니꺼내꺼</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/carBoardDetail.css" />


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

/* SummerNote */
#summerTR *{
	font-family: "맑은 고딕", serif;
} 


</style>
</head>
<body>

	<c:choose>
	<c:when test="${isLoginOk == 1}">
		<div class="container">
   			<div class="row">
   				<div class="col-12">

   					<nav class="navbar navbar-expand-md navbar-light navbar-fixed-top m-0 p-0" id="mainNav" style="background-color:#FFE69A;">
        			<div class="container m-0" id="subNav" style="">
         				<div style="width:100%; text-align:right;">
            				<button class="navbar-toggler navbar-toggler-right" style="color:transparent !important; height:49px;" id="navBtn" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
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

	<!-- 메인  -->
	<div class="container containerSetting">
		<!-- 게시글 카테고리 -->
		<div class="row mt-5 mb-5 width-700 test">
			<div class="col-11 m-auto p-0" style="color: gray">전기차 게시판</div>
		</div>

		<div class="row width-700 p-0">
			<div class="col-11 m-auto">
				<form action="/update.carBoard" method="post" id="modifyFrm"
					class="form p-0">
					<input type="hidden" value="${dto.seq }" name="seq"
						class="padding-left w-100">
					<!-- 게시글 제목 -->
					<div class="row bdInfo width-700 mb-5">
						<div class="col-11 pr0 m-auto">
							<div id="titleTH" class="padding-left">${dto.title }</div>
						</div>
						<input type="hidden" id="titleInput" name=title value="${dto.title }">
					</div>

					<!-- 작성자 정보 -->
					<div class="row writerInfo mt-3 p-0">
						<div class="col-11 text-start padding-left mb-3 m-auto">
							<span>${dto.writer }</span>
						</div>
						<div class="col-11 mt-3 padding-left m-auto">
							<span class="colorGray">${dto.formedDate }&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="colorGray">조회&nbsp;${dto.viewCount}</span>
						</div>
						<div class="col-11 padding-left my-auto">
							<hr class="mb-4" style="background-color: rgba(0, 0, 0, 0.4)" />
						</div>
					</div>

					<!-- contents -->
					<div class="row width-700 p-0" id=oricont>
						<div class="col-11 m-auto">
							<div class="row w-100 p-0">
								<div class="col-11 m-auto" id="contentsTD"
									style="line-height: 25px;">${dto.contents }</div>
							</div>
						</div>
					</div>

					<div class="row w-100 p-0" id=summerTR style="display: none;">
						<div class="col-11 m-auto padding-left">
							<div class="row w-100 m-0 p-0">
								<div class="col-11 m-auto">
									<textarea id=summernote class=summernote name=contents></textarea>
								</div>
							</div>
						</div>
					</div>


					<!-- 버튼 -->
					<div class="row mb-2 bdContents p-0">
						<div class="col-11 my-auto text-end mt-5" id="btns">

							<c:if test="${loginId == dto.writer }">
								<button id="modify" type=button>수정하기</button>
								<button id="delete" type=button>삭제하기</button>
								<script>
							$("#delete").on("click", function() {
								let bool=confirm("삭제하시겠습니까?");
		                        if(bool){
		                           location.href = "delete.carBoard?seq=${dto.seq}";
		                        }
							})

							$("#modify").on("click",function() {
										$("#titleTH").attr("contenteditable", "true");
										$("#titleTH").focus();
										
										$("#oricont").css("display","none");
										$("#summerTR").css("display","block");
								        $("#summernote").summernote('code', '${dto.contents}')
										//$(".note-editable").append("${dto.contents}");
									
										$("#contentsInput").attr("name","oricontents")
										$("#summernote").attr("name","contents");
										
										$("#modify").css("display", "none");
										$("#delete").css("display", "none");
										$("#back").css("display", "none");

										let okBtn = $("<button>");            // okBtn은 submit 로 동작한다.
										okBtn.text("수정완료");
										okBtn.css("margin-right", "5px");
										
										let cancelBtn = $("<button>");
										cancelBtn.attr("type","button");
										cancelBtn.text("취소");

										cancelBtn.on("click", function() {
											location.reload();
										})
			
										$("#btns").prepend(cancelBtn);
										$("#btns").prepend(okBtn);
									})
						</script>
							</c:if>

							<button class="btn btn-outline-dark" id="back" type="button">목록으로</button>
						</div>

						<div class="col-11 padding-left my-auto">
							<hr class="mb-4" style="background-color: rgba(0, 0, 0, 0.4)" />
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- 파일리스트 -->
		<c:if test="${fn:length(filelist) > 0 }">
			<div class="row p-0 fileDiv mb-3" id="filecolorlist">
				<div class="col-11 m-auto test">
					<button id="list" class="btn">파일 목록 가져오기</button>
					<fieldset id="fileList">
						<!-- 이 위치가 append 위치이다  -->
					</fieldset>
				</div>
			</div>

		</c:if>

		<!-- 댓글 -->
		<div class="row replyDiv mt-4 p-0">
			<form action="/enroll.carReply" class="replyForm p-0">
				<input type="hidden" value="${dto.seq }" name="parent_seq">
				<div class="col-11 replyInputDiv mt-2 mb-2 m-auto">
					<div class="row m-0 w-100">
						<div class="col-10 col-lg-10 p-0">
							<textarea id="textArea" class="replyInput" name="commenttext" placeholder=" 댓글을 남겨보세요."></textarea>
						</div>
						<div class="col col-lg-1 p-0 ">
							<button class="reply btn">등록</button>
						</div>
					</div>
				</div>
			</form>

			<!-- 댓글 리스트 -->
			<c:forEach var="i" items="${replylist }">
				<div class="col-11 m-auto">
					<div class="row mt-3 mb-3 m-0 replyMsg p-0">
						<div class="col-12 replyseq" style="display: none">${i.seq}</div>
						<div class="col-12 replyWriter">${i.writer }</div>
						<div class="col-12 replyContents m-1 replycontents">${i.contents }</div>
						<div class="col-7 msgDate m-1 mt-0">${i.writeDate }</div>

						<c:choose>
							<c:when test="${i.writer == loginId }">
								<div class="col-4 m-1 mt-0 ms-4 replyBtns" id="btnn"> 
									<input type="button" value="삭제" class="replydelete" id="replydelete" replyseq="${i.seq}">
									<input type="button" value="수정" class="replymodify" id="replymodify" modifyseq="${i.seq}">
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</c:forEach>
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
	
	$("#list").on("click",function(){
		console.log("test");
		
		$.ajax({
			dataType: 'json',
			url:"/list.carFile",
			data : {dtoseq : ${dto.seq }}
			
		}).done(function(resp){
			for(let i=0;i<resp.length;i++){
				let filediv=$("<div>");
				
				let anker=$("<a>");
				anker.attr("href","/download.carFile?oriName="+resp[i].oriName+"&sysName="+resp[i].sysName);
				anker.text(resp[i].oriName)
				
				filediv.append(anker)
				
				$("#fileList").append(filediv);
			}
			$("#list").off('click');
		})
	})
	
		$(".replydelete").on("click", function() { 
			
			$.ajax({
				url:"/delete.carReply",
				data : {replyseq : $(this).attr("replyseq")}
		
			  }).done(function(resp){
			 	if(resp=="true"){
			 		location.reload();
			 	}
			});
		})
		
		$(".replymodify").on("click",function(){
			let modifyokbtn = $("<button>");       
			modifyokbtn.attr("type","submit");
			modifyokbtn.text("완료");
			modifyokbtn.attr("class","modiok");
			
			let modifycancel = $("<button>");
			modifycancel.attr("type","button");
			modifycancel.attr("class","modicancel");
			modifycancel.css("margin-left","4px");
			modifycancel.text("취소");
			
			$(this).closest('div').find("#replydelete").css("display", "none");
			$(this).closest('div').find("#replymodify").css("display", "none");

			$(this).closest('div').append(modifyokbtn);	
			$(this).closest('div').append(modifycancel);
			
			$(this).parent().siblings('.replyseq').attr("name","modifyseq");
			$(this).parent().siblings('.replycontents').attr("name","conte");
			
			$(this).parent().siblings('.replycontents').attr("contenteditable","true");
			$(this).parent().siblings('.replycontents').focus();
			

			
			let conte
			let modifyseq
			$(".modiok").on("click",function(){
				conte=$(this).parent().siblings('.replycontents').text();
				modifyseq=$(this).parent().siblings('.replyseq').text();
				console.log(modifyseq);
				
				$.ajax({
					url:"/modify.carReply",
					data : {"modifyseq" : modifyseq,
						conte:conte	}
				}).done(function(resp){
					location.reload();
				});	
			})
			
			modifycancel.on("click", function() {
				location.reload();
			})
		})
		
		
		$('.summernote').summernote({
             height : 400,
             leng : 'ko-KR',
             disableDragAndDrop : true,
               toolbar: [
                 // [groupName, [list of button]]
                 ['fontname', ['fontname']],
                 ['fontsize', ['fontsize']],
                 ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                 ['color', ['forecolor','color']],
                 ['table', ['table']],
                 ['para', ['ul', 'ol', 'paragraph']],
                 ['height', ['height']]
//                  ['insert',['picture','link','video']],
//                  ['view', ['fullscreen', 'help']]
               ],
             fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
             fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
            });
		

	
		$("#back").on("click", function() {
			location.href = "/list.carBoard?cpage="+${cpage};
		})
		
		$("#modifyFrm").on("submit",function(){
			$("#titleInput").val($("#titleTH").text());
// 			$("#contentsInput").val($(".note-editable").text());
			
		})
		
		
	</script>
</body>
</html>