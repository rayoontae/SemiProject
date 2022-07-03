<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script> 
<!-- 윤태추가 5월30일-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>     
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<!-- 윤태추가끝 -->
<style>
	img{
		width:80px;
		height:70px;
 		margin-left:9%; 
		margin-bottom:5%;
		display:inline;
		
	}
	input{
		margin-left:9%;
	}
	
	
	body{
		background-image : url('/source/icons/simplecol.png');
		background-size:cover;
/* 		background-image : url('/files/bonobono.jpg'); */
	}
	
	*{
		font-family: 'Single Day', cursive;
		text-color:white;
	}
	input[type=radio] { 
  		width:20px;
  		height:20px;
	}
	
	
</style>


</head>

<body>
		

<div class=container>
			<br>
			<br>
			<br>
			<br>
			<div class=row>
				
				<div class=col-sm-12  style="text-align: center;">
					<h3>${id } 님과의 거래는 어땠나요?</h3>
				</div>
			</div>
			<div class=row>
				<div class=col-12>
					<hr>
				</div>
			</div>
			<div class=row>
			
				<div class=col-1></div>
			
				<div class=col-2 style="text-align: center; font-color:white;">
					<img src=/source/icons/verybad.png><br>
					<input type="radio" name="eval" id="varybad"  value=-2><br>&nbsp;<span style="font-size:25px;">최악이에요</span>
				</div>
				<div class=col-2 style="text-align: center;">
					<img src=/source/icons/bad.png><br>
					<input type="radio" name="eval" id="bad"      value=-1><br>&nbsp;<span style="font-size:25px;">별로였어요</span>
				</div>	
				<div class=col-2 style="text-align: center;">
					<img src=/source/icons/normal.png><br>
					<input type="radio" name="eval" id="normal"   value=0><br>&nbsp;<span style="font-size:25px;">보통이에요</span>
				</div>	
				<div class=col-2 style="text-align: center;">
					<img src=/source/icons/good.png><br>
					<input type="radio" name="eval" id="good"     value=1><br>&nbsp;<span style="font-size:25px;">좋아요</span>
				</div>		
				<div class=col-2 style="text-align: center;">
					<img src=/source/icons/verygood.png><br>
					<input type="radio" name="eval" id="verygood" value=2><br>&nbsp;<span style="font-size:25px;">최고예요</span>
				</div>
				
				<div class=col-1></div>
			</div>
			<div class=row>
				<div class=col-12>
					<hr>
				</div>
			</div>
			<div class=row>
				<div class=col-12 id=bottom style="text-align: center;">
					<br>
					<button id=evalend  class="btn btn-success" style="width:100px;height:50px;font-size:20px;" >평가완료</button>
					<input type=hidden value=${id } id=givenpoint>
				</div>
			</div>
		</div>
	
	<script>
		$("#evalend").on("click",function(){
			
			if($("input[name='eval']:checked").val()!=null){
				location.href=" /reliabilityupdate.member?id="+$("#givenpoint").val()+"&reliability="+$("input[name='eval']:checked").val();
			}else{
				alert("평가를 체크해주세요");
				return false;
			}

		})
		
		window.history.forward();		
		function noBack() {	window.history.forward();} 
	</script>
	
</body>
</html>