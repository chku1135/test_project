package com.koreait.app.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.BoardDAO;
import com.koreait.dao.FileDAO;
import com.koreait.dao.FileDTO;

public class BoardRemoveAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		BoardDAO bdao = new BoardDAO();
		FileDAO fdao = new FileDAO();
		
		String saveFolder = req.getServletContext().getRealPath("file");
		
		List<FileDTO> files = fdao.getFiles(boardnum);
		if(bdao.removeBoard(boardnum)) {
			for(int i=0;i<files.size();i++) {
				File file = new File(saveFolder,files.get(i).getSystemname());
				if(file.exists()) {
					file.delete();
					fdao.deleteByName(files.get(i).getSystemname());
				}
			}
			
			transfer.setPath(req.getContextPath()+"/board/boardlist.bo");
		}
		else {
			transfer.setPath(req.getContextPath()+"/board/boardview.bo?boardnum="+boardnum);
		}
		return transfer;
	}
}




