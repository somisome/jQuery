package kr.or.ddit.buyer.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapException;
import kr.or.ddit.buyer.vo.BuyerVO;

public interface BuyerDao {
	
	public List<BuyerVO> getNameList() throws SqlMapException;
	
	public BuyerVO getBuyer(String buyer_id) throws SqlMapException;
	
	
}
