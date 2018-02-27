package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.vo.BuyerVO;

import com.ibatis.sqlmap.client.SqlMapException;

public interface BuyerService {

	public List<BuyerVO> getNameList() throws SqlMapException;
	
	public BuyerVO getBuyer(String buyer_id) throws SqlMapException;

}
