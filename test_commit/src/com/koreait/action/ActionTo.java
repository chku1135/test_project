package com.koreait.action;

public class ActionTo {
	//어디로 이동할 것인지
	private String path;
	//true : redirect 방식 / false : forward 방식
	private boolean isRedirect;
	
	//ex) path : "joinview.jsp" / isRedirect : false
	//		--> joinview로 forward 방식으로 전송
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
