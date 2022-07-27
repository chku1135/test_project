package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;
import com.koreait.dao.UserDTO;

//Controller
public class UserJoinOkAction implements Action{

	//메소드
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//입력 -> 데이터전송 -> [데이터수집 -> 처리 -> 결과전송] -> 출력
		UserDTO user = new UserDTO();
		UserDAO udao = new UserDAO();
		String userid = req.getParameter("userid");
		user.setUserid(userid);
		user.setUserpw(req.getParameter("userpw"));
		user.setUsername(req.getParameter("username"));
		user.setUsergender(req.getParameter("usergender"));
		user.setZipcode(req.getParameter("zipcode"));
		user.setAddr(req.getParameter("addr"));
		user.setAddrdetail(req.getParameter("addrdetail"));
		user.setAddretc(req.getParameter("addretc"));
		user.setUserhobby(req.getParameterValues("userhobby"));
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(udao.join(user)) {
			transfer.setPath(req.getContextPath()+"/user/userlogin.us?userid="+userid);
		}
		else {
			//localhost:9090/????
			transfer.setPath(req.getContextPath());
		}
		
		return transfer;
	}
	
}



