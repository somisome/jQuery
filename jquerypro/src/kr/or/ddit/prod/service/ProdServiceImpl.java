package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.dao.ProdDao;
import kr.or.ddit.prod.dao.ProdDaoImpl;
import kr.or.ddit.prod.vo.ProdVO;

import com.ibatis.sqlmap.client.SqlMapException;

public class ProdServiceImpl implements ProdService {
	
	
	private static ProdService service = new ProdServiceImpl();
	
	private ProdDao dao;

	private ProdServiceImpl(){
		dao = ProdDaoImpl.getInstance();
	}
	
	public static ProdService getInstance() {
		return (service ==null)? service=new ProdServiceImpl() : service;
	}
	

	@Override
	public List<ProdVO> getProdList(String lprod_gu) throws SqlMapException {
		return dao.getProdList(lprod_gu);
	}

	@Override
	public ProdVO getProdDetail(String prod_id) throws SqlMapException {
		return dao.getProdDetail(prod_id);
	}
	
}
