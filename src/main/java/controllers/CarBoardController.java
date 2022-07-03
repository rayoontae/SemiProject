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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CarBoardDAO;
import dao.CarFileDAO;
import dao.CarReplyDAO;
import dto.CarBoardDTO;
import dto.CarFileDTO;
import dto.CarReplyDTO;


@WebServlet("*.carBoard")
public class CarBoardController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		
		String uri = request.getRequestURI();
		CarBoardDAO carboarddao = CarBoardDAO.getInstance();
		CarFileDAO filedao = CarFileDAO.getInstance();
		CarReplyDAO replydao=CarReplyDAO.getInstance();
		
		
		try {
			if(uri.equals("/list.carBoard")) {
				
				String loginId = (String)request.getSession().getAttribute("loginId");
				
				int cpage=Integer.parseInt(request.getParameter("cpage"));
				
				
				HttpSession session = request.getSession();
				session.setAttribute("cpage", cpage);
				
				List<CarBoardDTO> list = carboarddao.selectByPage(cpage);
				String pageNavi=carboarddao.getPageNavi(cpage);
				
				request.setAttribute("loginId", loginId);
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.getRequestDispatcher("/carBoard/boardList.jsp").forward(request, response);
				
			}else if(uri.equals("/write.carBoard")) {
				response.sendRedirect("/carBoard/boardForm.jsp");
				
			}else if(uri.equals("/writeProc.carBoard")) {
				String writer = (String)request.getSession().getAttribute("loginId");
				
				String savaPath = request.getServletContext().getRealPath("file"); //파일이 저장되는 경로를 정해준다.files는 폴더명

				File filePath = new File(savaPath);
				
				if (!filePath.exists()) { // 파일 업로드 할 폴더가 존재하지 않는다면 새로 생성.exists는 파일이 존재하는지 안하는지 확인
					filePath.mkdir();    // 존재하지 않으면 파일 생성
				}
				
				int maxSize = 1024 * 1024 * 10;
				
				MultipartRequest multi = new MultipartRequest(request, savaPath, maxSize, "UTF8",new DefaultFileRenamePolicy());
				
				String title = multi.getParameter("title");
				String contents = multi.getParameter("contents");
				
				int parentSeq=carboarddao.getSeqNextVal();
				Enumeration<String> e =multi.getFileNames();
				
				while(e.hasMoreElements()) {
					String name=e.nextElement();
//					System.out.println(name);
					
					if(name==null) {
						break;
					}else if(name.equals("file")) {
						continue;
					}
					
					String oriName = multi.getOriginalFileName(name); // 이거는 index.jsp 에 있는 name="file" 을 의미한다
					String sysName = multi.getFilesystemName(name);   //여러 파일을 올리고 싶으면 여기 file 이라고 써져있는걸 파일마다 다 다르게 써줘야 한다.
					
					if(oriName==null && sysName==null) {
		               oriName="ori";
		               sysName="sys";
		            }
					
					filedao.insert(new CarFileDTO(0, parentSeq,oriName, sysName));
				}		
				
				carboarddao.insert(new CarBoardDTO(parentSeq,title,contents,writer,0,null));
				
				response.sendRedirect("/list.carBoard?cpage=1");
				
			}else if(uri.equals("/detail.carBoard")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				CarBoardDTO dto = carboarddao.selectBySeq(seq);
				int result=carboarddao.updateViewCount(seq); //조회수 증가
				
				List<CarReplyDTO> replylist = new ArrayList<>();
				replylist=replydao.selectreply(seq);
				
				// 다현 추가 >> 디테일 페이지 접속 후 파일 리스트가 존재할 때만 버튼이 생성되도록 하기 위해서 코드 추가
				List<CarFileDTO> filelist = new ArrayList<>();
				filelist = filedao.selectall(seq);
				request.setAttribute("filelist", filelist);
				
				request.setAttribute("replylist", replylist);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/carBoard/boardDetail.jsp").forward(request, response);
				
			}else if(uri.equals("/delete.carBoard")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int result = carboarddao.deleteBySeq(seq);
				response.sendRedirect("/list.carBoard?cpage=1");
				
			}else if(uri.equals("/update.carBoard")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				
				int result = carboarddao.updateBySeq(seq, title,contents);
				
				response.sendRedirect("/detail.carBoard?seq="+seq);
				
			}else if(uri.equals("/searchtitle.carBoard")) {
	            String searchtitle = request.getParameter("searchtitle");
	            int searchboardcount = carboarddao.getRecordTotalSearchCount(searchtitle);
	            
	            
	            HttpSession session = request.getSession();
	            
	            int cpage = 1;
	            
	            
	            String pageSearchNavi=carboarddao.getSearchPageNavi(cpage,searchboardcount);
	            
	            List<CarBoardDTO> list = carboarddao.selectSearchByPage(cpage,searchtitle);
	            
	            
	            request.setAttribute("list", list);
	            request.setAttribute("navi", pageSearchNavi);
	            request.getRequestDispatcher("/carBoard/boardList.jsp").forward(request, response);
	            
	         }

			
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
			return;
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
