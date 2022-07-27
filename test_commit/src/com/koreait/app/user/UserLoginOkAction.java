package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.dao.UserDAO;

public class UserLoginOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("utf-8");
		//MIME 타입
		resp.setContentType("text/html; charset=utf-8");
		
		UserDAO udao = new UserDAO();
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		
		PrintWriter out = resp.getWriter();
//		ActionTo transfer = new ActionTo();
//		transfer.setRedirect(false);
		if(udao.login(userid,userpw)) {
			req.getSession().setAttribute("loginUser", userid);
//			transfer.setPath("/app/board/main.jsp");
			
			out.print("<script>");
			//alert('apple님 어서오세요~!');
			out.print("alert('"+userid+"님 어서오세요~!');");
			//location.href = '???/app/board/main.jsp';
			out.print("location.href = '"+req.getContextPath()+"/board/boardlist.bo';");
			out.print("</script>");
		}
		else {
//			transfer.setPath("/");
			out.print("<script>");
			out.print("location.href = '"+req.getContextPath()+"/';");
			out.print("</script>");
		}
//		return transfer;
		return null;
	}
}

















