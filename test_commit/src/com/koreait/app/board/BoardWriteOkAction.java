package com.koreait.app.board;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;
import com.koreait.dao.BoardDTO;
import com.koreait.dao.FileDAO;
import com.koreait.dao.FileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//cos : http://www.servlets.com
		
		//파일이 저장될 경로
		String saveFolder = req.getServletContext().getRealPath("file");
		System.out.println(saveFolder);
		
		//저장될 파일의 최대 크기(5MB)
		int size = 1024*1024*5;
		
		//cos 라이브러리 이용														기본파일 이름변경 정책
		MultipartRequest multi = new MultipartRequest(req,saveFolder,size,"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck1 = false;
		boolean fcheck2 = false;
		
		//input[type=file] 태그의 name을 써주면 시스템상 이름을 받아올 수 있음
		String systemname1 = multi.getFilesystemName("file1");
		if(systemname1 == null) {
			fcheck1 = true;
		}
		//input[type=file] 태그의 name을 써주면 사용자가 업로드할 당시의 이름을 받아올 수 있음
		String orgname1 = multi.getOriginalFileName("file1");
		
		//두번째 파일도 똑같이 진행
		String systemname2 = multi.getFilesystemName("file2");
		if(systemname2 == null) {
			fcheck2 = true;
		}
		String orgname2 = multi.getOriginalFileName("file2");
		
		String boardtitle = multi.getParameter("boardtitle");
		String boardcontents = multi.getParameter("boardcontents");
		String userid = multi.getParameter("userid");
		
		BoardDTO board = new BoardDTO();
		board.setBoardtitle(boardtitle);
		board.setBoardcontents(boardcontents);
		board.setUserid(userid);
		
		int boardnum = 0;
		
		BoardDAO bdao = new BoardDAO();
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		if(bdao.insertBoard(board)) {
			FileDAO fdao = new FileDAO();
			boardnum = bdao.getLastNum(userid);
			if(!fcheck1) {
				FileDTO file = new FileDTO();
				file.setSystemname(systemname1);
				file.setOrgname(orgname1);
				file.setBoardnum(boardnum);
				
				fcheck1 = fdao.insertFile(file);
			}
			if(!fcheck2) {
				FileDTO file = new FileDTO();
				file.setSystemname(systemname2);
				file.setOrgname(orgname2);
				file.setBoardnum(boardnum);
				
				fcheck2 = fdao.insertFile(file);
			}
			//fcheck1, fcheck2가 true라는 뜻은
			//1. 원래 파일이 존재하지 않았음
			//2. 파일이 존재했고, 위의 DB처리까지 완벽하게 성공했음
			if(fcheck1 && fcheck2) {
				transfer.setPath(req.getContextPath()+"/board/boardview.bo?page=1&boardnum="+boardnum);
			}
			else {
				//DB에 추가했던 게시글 데이터 다시 삭제
				transfer.setPath(req.getContextPath()+"/board/boardlist.bo");
				Cookie cookie = new Cookie("w", "f");
				resp.addCookie(cookie);
			}
		}
		else {
			transfer.setPath(req.getContextPath()+"/board/boardlist.bo");
			Cookie cookie = new Cookie("w", "f");
			resp.addCookie(cookie);
		}
		return transfer;
	}
}






