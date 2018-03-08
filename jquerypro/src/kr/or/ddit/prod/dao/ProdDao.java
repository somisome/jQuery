package kr.or.ddit.prod.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapException;

import kr.or.ddit.prod.vo.ProdVO;

public interface ProdDao {
	public List<ProdVO> getProdList(String lprod_gu) throws SqlMapException;
	public ProdVO getProdDetail(String prod_id) throws SqlMapException;
	
}
