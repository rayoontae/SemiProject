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
button:not(.circle) {
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
	overflow-x:hidden;
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


/* 게시판CSS */
   
   *{box-sizing:border-box;}
   .row{border:0px solid black;}
   
   #summernoteTd *{
      font-family: "맑은 고딕", serif;
   }
   
   .statusTag{
        color: #9cd6f7;
        font-size: 2rem;
        background-color: #0f9ced;
        line-height: 40px;
        border-radius:25px;
        max-height:42px;
        margin-top:-7px;
   }
   
   .pdCategory {
        color: rgb(175, 174, 174);
        font-size: 1.5rem;
   }
   
   .pdTag {
        color: #9c9c9c;
        border-radius: 25px;
        font-size: 1.7rem;
        background-color: #ececec;
        padding:5px;
   }
   
   #btnBox>*{
      margin:0 5px;
   }
   
   .btnHover{
	border :1px solid black !important;
   }
   .btnHover:hover{
    border:1px solid #92B4EC !important;
	background-color: #92B4EC !important;
	color: white !important;
   }
   #toList{
   	border:1px solid #92B4EC !important;
	background-color: #92B4EC !important;
	color: white !important;
   }
   
   .filebox label {
       display: inline-block;
       padding: 7px 13px;
       min-height:33.5px;
       color: white;
       background-color: dodgerblue;
       cursor: pointer;
          margin-right: 7px;
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
   
   #mainNav *{
      border:0px solid red;
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
   
   <br><br><br><br>
   
   <!-- 상품이미지 캐러셀 -->
      <div class="row">
            <div class="col-12 col-lg-10 m-auto">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators" id=test>
                    
                      <button type="button" style="border-radius:50%; width:20px; height:18px; margin:7px;" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active circle" aria-current="true" aria-label="Slide 1"></button>
                      
                      <c:if test="${imageList[1].sysName ne null }">
                      <button type="button" style="border-radius:50%; width:20px; height:18px; margin:7px;" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" class="circle" aria-label="Slide 2"></button>
                      </c:if>
                      
                      <c:if test="${imageList[2].sysName ne null }">
                      <button type="button" style="border-radius:50%; width:20px; height:18px; margin:7px;" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" class="circle"  aria-label="Slide 3"></button>
                      </c:if>
                      
                    </div>
                    <div class="carousel-inner" id=carouselBox>
                    
                      <div class="carousel-item active">
                            <img src="/file/${imageList[0].sysName }" class="img-responsive center-block" style="width:85vmin; height:70vmin; object-fit:cover; border-radius:30px;">
                      </div>
                      
                      <c:if test="${imageList[1].sysName ne null }">           
                        <div class="carousel-item">
                            <img src="/file/${imageList[1].sysName }" class="img-responsive center-block" style="width:85vmin; height:70vmin; object-fit:cover; border-radius:30px;">
                         </div>
                      </c:if>
                      
                      <c:if test="${imageList[2].sysName ne null }">           
                        <div class="carousel-item">
                            <img src="/file/${imageList[2].sysName }" class="img-responsive center-block" style="width:85vmin; height:70vmin; object-fit:cover; border-radius:30px;">
                          </div>
                      </c:if>
                      
                    </div>
<!--                     <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev"> -->
<!--                       <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
<!--                       <span class="visually-hidden">Previous</span> -->
<!--                     </button> -->
<!--                     <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next"> -->
<!--                       <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
<!--                       <span class="visually-hidden">Next</span> -->
<!--                    </button> -->
                </div>
            </div>
        </div>
   
   <br><br>


    <form action="/update.productBoard" method=post enctype="multipart/form-data" id=form>

   <!-- input type hidden 모음 -->
   <input type=hidden name=seq value=${BoardDTO.seq }>
   <input type=hidden id=updateTitle name=title>
   <input type=hidden id=savedContents value="<c:out value="${BoardDTO.contents}"/>">
      
         
        
        <div class="row">
           <div class="col-11 col-lg-6 m-auto">
              <div class="row">
                 <div class="col-8 my-auto" id=title style="font-size:2rem;">${BoardDTO.title }</div>
                 <div class="col-1">
                 
                 </div>
                 <div class="col-3 statusTag text-center my-auto">${BoardDTO.status }</div>
              </div>
           </div>
        </div>
        
        <div class="row">
           <div class="col-11 col-lg-6 m-auto">
              <div class="row">
              
                 <div class="col-11 pdCategory" id=category>
                    ${BoardDTO.category } / ${BoardDTO.pname }
                 </div>
                 
                 <div class="col-11 col-lg-11 p-0" id=modifyCategory style="display:none; font-size:1.7rem;">
                    <br>
                    <select name=category>
                       <option value=의류 id=clothing>의류
                       <option value=잡화 id=stuff>잡화
                       <option value=가전 id=appliances>가전
                       <option value=취미 id=leisure>취미
                       <option value=아동 id=children>아동
                       <option value=기타 id=else>기타
                    </select>
                    <span style="color:crimson;">&nbsp;* 카테고리</span>
                    
                    <br><br>
                    
                    <input type=text id=pname name=pname value=${BoardDTO.pname }>
                    <span style="color:crimson;">&nbsp;* 상품명</span>
                    
                 </div>
                 
              </div>
           </div>
        </div>
        
        <br>
        
        <div class="row">
           <div class="col-11 col-lg-6 m-auto">
              <div class="row">
                 <div class="col-6 my-auto" id=price style="font-size:2rem; font-weight:bold;">
                    ${BoardDTO.price } 원
                 </div>
                 <div class="col-11 p-0" id=modifyPrice style="display:none; font-size:1.7rem;">
                    <input type=text maxlength="9" id=submitPrice name=price value=${BoardDTO.price }>
                    <span style="color:crimson;">&nbsp;* 가격</span>
                 </div>
                 
                 <div class="col-6 text-right my-auto p-0">
                 
                    <span class=pdTag id=sellingOption style="padding:10px 20px;">
                    ${BoardDTO.sellingOption }
                    </span>
                    
                 </div>
                 
                 <div class="col-11 p-0" id=modifySellingOption style="display:none; font-size:1.7rem;">
                    <br>
                    <select id=sellingOptionSelect name=sellingOption>
                       <option value="물물교환 & 금전거래" id=all>물물교환 & 금전거래
                       <option value="물물교환만" id=exchange>물물교환만
                       <option value="금전거래만" id=money>금전거래만
                    </select>
                    <span style="color:crimson;">&nbsp;* 거래방식</span>
                 </div>
              
              </div>
           </div>
        </div>
        
        <br><br>
        
        <div class="row" id=infoRow>
           <div class="col-11 col-lg-6 m-auto">
              <div class="row">
                 <div class="col-1 my-auto">
                    <img src="/file/${sysName }" style="width:50px; height:50px; border-radius:50%; object-fit:cover; border: 1px solid #5f686db4;">
                 </div>
                 <div class="col-4 my-auto" style="padding-left:25px;">
                    &nbsp;${BoardDTO.writer }<br>서울시 중구 명동
                 </div>
                 <div class="col-7 text-right px-0 py-3">
                 
                    <!-- 판매상태변경 -->
                    <c:if test="${BoardDTO.writer eq loginId }">
                       <c:if test="${BoardDTO.status eq '판매중' }">
                          <button type=button class="btn btn-success btnStyle" id=reserved>예약중으로 변경</button>&nbsp;
                          <button type=button class="btn btn-success btnStyle" id=soldout>판매완료</button>
                       </c:if>
                       <c:if test="${BoardDTO.status eq '예약중' }">
                          <button type=button class="btn btn-success btnStyle" id=onsale>판매중으로 변경</button>&nbsp;
                          <button type=button class="btn btn-success btnStyle" id=soldout>판매완료</button>
                       </c:if>
                       <c:if test="${BoardDTO.status eq '판매완료' }">
                          <a href="/myShop.member?parentId=${BoardDTO.writer }"><button type=button class="btn btn-success btnStyle">상점가기</button></a>
                       </c:if>
                    </c:if>
                    
                    <!-- 상점가기, 채팅하기 -->
                    <c:if test="${BoardDTO.writer ne loginId && loginId ne null }">
                       <a href="/myShop.member?parentId=${BoardDTO.writer}"><button type=button class="btn btn-success btnStyle" id=chatBtn>상점가기</button></a>&nbsp;
                       <a href="/chatWith.chat?with=${BoardDTO.writer}"><button type=button class="btn btn-success btnStyle" id=chatBtn>채팅하기</button></a>
                    </c:if>
                    
                 </div>
              </div>
           </div>
        </div>
        
        
        
<!--         <div class="row"> -->
<!--            <div class="col-11 col-lg-6 m-auto"> -->
<!--               <div class="row"> -->
<!--                  <div class="col-12"> -->
                 
<!--                  </div> -->
<!--               </div> -->
<!--            </div> -->
<!--         </div> -->
        
        
        
        <div class="row" id=fileAddBtnBox style="display:none;">
           <div class="col-11 col-lg-6 m-auto">
              <div class="row">
                 <div class="col-12 p-0 text-center">
                    <hr style="margin-top:-5px; margin-bottom:40px;">
                    <button type=button class="btn btn-success btnStyle" id=fileAddBtn style="margin-bottom:20px;">상품이미지 추가하기</button>
                 </div>
              </div>
           </div>
        </div>
        
        
        <div class="row" id=imageBox style="display:none;">
           <div class="col-11 col-lg-6 m-auto">
              <div class="row">
                 <div class="col-12">
                    <br>
                    <div class="row text-center" id=imageRow>
                    
                       <c:forEach var="i" items="${imageList }">
                          <c:set var="count" value="${count+1 }"/>
                          
                          <div class="col-4 td tdSaved">
                             <input type=hidden name="imageSeq${count }" value=${i.seq }>
                             <img src="/file/${i.sysName }" class=previewImage id="previewImage" style="width:135px; height:135px; object-fit:cover; border-radius:20px; margin-bottom:10px;">
                             <button type=button class="deleteSavedImageBtn btn btn-danger btnStyle" id=deleteSavedImageBtn imageSeq=${i.seq }>삭제하기</button>
                          </div>
                          
                       </c:forEach>
                    
                    </div>
                    
                       <hr style="margin-top:50px; margin-bottom:-15px;">
                       
                 </div>
              </div>
           </div>
        </div>
        
        
        
        
           
        <br><br>
        
        <div class="row" id=contentsTd>
           <div class="col-11 col-lg-6 m-auto">
              <div class="row">
                 <div class="col-12" id=contents style="min-height:400px; overflow-y:auto; border:1px solid black; padding:12px;">
                    ${BoardDTO.contents }
                 </div>
              </div>
           </div>
        </div>
        
        <br>
        
        
        
        
        
        
        <div class="row" id=summernoteTd style="display:none;">   
           <div class="col-11 col-lg-6 m-auto">
              <div class="row">
                 <div class="col-12 p-0">
                    <textarea id=summernote class=summernote name=contents></textarea>
                 </div>
              </div>
           </div>
        </div>
           
        <div class="row">
           <div class="col-11 col-lg-6 m-auto">
              <div class="row">
                 <div class="col-12 m-auto text-center" id=btnBox>
                 
                    <button type=button class="btn btnStyle btnHover" id=toList>목록으로</button>
                    
                  <!-- 작성자 본인일 경우 수정, 삭제 표시 -->
                    <c:if test="${BoardDTO.writer eq loginId }">
                    
                       <c:if test="${BoardDTO.status ne '판매완료' }">
                          <button type=button class="btn btnStyle btnHover" id=updateBtn>수정하기</button> 
                       </c:if>
                       
                       <a href="/delete.productBoard?seq=${BoardDTO.seq }"><button type=button class="btn btnStyle btnHover" id=deleteBtn>삭제하기</button></a>
                       
                    </c:if>
        
                 </div>
              
              </div>
           </div>
        </div>
        
        <br><br><br>
        
        
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
    
    <input type=hidden id=tttt value=${BoardDTO.contents }>
    
    
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
    
       // 판매상태 변경 기능
    
     $("#onsale").on("click",function(){
       if(confirm("판매중으로 변경하시겠습니까?")) {
           $.ajax({
              url : "/statuschange.productBoard",
              data : {status : "판매중",seq:${BoardDTO.seq }}
           }).done(function(){
              location.reload()
           })   
       } else{
          return false
       }
     })
     
     $("#reserved").on("click",function(){
        if(confirm("예약중으로 변경하시겠습니까?")) {
            $.ajax({
               url : "/statuschange.productBoard",
               data : {status : "예약중",seq:${BoardDTO.seq }}
            }).done(function(){
               location.reload()
            })   
        } else{
           return false
        }
     })
     
     $("#soldout").on("click",function(){
        if(confirm("판매완료로 변경하시겠습니까?")){
          $.ajax({
              url : "/statuschange.productBoard",
              data : {status : "판매완료",seq:${BoardDTO.seq }}
           })
           location.href="/evalchatRoom.chat?seq=${BoardDTO.seq}";
       } else{
             return false
       }
      })
      
      
      
    

       // 물물교환만 일 경우 가격 표시 안함
       if("${BoardDTO.sellingOption }" == "물물교환만") {
          $("#price").text("가격없음")
       }
       
       // 게시판 목록으로
       $("#toList").on("click", function(){
          location.href="/list.productBoard?currPage=1"
       })
       
       // 게시글 삭제
       $("#deleteBtn").on("click", function(){
          if(confirm("정말 삭제하시겠습니까?")) {
             return true
          } else {
             return false
          }
       })
       
       // 게시글 수정
       $("#updateBtn").on("click", function(){
          
          // 첨부 이미지 수정
          $("#fileAddBtnBox").css("display", "")
          $("#imageBox").css("display", "")
          
          let i = 4
          
          $("#fileAddBtn").on("click", function(){
             
               i += 1
               
               if($(".td").length >= 3) {
                  alert("이미지는 최대 3장까지만 등록 가능합니다.")
                  return false
               }
               
               
            let td = $("<div class='col-4 td filebox'>")
            let label = "<label for='inputImage" + i + "'>찾기</label>"
            let previewImage = "<img style='width:135px; height:135px; object-fit:cover; border:1px solid black; border-radius:20px; margin-bottom:10px;' class=previewImage id=previewImage" + i + " src='https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image'>"
            let inputImage = "<input type=file style='width:77px; margin:auto; margin-bottom:10px;' class=inputImage id=inputImage" + i + " class=inputTypeFile accept='image/*' name=file" + i + ">"
            let deleteImgBtn = "<button type=button class='deleteImageBtn btn btn-danger btnStyle' style='height:33.5px; margin-top:-1px;'>삭제</button>"
            
            td.append(previewImage)
            td.append(label)
            td.append(inputImage)
            td.append(deleteImgBtn)
            
            $("#imageRow").append(td)
            
            
            $(".inputImage").on("change", function(e){
               
                   let input = e.target
   
                   if(input.files && input.files[0]) {
                      // 첨부파일 사이즈 체크
                      var maxSize = 5 * 1024 * 1024;
                     var fileSize = input.files[0].size;

                     if(fileSize > maxSize){
                        alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
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
//                         $(this).closest(".td").remove()

                        return false;
                     }
                      
                   }
                   
               })
               
               $(".deleteSavedImageBtn").on("click", function(){
                  
                  $.ajax({
                     url : "/deleteSavedImage.productBoard",
                     data : {imageSeq : $(this).attr("imageSeq")}
                  })
                  
                  $(this).closest(".td").remove()
                  
               })
               
               $(".deleteImageBtn").on("click", function(){
                  $(this).closest(".td").remove()
               })
               
          })
               
               
               $(".deleteSavedImageBtn").on("click", function(){
                  
                  $.ajax({
                     url : "/deleteSavedImage.productBoard",
                     data : {imageSeq : $(this).attr("imageSeq")}
                  })
                  
                  $(this).closest(".td").remove()
                  
               })
               

          
          // 수정버튼 눌렀을때 물물교환만 일 경우 가격 숨김
          if("${BoardDTO.sellingOption }" == "물물교환만") {
            $("#submitPrice").val("없음")
            $("#submitPrice").attr("disabled", "")
         } else {
            
         }
          
          // 판매방식 선택에 따른 가격입력칸 표시
           $("#sellingOptionSelect").on("change", function(){
             if($(this).val() == "물물교환 & 금전거래") {
                $("#submitPrice").removeAttr("disabled")
                $("#submitPrice").val("${BoardDTO.price }")
             } else if($(this).val() == "물물교환만") {
                $("#submitPrice").attr("disabled", "")
                $("#submitPrice").val("없음")
             } else if($(this).val() == "금전거래만") {
                $("#submitPrice").removeAttr("disabled")
                $("#submitPrice").val("${BoardDTO.price }")
             }
          })
          
          // 수정버튼 눌렀을때 카테고리에 게시글 카테고리 selected 부여
          if("${BoardDTO.category }" == "의류") {
             $("#clothing").attr("selected", "")
          } else if("${BoardDTO.category }" == "잡화") {
             $("#stuff").attr("selected", "")
          } else if("${BoardDTO.category }" == "가전") {
             $("#appliances").attr("selected", "")
          } else if("${BoardDTO.category }" == "취미") {
             $("#leisure").attr("selected", "")
          } else if("${BoardDTO.category }" == "아동") {
             $("#children").attr("selected", "")
          } else {
             $("#else").attr("selected", "")
          }
          
          // 수정버튼 눌렀을때 거래방법에 게시글 거래방법 selected 부여
          if("${BoardDTO.sellingOption }" == "물물교환 & 금전거래") {
             $("#all").attr("selected", "")
          } else if("${BoardDTO.sellingOption }" == "물물교환만") {
             $("#exchange").attr("selected", "")
          } else if("${BoardDTO.sellingOption }" == "금전거래만") {
             $("#money").attr("selected", "")
          }
          
          
          $("#title").attr("contenteditable", "true")
          $("#title").css("border-bottom", "1px solid black")
          $("#title").css("opacity", "0.5")
          $("#category").css("display", "none")
          $("#modifyCategory").css("display", "")
          $("#sellingOption").css("display", "none")
          $("#modifySellingOption").css("display", "")
          $("#modifyPname").css("display", "")
          $("#price").css("display", "none")
          $("#modifyPrice").css("display", "")
          $("#infoRow").css("display", "none")
          $("#toList").css("display", "none")
          $("#updateBtn").css("display", "none")
          $("#deleteBtn").css("display", "none")
          let confirm = $("<button class='btn btn-primary btnStyle'>수정완료</button>")
          let cancel = $("<button type=button class='btn btn-primary btnStyle' id=cancelBtn>취소</button>")
          $("#btnBox").append(confirm)
          $("#btnBox").append("\u00a0")
          $("#btnBox").append(cancel)
          
          $("#cancelBtn").on("click", function(){
             location.reload()
          })
          
          
          // 썸머노트
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
          
          $("#contentsTd").css("display", "none")
          $("#summernoteTd").css("display", "")
          $("#summernote").summernote("code", $("#savedContents").val())
       })
       
      // 수정 완료       
       $("#form").on("submit", function(){
          
          // 가격 정규표현식
         let priceRegex = /^[\d]{1,10}$/g;
         let inputPrice = $("#submitPrice").val()
         
         if($("#title").text() == "") {
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
             if($(".td").length == 0 || ($(".tdSaved").length == 0 && $(".inputImage").val() == "")) {
                alert("상품이미지를 한 장 이상 등록해주세요.")
                return false
             }
          
          if(confirm("수정하시겠습니까?")) {
             $("#updateTitle").val($("#title").text())
            $("#submitPrice").removeAttr("disabled")
            return true
          } else {
             return false
          }
       })
       
       
       
       
       
       
    
    </script>

</body>
</html>