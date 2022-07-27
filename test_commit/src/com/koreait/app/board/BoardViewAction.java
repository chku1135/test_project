package com.koreait.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;
import com.koreait.dao.BoardDTO;
import com.koreait.dao.FileDAO;
import com.koreait.dao.UserDTO;

public class BoardViewAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//select, forward, boardview.jsp, BoardDTO
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		BoardDAO bdao = new BoardDAO();
		String loginUser = (String)req.getSession().getAttribute("loginUser");
		
		BoardDTO board = bdao.getDetail(boardnum);
		
		if(!board.getUserid().equals(loginUser)) {
			board.setReadcount(board.getReadcount()+1);
			bdao.updateReadCount(boardnum);
		}
		
		FileDAO fdao = new FileDAO();
		
		req.setAttribute("board", board);
		req.setAttribute("files", fdao.getFiles(boardnum));
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/boardview.jsp");
		return transfer;
	}
}
