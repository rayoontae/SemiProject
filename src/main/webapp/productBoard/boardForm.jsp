<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 게시판 | 니꺼내꺼</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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
button, input[type='button'] {
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

   
   
/* 게시판 CSS */
   textarea{
      resize:none;
      border:0px;
   }
   
   .inputImage{
      margin:10px;
   }
   
   .summernoteTR *{
      font-family: "맑은 고딕", serif;
   }

   /* 파일첨부영역 colspan 없이 좌우로 붙이기 */
    #tr td{
        float:left;
    }
    

   .filebox label {
       display: inline-block;
       padding: 7px 13px;
       min-height:33.5px;
       color: white;
       background-color: dodgerblue;
       cursor: pointer;
       margin-left: 9px;
          margin-right: 7px;
          margin-top: 12px;
          border-radius:4px;
          font-weight:normal;
   }

   .filebox input[type="file"] {
       position: absolute;
       width: 0;
          height: 0;
          padding: 0;
       overflow: hidden;
       border: 0;
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


   
   <div class="container">
   
   <div class="row">
   
   <div class="col-12 col-lg-7 m-auto">
   
   <div class="row">
   
   <div class="col-12">


   <form action="/writeConfirm.productBoard" method="post" enctype="multipart/form-data" id=form>
   
   <table class="table">
        <tr>
            <th style="text-align:center; vertical-align:middle; height:100px; font-size:2.5rem;">상품 등록하기
        </tr>
        <tr>
            <td>
               &nbsp;
                <input type="text" id=title name=title placeholder="글 제목을 입력하세요." style="width:90%;">
            </td>
        </tr>
        <tr>
           <td colspan="3" height=40>
              &nbsp;
              <select id=category name=category>
                 <option value=의류>의류
                 <option value=잡화>잡화
                 <option value=가전>가전
                 <option value=취미>취미
                 <option value=아동>아동
                 <option value=기타>기타
              </select>
              <span style="color:crimson;">&nbsp;* 카테고리</span>
           </td>
        </tr>
        <tr>
           <td colspan="3" height=40>
              &nbsp;
              <select id=sellingOptionSelect name=sellingOption>
                 <option value="물물교환 & 금전거래">물물교환 & 금전거래
                 <option value="물물교환만">물물교환만
                 <option value="금전거래만">금전거래만
              </select>
              <span style="color:crimson;">&nbsp;* 거래방식</span>
           </td>
        </tr>
        <tr>
           <td colspan=3 height=40>
              &nbsp;
              <input type=text id=pname name=pname placeholder="상품명을 입력해주세요.">
           </td>
        </tr>
        <tr id=priceBox>
           <td colspan="3" height=40>
              &nbsp;
              <input type=text maxlength="9" id=submitPrice name=price placeholder="가격을 입력해주세요."> 원
           </td>
        </tr>
        <tr>
           <td colspan="3">
              <button type=button class="btn btn-success" id=fileAddBtn style="width:120px; margin:10px;">파일첨부하기</button>
           </td>
        </tr>
        
        <tr id="tr">
           
        </tr>

      <tr class="summernoteTR">
         <td colspan="3"><br><textarea id=summernote class=summernote name=contents></textarea>
      </tr>
      
        <tr>
            <td colspan="3" align=center style="height:50px;">
                <a href="/list.productBoard?currPage=1"><input type="button" class="btn btn-primary" value="목록으로"></a>&nbsp;
                <button class="btn btn-primary">작성완료</button>
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
      
        // 파일 첨부하기
        let i = 0
        
       $("#fileAddBtn").on("click", function(){
          
            i += 1
            
            if($(".td").length >= 3) {
               alert("이미지는 최대 3장까지만 등록 가능합니다.")
               return false
            }
            
            let td = $("<td class='td filebox' style='width:150px; padding:20px 0; padding-left:18px;'>")
            let previewImage = "<img style='width:135px; height:135px; object-fit:cover; border:1px solid black; border-radius:20px;' class=previewImage id=previewImage" + i + " src='https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image'>"
            let label = "<label for='inputImage" + i + "'>찾기</label>"
            let inputImage = "<input type=file style='width:77px; margin:auto; margin-bottom:10px;' class=inputImage id=inputImage" + i + " class=inputTypeFile accept='image/*' name=file" + i + ">"
         let deleteImgBtn = "<button type=button class='deleteImageBtn btn btn-danger' style='height:35px; margin-top:-4px;'>삭제</button>"
            
            td.append(previewImage)
         td.append(label)
          td.append(inputImage)
            td.append(deleteImgBtn)
            
            $("#tr").append(td)

            $(".inputImage").on("change", function(e){
               
                let input = e.target

                if(input.files && input.files[0]) {
                   // 첨부파일 사이즈 체크
                   var maxSize = 5 * 1024 * 1024;
                  var fileSize = input.files[0].size;

                  if(fileSize > maxSize){
                     alert("이미지 사이즈는 5MB 이내로 등록 가능합니다.");
                     $(this).val('');
                     return false;
                  }
                   
                   // 첨부파일 확장자 체크
                   pathpoint = input.value.lastIndexOf('.');
                  filepoint = input.value.substring(pathpoint+1,input.length);
                  filetype = filepoint.toLowerCase();
                  
                  // 정상적인 이미지 확장자 파일인 경우
                  if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
                     let reader = new FileReader()
                       reader.onload = e => {
                             $(this).siblings().attr("src", e.target.result)
                             $(this).siblings().css("border", "none")
                       }

                       reader.readAsDataURL(input.files[0])

                  } else {
                     alert('이미지 파일만 업로드 하실 수 있습니다.');
                  $(this).val("")
//                      $(this).closest(".td").remove()

                     return false;
                  }
                   
                }
               
            })
            
            $(".deleteImageBtn").on("click", function(){
               $(this).closest(".td").remove()
            })

      })
      
   
      // 판매방식 선택에 따른 가격입력칸 표시
      $("#sellingOptionSelect").on("change", function(){
         console.log("test")
             if($(this).val() == "물물교환 & 금전거래") {
                $("#submitPrice").removeAttr("disabled")
                $("#submitPrice").val("")
             } else if($(this).val() == "물물교환만") {
                $("#submitPrice").attr("disabled", "")
                $("#submitPrice").val("없음")
             } else if($(this).val() == "금전거래만") {
                $("#submitPrice").removeAttr("disabled")
                $("#submitPrice").val("")
             }
       })
      
      
      // 썸머노트
      $('.summernote').summernote({
         disableResizeEditor : false,
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
             ['height', ['height']],
//              ['insert',['picture','link','video']],
             ['view', ['fullscreen', 'help']]
           ],
         fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
         fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });
      
      
      // 제출시
      $("#form").on("submit", function(){
         
         // 가격 정규표현식
         let priceRegex = /^[\d]{1,10}$/g;
         let inputPrice = $("#submitPrice").val()
         
         if($("#title").val() == "") {
            alert("제목을 입력해주세요.")
            $("#title").focus()
            return false
         } else if($("#pname").val() == "") {
            alert("상품명을 입력해주세요.")
            $("#pname").focus()
            return false
         } else if($("#sellingOption").val() != "물물교환만") {
            if($("#submitPrice").val() == "") {
               alert("가격을 입력해주세요.")
               $("#submitPrice").focus()
               return false
            } else if(priceRegex.test(inputPrice) == false && inputPrice != "없음") {
               alert("가격을 숫자로만 입력해주세요.")
               $("#submitPrice").focus()
               return false
            }
         } 
         
         // else if 로 작성하면 왜인지 작동하지 않는다.
         if($("#summernote").summernote('isEmpty')) {
            alert("내용을 입력해주세요.")
            $("#summernote").summernote('focus')
            return false
         }
         
         // 이미지는 최소 1장 이상 첨부하도록 한다
         if($(".td").length == 0 || $(".inputImage").val() == "") {
            alert("상품이미지를 한 장 이상 등록해주세요.")
            return false
         }
         
         if(confirm("상품게시글을 등록하시겠습니까?")) {
            $("#submitPrice").removeAttr("disabled")
            return true
         } else {
            return false
         }
         
      })
      
   </script>
   
   
</body>
</html>