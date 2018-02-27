package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.LprodDao;
import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.vo.LprodVO;

import com.ibatis.sqlmap.client.SqlMapException;

public class LprodServiceImpl implements LprodService {
	
	private static LprodService service = new LprodServiceImpl();
	
	private LprodDao dao;

	private LprodServiceImpl(){
		dao = LprodDaoImpl.getInstance();
	}
	
	public static LprodService getInstance() {
		return (service ==null)? service=new LprodServiceImpl() : service;
	}

	@Override
	public List<LprodVO> getLprodList() throws SqlMapException {
		return dao.getLprodList();
	}

}
