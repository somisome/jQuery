package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.SqlMapClientFactory;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ZipVO;

public class MemberDaoImpl implements MemberDao {
	
	private SqlMapClient client;
	private static MemberDao dao = new MemberDaoImpl();
	
	private MemberDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	/**
	 * 싱글톤을 위한 getInstance()메서드 
	 * @return dao, new MemberDaoImpl()
	 */
	public static MemberDao getInstance() {
		return (dao == null)? dao = new MemberDaoImpl() : dao;
	}	

	/**
	 * sqlMapClient의 member.memberList 쿼리 질의 통해 모든회원(회원정보)의 리스트를 취득
	 * @return client.queryForList("member.memberList") 모든 회원의 MemberVO로 이루어진 List
	 */
	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		return client.queryForList("member.memberList");
	}
	@Override
	public MemberVO idCheck(String data) throws SQLException {
		return (MemberVO) client.queryForObject("member.idCheck",data);
	}
	@Override
	public List<ZipVO> zipSearch(String dong) throws SQLException {
		return client.queryForList("member.zipSearch",dong);
	}
	@Override
	public String insertMember(MemberVO member) throws SQLException {
		return (String) client.insert("member.insertMember",member);
		
	}

}
