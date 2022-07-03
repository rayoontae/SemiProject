package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.google.gson.Gson;

import dao.ChatDAO;
import dto.ChatDTO;
import dao.ChatListDAO;
import dao.ProfileImageDAO;
import dto.ChatListDTO;

@WebServlet("*.chat")
public class ChatController extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      String uri = request.getRequestURI();
      ChatDAO dao = ChatDAO.getInstance();
      ChatListDAO ldao = ChatListDAO.getInstance();
      ProfileImageDAO pdao = ProfileImageDAO.getInstance();

      Gson g = new Gson();

      try {

         if(uri.equals("/chatWith.chat")) {
            String loginId = (String)request.getSession().getAttribute("loginId");
            String with = request.getParameter("with");

            dao.updateRead(loginId, with);   // 대화를 누르면 읽음 표시로

            List<ChatDTO> list = dao.getList(loginId, with);
            String sysName = pdao.getSysName(with);

            request.setAttribute("list", list);
            request.setAttribute("with", with);
            request.setAttribute("sysName", sysName);
            request.getRequestDispatcher("/chat/chatDetail.jsp").forward(request, response);

         } else if(uri.equals("/chatRecord.chat")) {
            String loginId = request.getParameter("loginId");
            String recordWith = request.getParameter("recordWith");

            List<ChatDTO> list = dao.getList(loginId, recordWith);

            request.setAttribute("list", list);
            request.getRequestDispatcher("/chatDetails.jsp").forward(request, response);

         }else if(uri.equals("/chatRoom.chat")) {

            String loginId = request.getParameter("loginId");

            // 내가 user1이거나 user2일 때 대화 목록(where invisible != nobody)
            List<ChatListDTO> list = ldao.selectAll(loginId);   // invisible값이 내 아이디가 아닌 것만 출력(nobody 이거나 상대 아이디)

         // 범준 추가 - 채팅함 프로필이미지
            List<String> sysNameList = new ArrayList<>();
            
            for(int i=0; i<list.size(); i++) {
               
               if (list.get(i).getUser1().equals(loginId)) {
                  sysNameList.add(pdao.getSysName(list.get(i).getUser2()));
               } else {
                  sysNameList.add(pdao.getSysName(list.get(i).getUser1()));
               }
               
            }
            
            // ldao.getRecentMsg에서 출력되는 첫 번째값을 배열에 담는다.
            List<ChatDTO> list2 = new ArrayList<>();

            // user1 / user2 받아와서 
            for (ChatListDTO c : list) {
               String user1 = c.getUser1();
               String user2 = c.getUser2();

               ChatDTO result = dao.getRecentMsg(user1, user2, loginId);

               list2.add(result);
            }

            request.setAttribute("loginId", loginId);
            //request.setAttribute("chatRoomExist", chatRoomExist);

            request.setAttribute("list", list);
            request.setAttribute("list2",list2);
            
         // 범준추가 sysNameList
            request.setAttribute("sysNameList", sysNameList);
            request.getRequestDispatcher("/chat/chatList.jsp").forward(request, response);






            //밑에는 이전에 전체 채팅목록 띄우는 코드(invisibleTo 상관없이)


            //            String loginId = request.getParameter("loginId");
            //
            //            // 내가 user1이거나 user2일 때 대화 목록
            //            List<ChatListDTO> list = ldao.getOpponent(loginId);
            //
            //            // ldao.getRecentMsg에서 출력되는 첫 번째값을 배열에 담는다.
            //            List<ChatDTO> list2 = new ArrayList<>();
            //
            //            // user1 / user2 받아와서 
            //            for (ChatListDTO c : list) {
            //               String user1 = c.getUser1();
            //               String user2 = c.getUser2();
            //
            //               ChatDTO result = dao.getRecentMsg(user1, user2);
            //
            //
            //               list2.add(result);
            //            }
            //
            //
            //            request.setAttribute("loginId", loginId);
            //            //request.setAttribute("chatRoomExist", chatRoomExist);
            //
            //            request.setAttribute("list", list);
            //            request.setAttribute("list2",list2);
            //            request.getRequestDispatcher("/chatList.jsp").forward(request, response);

         }else if(uri.equals("/notice.chat")) {
            String loginId = request.getParameter("loginId");
            int result = dao.isAlarmExist(loginId);

            PrintWriter pw = response.getWriter();
            pw.append(g.toJson(result));

         }else if(uri.equals("/chatDetail.chat")) {
            String loginId = request.getParameter("loginId");
            String opponentId = request.getParameter("opponentId");

            //System.out.println(loginId +" : " + opponentId);

            dao.updateRead(loginId, opponentId);   // 대화를 누르면 읽음 표시로

            List<ChatDTO> list = dao.getList(loginId, opponentId);

            //request.setAttribute("result", result);
            request.setAttribute("list", list);
            request.getRequestDispatcher("/chatDetail.jsp").forward(request, response);

         }else if(uri.equals("/invisibleTo.chat")) {
            String loginId = request.getParameter("loginId");
            String opponentId = request.getParameter("opponentId");
            String invisibleTo = request.getParameter("invisibleTo");

            List<ChatDTO> list = dao.getList(loginId, opponentId);

            dao.updateRead(loginId, opponentId);   // 방나가기를 누르면 읽지않은 글도 그냥 읽음 표시로
            
            // invisibleTo가 nobody가 아닐 때 삭제
            if(!(invisibleTo.equals("nobody"))) {   // roomOut 버튼 클릭시 chat_list의 invisibleTo 값이 nobody가 아닌 거는, 상대방은 이미 그 방을 나간 것.
               ldao.deleteChatList(loginId, opponentId);

               // invisibleTo가 opponentId면 해당 채팅방은 allout의 의미이니까
               // 이전 데이터의 Invisible 값이 다시 내 아이디로 바뀌는게 아니라 allout으로 바뀐다.
               // 이 후 다시 chat을 불러주는 대로 가서 allout일 때는 다 getList가 되지 않도록


               for (ChatDTO dto : list) {
                  if(!(dto.getInvisibleTo().equals("nobody"))) {
                     dao.updateAllOut(loginId, opponentId);
                  }
               }

               // invisible을 loginId로
            }else if(invisibleTo.equals("nobody")) {
               // chat 테이블의 invisible 값을 loginId로 바꿔준다.(chat 테이블에서 loginId로 바뀐거는 다시 nobody로 바꿔줄 필요가 없다.)

               for (ChatDTO dto : list) {
                  if(dto.getInvisibleTo().equals("nobody")&&!(dto.getInvisibleTo().equals("allout"))) {
                     dao.updateChatInvi(loginId, opponentId);   // invisibleTo=loginId
                  }else if(dto.getInvisibleTo().equals(opponentId)) {
                     dao.updateAllOut(loginId, opponentId);
                  }
               }
               ldao.updateInvisible(loginId, opponentId);   // chat_list에서 loginID

            }

            response.getWriter().append(g.toJson("test"));
            //            request.setAttribute("loginId", loginId);
            //            request.getRequestDispatcher("/chatRoom.chat").forward(request, response);
            //response.sendRedirect("/chatRoom.chat");


          //윤태추가 //
            //리스트 불러서 채팅목록 뿌려줌(평가버튼이 있는것)
            }else if(uri.equals("/evalchatRoom.chat")) {
            	String loginId = (String)request.getSession().getAttribute("loginId");
                int seq=Integer.parseInt(request.getParameter("seq"));

               // 내가 user1이거나 user2일 때 대화 목록(where invisible != nobody)
               List<ChatListDTO> list = ldao.selectAll(loginId);   // invisible값이 내 아이디가 아닌 것만 출력(nobody 이거나 상대 아이디)

               List<String> sysNameList = new ArrayList<>();
               
               for(int i=0; i<list.size(); i++) {
                  
                  if (list.get(i).getUser1().equals(loginId)) {
                     sysNameList.add(pdao.getSysName(list.get(i).getUser2()));
                  } else {
                     sysNameList.add(pdao.getSysName(list.get(i).getUser1()));
                  }
                  
               }
               
               // ldao.getRecentMsg에서 출력되는 첫 번째값을 배열에 담는다.
               List<ChatDTO> list2 = new ArrayList<>();
               
               // user1 / user2 받아와서 
               for (ChatListDTO c : list) {
                  String user1 = c.getUser1();
                  String user2 = c.getUser2();

                  ChatDTO result = dao.getRecentMsg(user1, user2, loginId);

                  list2.add(result);
               }

               request.setAttribute("seq", seq);
               request.setAttribute("loginId", loginId);
               //request.setAttribute("chatRoomExist", chatRoomExist);
               
               request.setAttribute("list", list);
               request.setAttribute("sysNameList", sysNameList);
               request.setAttribute("list2",list2);
               request.getRequestDispatcher("/chat/evalchatList.jsp").forward(request, response);
               
            // ~님이 평가하셨습니다 라는 메세지를 판매자가 구매자에게 보내줌
            }else if(uri.equals("/sendLink.chat")) {
               String sender=(String)request.getSession().getAttribute("loginId");
               String receiver=(String)request.getSession().getAttribute("buyerId");

               char quotes = '"'; 

//               String contents="<a href="+quotes+"/idtoss2.member?id="+sender+quotes+">"+sender+"님이 신뢰도를 평가하셨습니다 (평가하러가기 click)</a>";
               
               String contents="&lt;"+sender+"님의 거래후기평가가 도착했습니다!&gt; "+"<a href="+quotes+"/idtoss2.member?id="+sender+quotes+" class=msgLink>평가하러가기!</a>";
               int result=dao.insertlink(sender, receiver, contents);
               
               response.sendRedirect("/chatRoom.chat?loginId="+sender);
               
            //구매자가 평가를 완료하면    ~님이 평가하셨습니다 라는 메세지를 db에서 지워줌->대화창에서 둘다 안보임
            }else if(uri.equals("/linkRemove.chat")) {
               String invisibleto=request.getParameter("invisibleto");
               
               
               System.out.println("linkRemove.chat에 invisibleto 왔나? : "+invisibleto);
               int result = dao.deleteLink(invisibleto);
               
               response.sendRedirect("/index.jsp");
               
            }
            //윤태추가 끝





      } catch(Exception e) {
         e.printStackTrace();
         response.sendRedirect("error.html");
      }


   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}