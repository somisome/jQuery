package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.SqlMapClientFactory;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/**
 * @Class Name : IMemberDaoImpl.java
 * @Description : DB에 접근하기위한 DAO 인터페이스를 구현한 클래스
 * @Modification Information
 * @author 김우식
 * @since  2018.02.21.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.21.  김우식      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public class MemberDaoImpl implements MemberDao {
	
	private static MemberDao dao = new MemberDaoImpl();
	
	private SqlMapClient client;
	
	private MemberDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static MemberDao getInstance(){
		return (dao == null) ? dao = new MemberDaoImpl() : dao;
	}

	/**
	 * 회원 정보 리스트 가져오기 위한 Dao 메서드
	 * @param java.util.List
	 * @return client.queryForList("member.memberList")
	 * @throws java.sql.SQLException
	 */
	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		return client.queryForList("member.memberList");
	}

	@Override
	public MemberVO idCheck(String mem_id) throws SQLException {
		return (MemberVO) client.queryForObject("member.idCheck", mem_id);
	}

	@Override
	public List<ZipVO> zipSearch(String dong) throws SQLException {
		return client.queryForList("member.zipSearch", dong);
	}

	@Override
	public String insertMember(MemberVO member) throws SQLException {
		return (String) client.insert("member.insertMember", member);
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
