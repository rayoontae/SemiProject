<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상점 | 니꺼내꺼</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/myShop.css" />

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<c:choose>
		<c:when test="${isLoginOk == 1}">
			<!-- 로그인시 네비바 -->
			<nav class="navbar fixed-top navbar-expand-lg navbar-light py-auto"
				id="mainNav">
				<div class="container-fluid px-4 px-lg-5" id="subNav">
					<a class="navbar-brand jalnanche" id="navTitle" href="/index.jsp"
						style="font-weight: bold">니꺼내꺼</a>
					<button class="navbar-toggler navbar-toggler-right"
						style="color: transparent;" id="navBtn" type="button"
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
			<!-- 네비바 -->

			<nav class="navbar fixed-top navbar-expand-lg py-auto" id="mainNav">
				<div class="container-fluid px-4 px-lg-5" id="subNav">
					<a class="navbar-brand jalnanche" id="navTitle" href="/index.jsp"
						style="font-weight: bold">니꺼내꺼</a>
					<button class="navbar-toggler navbar-toggler-right"
						style="color: transparent;" id="navBtn" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
						aria-controls="navbarResponsive" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse text-center"
						id="navbarResponsive">
						<ul class="navbar-nav ">
							<li class="nav-item"><a class="nav-link active mouse-effect"
								aria-current="page" href="/list.productBoard?currPage=1">상품보기</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect"
								href="/list.carBoard?cpage=1">전기차</a></li>
							<li class="nav-item"><a class="nav-link active mouse-effect"
								href="#">플리마켓</a></li>
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

		</c:otherwise>
	</c:choose>


	<div class="container containerSetting">

		<br> <br> <br>

		<div class="row">

			<div class="col-12 text-center">
            	<span class="profileText">
               		<h5 style="font-weight: bold">${parentId }님의 상점</h5>
            	</span>
         	</div>
         	
			<div class="col-6 m-auto text-center">
				<img class="profileImg" src="/file/${sysName }"
					style='width: 150px; height: 150px; object-fit: cover; border-radius: 50%;'>
				<br> <br>
				
				<div>
                     <span style="font-weight: bold; width:100px;height:20px;font-size:20px;display:inline-block;">신뢰 등급</span>
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
				
				<%-- 				<h3>${parentId }님의 상점</h3> --%>
				<br> <a href="/index.jsp"><button class="btn btn-primary">메인으로</button></a>&nbsp;

				<c:if test="${parentId ne loginId && loginId ne null }">
					<a href="/chatWith.chat?with=${parentId }"><button
							class="btn btn-primary">채팅하기</button></a>
				</c:if>

			</div>

		</div>

		<br> <br> <br>
	</div>

	<div class="container">
		<div class="row w-100 m-0">
			<div class="col-12 p-0">
				<div class="row w-100 m-0" id=productTable>

					<!-- 게시글이 하나이상 있는 경우  -->
					<c:if test="${list[0].title ne null }">

						<c:forEach var="i" items="${sysNameList }" varStatus="status">
						
							<c:choose>
							<c:when test="${list[status.index].sellingOption eq '물물교환만'}">
							<div class="col-12 col-lg-7 mb-4 m-auto">
								<div class="row m-auto" style="background-color:#F5F7F8; border-radius:22px; width:100%; height:34vmin;">
									<div class="col-5 my-auto text-center" style="padding:0; padding-left:15px;">
										<img src="/file/${i }" style='object-fit: cover; width: 95%; height: auto; max-height: 35vmin; display: block; margin: 0 auto;'>
									</div>
									
									<div class="col my-auto" style="padding-left:20px;">
										<div style="overflow:hidden; text-overflow:ellipsis; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient: vertical; word-wrap:break-word; font-size:1.2rem;">
											<div>
												<a href="/detail.productBoard?seq=${list[status.index].seq }" class="pdAnker">
												${list[status.index].title }
												</a>
											</div>
										</div>
										<hr style="background-color:rgba(0,0,0,0.4); margin:10px;">
										<c:choose>
                                			 <c:when test="${list[status.index].status eq '판매중' }">
                                    			<span class="statusTag" style="color:red;">${list[status.index].status }</span>
                                 			</c:when>	
                                			<c:when test="${list[status.index].status eq '예약중' }">
                                    			<span class="statusTag" style="color:green">${list[status.index].status }</span>
                                 			</c:when>
                                 			<c:otherwise>
                                    			<span class="statusTag" style="color:grey">${list[status.index].status }</span>
                                 			</c:otherwise>
                              			</c:choose>
										<br>
										<span class="payTag" style="margin-top:10px; display:inline-block;">${list[status.index].sellingOption }</span>
									</div>
								</div>
							</div>
							</c:when>
							
							<c:otherwise>
							<div class="col-12 col-lg-7 mb-4 m-auto">
								<div class="row m-auto" style="background-color:#F5F7F8; border-radius:22px; width:100%; height:34vmin;">
									<div class="col-5 my-auto text-center" style="padding:0; padding-left:15px;">
										<img src="/file/${i }" style='object-fit: cover; width: 95%; height: auto; max-height: 35vmin; display: block; margin: 0 auto;'>
									</div>
									
									<div class="col my-auto" style="padding-left:20px;">
										<div style="overflow:hidden; text-overflow:ellipsis; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient: vertical; word-wrap:break-word; font-size:1.2rem;">
											<div>
												<a href="/detail.productBoard?seq=${list[status.index].seq }" class="pdAnker">
												${list[status.index].title }
												</a>
											</div>
										</div>
										<hr style="background-color:rgba(0,0,0,0.4); margin:10px;">
										<h5 style='margin-bottom:10px; display:inline;'>￦ ${list[status.index].formedPrice }원</h5>
										<c:choose>
                                			 <c:when test="${list[status.index].status eq '판매중' }">
                                    			<span class="statusTag" style="color:red;">${list[status.index].status }</span>
                                 			</c:when>	
                                			<c:when test="${list[status.index].status eq '예약중' }">
                                    			<span class="statusTag" style="color:green">${list[status.index].status }</span>
                                 			</c:when>
                                 			<c:otherwise>
                                    			<span class="statusTag" style="color:grey">${list[status.index].status }</span>
                                 			</c:otherwise>
                              			</c:choose>
										<br>
										<span class="payTag" style="margin-top:10px; display:inline-block;">${list[status.index].sellingOption }</span>
									</div>
								</div>
							</div>
							</c:otherwise>
							</c:choose>
							
							
							
						</c:forEach>

					</c:if>

					<!--  게시글이 없는 경우 -->
					<c:if test="${list[0].title eq null }">
					
<!-- 					<div class="col-12  text-center"> -->
<!-- 						<img src="/source/img/empty.png" class="shopEmpty p-1" /> -->
					
						<div class="text-center">
							<h3>아직 거래중인 상품이 없어요!</h3>
						</div>
<!-- 					</div> -->

					</c:if>


				</div>
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
</script>

</body>
</html>