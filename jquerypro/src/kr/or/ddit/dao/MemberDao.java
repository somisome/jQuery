package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface MemberDao {
	/**
	 * sqlMapClient의 member.memberList 쿼리 질의 통해 모든회원(회원정보)의 리스트를 취득
	 * @return client.queryForList("member.memberList") 모든 회원의 MemberVO로 이루어진 List
	 */
	public List<MemberVO> getMemberList() throws SQLException;

}
