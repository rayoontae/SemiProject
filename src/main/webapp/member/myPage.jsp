<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니꺼내꺼 마이페이지</title>
<!-- CSS External -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/myPage.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/joinForm.css" />
<!-- CSS경로 하나-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myPage.css" />
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

			<nav class="navbar fixed-top navbar-expand-lg py-auto"
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
	<!-- 개인 프로필 -->
	<form action="/update.member" method=post enctype="multipart/form-data" id="form">
	<div class="container containerSetting">
		<div class="row profile text-center">
			<div class="col-12 text-start">
				<span class="profileText">
					<h5 style="font-weight: bold">마이페이지</h5>
				</span>
			</div>

			<div class="col-12 mt-4 text-center">
				<td align=center colspan=2>
					<img src="/file/${sysName }" style="width:150px; height:150px; object-fit:cover;" id=img class="profileImg"><br>
					<input type=file name=file id=file class="button" style="display: none; margin-left: 90px; margin-top: 30px" accept='image/*'>
				</td>
				
			</div>

			<div id="bin" class="col-12 mt-3 mb-5">
				<div>
					<strong>${dto.id}</strong>님
				</div>
			</div>
		</div>

		<!-- 프로필 수정 -->
			<div class="row joinRow name-field">
				<div class="col-3 mb-1">이름</div>
				<div class="col">${dto.name}</div>
			</div>

			<div class="row joinRow phone-field">
				<div class="col-12 mb-2">전화번호</div>
				<div class="col-12">
					<input type="text" class="phone inputForm editable"
						value="${dto.phone}" name="phone" id="phone" disabled />
				</div>
			</div>

			<div class="row joinRow email-field">
				<div class="col-12 mb-2">이메일</div>
				<div class="col-12">
					<input type="text" class="email inputForm editable"
						value="${dto.email }" name="email" id="email" disabled />
				</div>
			</div>

			<div class="row joinRow zipcode-field">
				<div class="col-12 mb-2">우편번호</div>
				<div class="col-12 zipcodeInput">
					<input type="text" class="zipcode editable m-0"
						value="${dto.zipcode }" name="zipcode" id="zipcode" disabled />
				</div>
			</div>

			<div class="row joinRow road-field">
				<div class="col-12 mb-2">도로명 주소</div>
				<div class="col-12">
					<input type="text" class="road inputForm editable"
						value="${dto.roadAddress }" name="roadAddress"id="roadAddress" disabled />
				</div>
			</div>

			<div class="row joinRow jibun-field">
				<div class="col-12 mb-2">지번 주소</div>
				<div class="col-12">
					<input type="text" class="jibun inputForm editable"
						value="${dto.jibunAddress }" name="jibunAddress" id="jibunAddress" disabled />
				</div>
			</div>

			<div class="row joinRow spec-field">
				<div class="col-12 mb-2">상세 주소</div>
				<div class="col-12">
					<input type="text" class="spec inputForm editable"
						value="${dto.specAddress }" name="specAddress" id="specAddress" disabled />
				</div>
			</div>
			
			<div class="row joinRow answer-field">
				<div class="col-12 mb-2">개인질문답변</div>
				<div class="col-12">
					<input type="text" class="spec inputForm editable"
						value="${dto.personalAnswer }" name="personalAnswer" id="personalAnswer" disabled />
				</div>
			</div>
			
			<div class="row joinRow id-field">
				<div class="col-3 mb-1">신뢰등급</div>
				<div class="col">${dto.reliability }</div>
			</div>
			
			<div class="row joinRow id-field">
				<div class="col-3 mb-1">가입날짜</div>
				<div class="col">${dto.formedDate }</div>
			</div>

			<div class="col-12 mt-3 text-center" id="btns">
				<button class="btn btn-primary btnNoStyle" id="modify" type="button">수정하기</button>
				<button class="btn btn-outline-primary btnNoStyle" id="back" type="button">뒤로가기</button>
			</div>
			
			<div class="col-12 mt-3 text-end" id="btns">
			<hr>
				탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요.&nbsp;
				<button class="btn btn-outline-primary btnNoStyle" id="memberOut" type="button">탈퇴하기</button>
			</div>
	</div>
		</form>

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
	
		$("#modify").on("click", function() {
			
			$(".editable").removeAttr("disabled");
	        $(this).css("display", "none");

	        let ok = $("<button>");
	        ok.text("수정완료");
	        ok.attr("class", "ok btn btn-primary btnNoStyle m-1");

	        let cancel = $("<button>");
	        cancel.text("취소");
	        cancel.attr("class", "btn btn-outline-primary btnNoStyle");
	        cancel.attr("type", "button");
	        cancel.on("click", function () {
	          location.reload();
	        });

	        $("#btns").prepend(cancel);
	        $("#btns").prepend(ok);
	        
	        
	        let findBtn = $("<button>")
			findBtn.text("찾기")
			findBtn.attr("type", "button")
			findBtn.addClass("btn btn-outline-dark addressBtn")
			$(".zipcodeInput").append(findBtn)

			//버튼보이게 하나
			$("#file").css("display", "")
			
			findBtn.on("click", function(){
				new daum.Postcode({
	                oncomplete: function (data) {
	                    document.getElementById('zipcode').value = data.zonecode;
	                    document.getElementById("roadAddress").value = data.roadAddress;
	                    document.getElementById("jibunAddress").value = data.jibunAddress;

	                }
	            }).open();
			})
	        
	      });
		
		//file 제한
		
		$("#file").on("change", function(e){
            	
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

            			return false;
            		}
                	
                }
            	
            })

		$("#back").on("click", function() {
			location.href = "/index.jsp"
		});
		
		//탈퇴버튼 하나
		$("#memberOut").on("click", function() {					
			Swal.fire({
				  title: "정말 탈퇴하시겠습니까?",
				  text: "탈퇴 후에는 계정 복구가 불가능합니다.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: "네, 탈퇴할래요",
				  cancelButtonText: "아뇨! 다시생각할래요"
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire(
				      '탈퇴되었습니다',
				      '다음에 다시 만나요',
				      'success'
				    ).then(function(){
				    	location.href="/memberOut.member"
				    })
				  }
				})
				})
		
		// 	프로필 미리보기 하나
			$(function() {
			$("#file").on('change', function() {
				readURL(this);
				});
			});
			function readURL(input) {
			if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
			$('#img').attr('src', e.target.result);
							}
			reader.readAsDataURL(input.files[0]);
				}
			}
		
			
			
			//정규식 검사 하나
			$("#form").on("submit",function() {
				let phoneRegex = /^01[\d]-?\d{3,4}-?\d{4}$/;
				let emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;

				// 핸드폰 검사
				if ($("#phone").val() == "") {
					alert("휴대폰 번호를 입력해주세요.")
					$("#phone").focus()
					return false
				} else if (phoneRegex.test($("#phone").val()) == false) {
					alert("휴대전화번호를 형식에 맞게 입력해주세요.");
					$("#phone").val("")
					$("#phone").focus()
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

				if ($("#zipcode").val() == "") {
					alert("주소를 입력해주세요.");
					$("#zipcode").focus();
					return false;
				}

				if ($("#roadAddress").val() == "") {
					alert("도로명주소를 입력해주세요.");
					$("#roadAddress").focus();
					return false;
				}

				if ($("#jibunAddress").val() == "") {
					alert("지번주소를 입력해주세요.");
					$("#jibunAddress").focus();
					return false;
				}

				if ($("#specAddress").val() == "") {
					alert("세부주소를 입력해주세요.");
					$("#specAddress").focus();
					return false;
				}

				if ($("#personalAnswer").val() == "") {
					alert("보물 1호를 입력해주세요.");
					$("#personalAnswer").focus();
					return false;
				}
			});

	</script>

</body>
</html>