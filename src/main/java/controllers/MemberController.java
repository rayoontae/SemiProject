package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDAO;
import dao.MultichatDAO;
import dao.ProductBoardDAO;
import dao.ProfileImageDAO;
import dto.MemberDTO;
import dto.MultichatDTO;
import dto.ProductBoardDTO;
import dto.ProfileImageDTO;
import utils.EncryptUtils;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      String uri = request.getRequestURI();
      MemberDAO dao = MemberDAO.getInstance();
      MultichatDAO dao2 = MultichatDAO.getInstance();
      ProfileImageDAO dao3 = ProfileImageDAO.getInstance();
      ProductBoardDAO dao4 = ProductBoardDAO.getInstance();
      Gson g = new Gson();
      
      try {
      
      // 회원가입 페이지로 이동
      if(uri.equals("/join.member")) {
         response.sendRedirect("/member/joinform.jsp");
         
      // 아이디 중복검사
      } else if(uri.equals("/duplCheck.member")) {
         String id = request.getParameter("id");
         boolean result = dao.duplCheck(id);
         response.getWriter().append(g.toJson(result));
         
      // 회원가입 양식 제출
      } else if(uri.equals("/insert.member")) {
         String id = request.getParameter("id");
         String pw = EncryptUtils.SHA512(request.getParameter("pw"));
         String name = request.getParameter("name");
         String phone = request.getParameter("phone");
         String email = request.getParameter("email");
         String zipcode = request.getParameter("zipcode");
         String roadAddress = request.getParameter("roadAddress");
         String jibunAddress = request.getParameter("jibunAddress");
         String specAddress = request.getParameter("specAddress");
         String personalAnswer = request.getParameter("personalAnswer");
         int reliability = 0; // 회원 신뢰도 초기값
         
         int result = dao.insert(new MemberDTO(id,pw,name,phone,email,zipcode,roadAddress,
                           jibunAddress,specAddress,null,personalAnswer,reliability));
         
         int result2 = dao3.insertImg(new ProfileImageDTO(0, id, "default.png", "default.png"));
         
         response.sendRedirect("/index.jsp");
      
      // 로그인
      } else if(uri.equals("/login.member")) {
         String id = request.getParameter("id");
         String pw = EncryptUtils.SHA512(request.getParameter("pw"));
         
         boolean result = dao.isLoginOk(id, pw);
         
         int level=0;
         if(result) {
        	 
        	int reliability=dao.getReliablity(id);
            
            if(reliability<-30) {
               level=-3;
            }else if(reliability>=-30 && reliability<-20) {
               level=-2;
            }else if(reliability>=-20 && reliability<-10) {
               level=-1;
            }else if(reliability>=-10 && reliability<=20) {
               level=1;
            }else if(reliability>20 && reliability<=40) {
               level=2;
            }else if(reliability>40 && reliability<=60) {
               level=3;   
            }else if(reliability>60 && reliability<=80) {
               level=4;
            }else if(reliability>80) {
               level=5;
            }
        	 
            request.getSession().setAttribute("isLoginOk", 1);
            request.getSession().setAttribute("loginId", id);
            
            response.sendRedirect("/index.jsp");
            
         } else {
            request.getSession().setAttribute("isLoginOk", 0);
            response.sendRedirect("/index.jsp");
         }
         
         request.getSession().setAttribute("level", level);
         
      // 로그아웃   
      } else if(uri.equals("/logout.member")) {
         request.getSession().invalidate();
         
         response.sendRedirect("/member/login.jsp");
         
      // 회원탈퇴   
      } else if(uri.equals("/memberOut.member")) {
         String id = (String)request.getSession().getAttribute("loginId");
         int result = dao.memberOut(id);
         
         request.getSession().invalidate();
         response.sendRedirect("/index.jsp");

      // 마이페이지 이동
      } else if(uri.equals("/myPage.member")) {
         //하나코드추가
         String parentId = (String)request.getSession().getAttribute("loginId");
         MemberDTO dto = dao.myPage(parentId);
         
         request.setAttribute("dto", dto);
         
         //하나코드추가
         String sysName = dao3.getSysName(parentId);
         request.setAttribute("sysName", sysName);
         
         
         request.getRequestDispatcher("/member/myPage.jsp").forward(request, response);
         
      // 개인정보 수정   
      } else if(uri.equals("/update.member")) {
         
         //프로필 파일 코드 추가 하나
         request.setCharacterEncoding("UTF-8");
         response.setCharacterEncoding("UTF-8");
         
         int maxSize = 1024 * 1024 * 10; // 파일 업로드 최대 사이즈
         String savePath = request.getServletContext().getRealPath("file");
         File filePath = new File(savePath);
         System.out.println(savePath);//파일 업데이트 경로
         if(!filePath.exists()) {filePath.mkdir();} // 파일을 업로드 할 폴더가 존재하지 않는다면 새로 생성
         
         MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8",new DefaultFileRenamePolicy());
         
         String id = (String)request.getSession().getAttribute("loginId");
         
         String phone = multi.getParameter("phone");
         String email = multi.getParameter("email");
         String zipcode = multi.getParameter("zipcode");
         String roadAddress = multi.getParameter("roadAddress");
         String jibunAddress = multi.getParameter("jibunAddress");
         String specAddress = multi.getParameter("specAddress");
         String personalAnswer = multi.getParameter("personalAnswer");
         
         int result = dao.update(new MemberDTO(id, null, null, phone, email, zipcode, roadAddress, jibunAddress, specAddress, null, personalAnswer, 0));
         
         //프로필 업로드 코드 추가 하나
         String parentid = id;
      
         Enumeration<String> e = multi.getFileNames(); //다중 파일 업로드 
         while(e.hasMoreElements()) {
            String name = e.nextElement();
            
            if(multi.getOriginalFileName(name) == null) {
               continue;
            }
            
            String oriName = multi.getOriginalFileName(name);
            String sysName = multi.getFilesystemName(name);
            dao3.insertImg(new ProfileImageDTO(0, parentid, oriName, sysName));
            
         }
         
         response.sendRedirect("/myPage.member");
         
      //email로 id 찾기 하나
      }else if(uri.equals("/missingIdEmail.member")) {

         String name = request.getParameter("name");
         String email = request.getParameter("email");

         String id = dao.findIdEmail(name, email);
         
         response.getWriter().append(g.toJson(id));

      //phone로 id 찾기 하나
      }else if(uri.equals("/missingIdPhone.member")) {

         String name = request.getParameter("name2");
         String phone = request.getParameter("phone");

         String id = dao.findIdPhone(name, phone);
         response.getWriter().append(g.toJson(id));
         
      //pw 찾기 하나
      }else if(uri.equals("/missingPw.member")) {   

         String id = request.getParameter("id");
         String personalanswer = request.getParameter("personalanswer");

         String id2 = dao.isPWExist(id,personalanswer);

         if(id2 != null) {
            System.out.println(id2);

            HttpSession session = request.getSession();
            session.setAttribute("pwID",id2);
         }
         response.getWriter().append(g.toJson(id2));

      //pw 재설정 하나
      }else if(uri.equals("/pwUpdate.member")) {
         request.setCharacterEncoding("UTF-8");

         String id = (String)request.getSession().getAttribute("pwID");
         String pw = EncryptUtils.SHA512(request.getParameter("pw"));

         dao.pwUpdate(id,pw);
         System.out.println(id);

         response.sendRedirect("/index.jsp");
      
         //윤태추가
            //아이디 전달기능
            } else if(uri.equals("/idtoss.member")) {
               String id=request.getParameter("pointgivenid"); 
               System.out.println("membercontoller에 id 전달됐나? : "+id);
               
               request.setAttribute("id", id);
               request.getRequestDispatcher("/chat/evaluation.jsp").forward(request, response);
            //판매자가 구매자 신뢰도 업데이트
            } else if(uri.equals("/reliabilityupdate.member")) {
               int reliability =Integer.parseInt(request.getParameter("reliability"));
               String buyerId=request.getParameter("id");
               
               System.out.println("reliabilityupdate.member에 buyerId 전달됐나? : "+buyerId);
               System.out.println("reliabilityupdate.member 신뢰도 전달됐나? : "+reliability);
               
               int result=dao.updatereliability(reliability, buyerId);
               
               String sellerId = (String)request.getSession().getAttribute("loginId");
               
               
               //buyerId 쎄션에 올려주기
               request.getSession().setAttribute("buyerId", buyerId);
//               response.sendRedirect("/afterTradeChat.chat");
               
               response.sendRedirect("/sendLink.chat");
               
            } else if(uri.equals("/sellerReliabilityUpdate.member")){
               int reliability =Integer.parseInt(request.getParameter("reliability"));
               String sellerId=request.getParameter("id");
               
               int result=dao.updatereliability(reliability, sellerId);
               
               response.sendRedirect("/chatRoom.chat?loginID=${loginId}");
            // 아이디 전달기능2 
            }else if(uri.equals("/idtoss2.member")) {
               String id=request.getParameter("id"); 
               
               
               request.setAttribute("id", id);
               request.getRequestDispatcher("/chat/evaluation2.jsp").forward(request, response);
            
               
            // 구매자가 판매자의 신뢰도를 업데이트 시켜줌
            }else if(uri.equals("/answerReliabilityUpdate.member")){
               int reliability =Integer.parseInt(request.getParameter("reliability"));
               String Id=request.getParameter("id");
               
               int result=dao.updatereliability(reliability, Id);
               System.out.println("answerReliabilityupdate 에서 신뢰도, 아이디 받았나? : "+reliability+" : "+Id);
               
//               response.sendRedirect("/list.productBoard?currPage=1");
               response.sendRedirect("/linkRemove.chat?invisibleto="+Id);
               
            //윤태추가 끝
      
            // 범준 추가
               // 개인상점으로
               } else if(uri.equals("/myShop.member")) {
                  String parentId = request.getParameter("parentId");
                  
                  // 프로필 이미지
                  String sysName = dao3.getSysName(parentId);

                  // 상품게시글 dto list
                  List<ProductBoardDTO> list = dao4.getMyShopList(parentId);
                  
                  // 상품이미지 sysName list
                  List<String> sysNameList = new ArrayList<>();
                  for(int i=0; i<list.size(); i++) {
                     sysNameList.add(dao4.getMyShopImage(list.get(i).getSeq()));
                  }
                  
                  int reliability=dao.getReliablity(parentId);
                  int level=1;
                  
                  if(reliability<-30) {
                     level=-3;
                  }else if(reliability>=-30 && reliability<-20) {
                     level=-2;
                  }else if(reliability>=-20 && reliability<-10) {
                     level=-1;
                  }else if(reliability>=-10 && reliability<=20) {
                     level=1;
                  }else if(reliability>20 && reliability<=40) {
                     level=2;
                  }else if(reliability>40 && reliability<=60) {
                     level=3;   
                  }else if(reliability>60 && reliability<=80) {
                     level=4;
                  }else if(reliability>80) {
                     level=5;
                  }
                  
                  request.setAttribute("level", level);
                  
                  request.setAttribute("parentId", parentId);
                  request.setAttribute("sysName", sysName);
                  request.setAttribute("list", list);
                  request.setAttribute("sysNameList", sysNameList);
                  
                  request.getRequestDispatcher("/member/myShop.jsp").forward(request, response);
                  
               // 인덱스 프로필이미지 ajax
               } else if(uri.equals("/indexSysName.member")) {
                  String loginId = (String)request.getSession().getAttribute("loginId");
                  String sysName = dao3.getSysName(loginId);
                  
                  response.getWriter().append(g.toJson(sysName));
               }

      
      
      } catch(Exception e) {
         e.printStackTrace();
         response.sendRedirect("/error.jsp");
      }
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}