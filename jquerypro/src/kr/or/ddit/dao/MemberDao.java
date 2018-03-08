package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ZipVO;

public interface MemberDao {
	/**
	 * sqlMapClient의 member.memberList 쿼리 질의 통해 모든회원(회원정보)의 리스트를 취득
	 * @return client.queryForList("member.memberList") 모든 회원의 MemberVO로 이루어진 List
	 */
	public List<MemberVO> getMemberList() throws SQLException;
	
	//id중복검사
	public MemberVO idCheck(String id) throws SQLException;
	
	//우편번호검색
	public List<ZipVO> zipSearch(String dong) throws SQLException;
	
	//가입하기
	public String insertMember(MemberVO member) throws SQLException;
	
	
}
