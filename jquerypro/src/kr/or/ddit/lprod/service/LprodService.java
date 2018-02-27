package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.vo.LprodVO;

import com.ibatis.sqlmap.client.SqlMapException;

public interface LprodService {
	
	public List<LprodVO> getLprodList() throws SqlMapException;
	
}
