package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.ibatis.SqlMapClientFactory;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapException;

public class BuyerDaoImpl implements BuyerDao {
	
	private SqlMapClient client;
	private static BuyerDao dao = new BuyerDaoImpl();
	
	private BuyerDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}

	public static BuyerDao getInstance() {
		return (dao == null)? dao = new BuyerDaoImpl() : dao;
	}

	@Override
	public List<BuyerVO> getNameList() throws SqlMapException {
		List<BuyerVO> buyerList = null;
		try {
			buyerList= client.queryForList("buyer.getNameList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyerList;
	}

	@Override
	public BuyerVO getBuyer(String buyer_id) throws SqlMapException {
		BuyerVO buyer=null;
		try {
			buyer= (BuyerVO) client.queryForObject("buyer.getBuyerDetail",buyer_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyer;
	}
	
	
}
