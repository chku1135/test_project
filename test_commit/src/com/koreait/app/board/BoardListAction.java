package com.koreait.app.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;
import com.koreait.dao.BoardDTO;

public class BoardListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		String temp = req.getParameter("page");
		
		int page = temp == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
		//전체 게시글의 개수
		int totalCnt = bdao.getBoardCnt();
		
		//한 페이지에서 보여줄 게시글의 개수
		int pageSize = 10;
		
		//아래쪽 페이징 처리 부분에 보여질 첫번째 페이지 번호
		int startPage = (page-1)/10*10+1;
		
		//아래쪽 페이징 처리 부분에 보여질 마지막 페이지 번호
		//						  페이징에 10페이지씩 띄울것이기 때문에 +9
		int endPage = startPage + 9;
		
		//전체 개수를 기반으로 한 띄워질 수 있는 가장 마지막 페이지 번호
		int totalPage = (totalCnt-1)/pageSize + 1;
		
		//가장 마지막 페이지 번호(totalPage)보다 연산으로 구해진 endPage가 더 큰 경우도 있다.(허구의 페이지 번호가 존재할 수 있다)
		//그때는 endPage를 가장 마지막 페이지 번호로 바꿔주어야 한다.
		endPage = endPage>totalPage ? totalPage : endPage;
		
		int startRow = (page - 1)*pageSize;
		
		List<BoardDTO> list = bdao.getBoardList(startRow,pageSize);
		
		req.setAttribute("list", list);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("page", page);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/boardlist.jsp");
		return transfer;
	}
}





