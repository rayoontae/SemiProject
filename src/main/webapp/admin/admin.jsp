<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

   <div class="container">
   
      <div class="row">
      
         <div class="col-11 col-md-9 col-lg-7 col-xl-5 col-xxl-4 m-auto text-center">
            <div class="row">
               <div class="col-12 text-center">
                  <br><br><br>
                  <h2 style="width:300px; margin:0 auto; padding:15px; background-color:darkcyan; color:white; font-weight:bold; border-radius:20px;">관리자 페이지</h2>
                  <br><br><br>
               </div>
            </div>
            
            <div class="row">
               <div class="col-7 pr-0">
                  <input type=text id=inputProductSeq placeholder="상품 게시글 번호" style="margin-top:5px; margin-left:20%;">
               </div>
               <div class="col-5">
                  <button class="btn btn-primary" id=delProductBtn style="margin-right:15%;">게시글 삭제</button>
               </div>
            </div>
            
            <br><br>
            
            <div class="row">
               <div class="col-7 pr-0">
                  <input type=text id=inputCarSeq placeholder="전기차 게시글 번호" style="margin-top:5px; margin-left:20%;">
               </div>
               <div class="col-5">
                  <button class="btn btn-primary" id=delCarBtn style="margin-right:15%;">게시글 삭제</button>
               </div>
            </div>
            
            <br><br>
            
            <div class="row">
               <div class="col-7">
                  <input type=text id=inputMemberId placeholder="탈퇴시킬 회원 아이디" style="margin-top:5px; margin-left:20%;">
               </div>
               <div class="col-5">
                  <button class="btn btn-primary" id=delMemberBtn style="margin-right:24%;">회원 탈퇴</button>
               </div>
            </div>
            
            <div class="row">
               <div class="col-12 text-center">
                  <br><br>
                  <a href="/index.jsp"><button class="btn btn-secondary">메인으로</button></a>
               </div>
            </div>
         
         </div>      
      
      </div>
   
   </div>
   
   
   <script>
   
      $(document).ready(function(){
         
         if("${loginId }" != "admin1234") {
            alert("접근권한이 없습니다.")
            location.href="/index.jsp"
         }
      
      })
      
      $("#delProductBtn").on("click", function(){
         if(confirm("정말 삭제하시겠습니까?")) {
            let input = $("#inputProductSeq").val()
            location.href="/delete.productBoard?seq=" + input
         } else {
            return false
         }
      })
   
      $("#delCarBtn").on("click", function(){
         if(confirm("정말 삭제하시겠습니까?")) {
            let input = $("#inputCarSeq").val()
            location.href="/delete.carBoard?seq=" + input
         } else {
            return false
         }
      })
      
      $("#delMemberBtn").on("click", function(){
         if(confirm("정말 탈퇴시키겠습니까?")) {
            let input = $("#inputMemberId").val()
            location.href="/delete.member?id=" + input
         } else {
            return false
         }
      })
   
   </script>




</body>
</html>