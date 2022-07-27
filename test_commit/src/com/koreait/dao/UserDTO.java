package com.koreait.dao;

public class UserDTO {
	private int useridx;
	private String userid;
	private String userpw;
	private String username;
	private String usergender;
	private String zipcode;
	private String addr;
	private String addrdetail;
	private String addretc;
	private String[] userhobby;
	private String hobbystr;
	
	public int getUseridx() {
		return useridx;
	}
	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getAddretc() {
		return addretc;
	}
	public void setAddretc(String addretc) {
		this.addretc = addretc;
	}
	public String[] getUserhobby() {
		return userhobby;
	}
	public void setUserhobby(String[] userhobby) {
		this.userhobby = userhobby;
		this.hobbystr = String.join(",", userhobby);
	}
	public String getHobbystr() {
		return hobbystr;
	}
}




