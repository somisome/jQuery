package kr.or.ddit.buyer.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapException;

import kr.or.ddit.buyer.dao.BuyerDao;
import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.vo.BuyerVO;


public class BuyerServiceImpl implements BuyerService {
	
	private static BuyerService service = new BuyerServiceImpl();
	private BuyerDao dao;
	private BuyerServiceImpl(){
		dao = BuyerDaoImpl.getInstance();
	}
	public static BuyerService getInstance() {
		return (service ==null)? service=new BuyerServiceImpl() : service;
	}
	@Override
	public List<BuyerVO> getNameList() throws SqlMapException {
		System.out.println(dao.getNameList().get(2).getBuyer_name());
		return dao.getNameList();
	}
	@Override
	public BuyerVO getBuyer(String buyer_id) throws SqlMapException {
		return dao.getBuyer(buyer_id);
	}
	
	
	
}
