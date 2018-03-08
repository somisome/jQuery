package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

import com.ibatis.sqlmap.client.SqlMapException;

public interface ProdService {
	public List<ProdVO> getProdList(String lprod_gu) throws SqlMapException;
	public ProdVO getProdDetail(String prod_id) throws SqlMapException;
}
