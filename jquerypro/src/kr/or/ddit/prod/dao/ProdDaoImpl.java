package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.ibatis.SqlMapClientFactory;
import kr.or.ddit.prod.vo.ProdVO;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapException;

public class ProdDaoImpl implements ProdDao {
	
	
	private SqlMapClient client;
	private static ProdDao dao = new ProdDaoImpl();
	
	private ProdDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}

	public static ProdDao getInstance() {
		return (dao == null)? dao = new ProdDaoImpl() : dao;
	}
	
	@Override
	public List<ProdVO> getProdList(String lprod_gu) throws SqlMapException {
		List<ProdVO> list = null;
		try {
			list= client.queryForList("prod.getProdList", lprod_gu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ProdVO getProdDetail(String prod_id) throws SqlMapException {
		ProdVO vo = null;
		try {
			vo= (ProdVO) client.queryForObject("prod.getProdDetail",prod_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
}
