package com.koreait.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class BoardDAO {

	SqlSession sqlsession;
	
	public BoardDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public int getBoardCnt() {
		return sqlsession.selectOne("Board.getBoardCnt");
	}

	public List<BoardDTO> getBoardList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow",startRow);
		datas.put("pageSize",pageSize);
		return sqlsession.selectList("Board.getBoardList",datas);
	}

}







