package com.koreait.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class B extends HttpServlet{

	private static final long serialVersionUID = 1L;
//	입력 -> 데이터전송 -> 수집 -> 처리 -> 결과전송 -> 출력
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		수집
		int num1 = Integer.parseInt(req.getParameter("num1"));
		int num2 = Integer.parseInt(req.getParameter("num2"));
//		처리
		//DB처리//
		
		/////////
		int result = num1+num2;
//		결과전송
		req.setAttribute("result", result);
		req.getRequestDispatcher("c.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}




