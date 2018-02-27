package kr.or.ddit.lprod.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.ibatis.SqlMapClientFactory;
import kr.or.ddit.lprod.vo.LprodVO;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapException;

public class LprodDaoImpl implements LprodDao {
	
	private SqlMapClient client;
	private static LprodDao dao = new LprodDaoImpl();
	
	private LprodDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}

	public static LprodDao getInstance() {
		return (dao == null)? dao = new LprodDaoImpl() : dao;
	}
	
	@Override
	public List<LprodVO> getLprodList() throws SqlMapException {
		List<LprodVO> lprodList = null;
		try {
			lprodList=client.queryForList("lprod.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lprodList;
	}	
	
	
	
}
