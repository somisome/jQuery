package kr.or.ddit.zip.dao;


import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.SqlMapClientFactory;
import kr.or.ddit.vo.ZipVO;

public class ZipDaoImpl implements ZipDao {
	
	
	
	private static ZipDao dao = new ZipDaoImpl();
	
	private SqlMapClient client;
	
	private ZipDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ZipDao getInstance(){
		return (dao==null) ? dao = new ZipDaoImpl() : dao;
	}
	
	
	
	
	
	@Override
	public List<ZipVO> zipSearch(String dong) throws SQLException {
		return client.queryForList("member.zipSearch", dong);
	}


	@Override
	public List<ZipVO> zipSido() throws SQLException {
		return client.queryForList("member.zipSido");
	}

	@Override
	public List<ZipVO> zipGugun(String gugun) throws SQLException {
		return client.queryForList("member.zipGugun", gugun);
	}

	@Override
	public List<ZipVO> zipDong(String dong) throws SQLException {
		return client.queryForList("member.zipDong", dong);
	}

	@Override
	public List<ZipVO> zipDetail(String detail) throws SQLException {
		return client.queryForList("member.zipDetail", detail);
	}


}
