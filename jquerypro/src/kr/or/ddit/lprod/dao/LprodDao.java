package kr.or.ddit.lprod.dao;

import java.util.List;

import kr.or.ddit.lprod.vo.LprodVO;

import com.ibatis.sqlmap.client.SqlMapException;

public interface LprodDao {
	public List<LprodVO> getLprodList() throws SqlMapException;
}
