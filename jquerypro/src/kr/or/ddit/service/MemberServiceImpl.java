package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.MemberDao;
import kr.or.ddit.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ZipVO;

public class MemberServiceImpl implements MemberService {

	private static MemberService service = new MemberServiceImpl();
	
	private MemberDao dao;

	private MemberServiceImpl(){
		dao = MemberDaoImpl.getInstance();
	}
	/**
	 * 싱글톤을 위한 getInstance()메서드 
	 * @return service,  new MemberServiceImpl()
	 */
	public static MemberService getInstance() {
		return (service ==null)? service=new MemberServiceImpl() : service;
	}

	/**
	 * MemberDao의 getMemberList()메서드를 통해 모든회원(회원정보)의 리스트를 취득
	 * @return  memberList 모든 회원의 MemberVO로 이루어진 List
	 */
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = null;
		try {
			memberList = dao.getMemberList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}
	@Override
	public MemberVO idCheck(String id) throws SQLException {
		return dao.idCheck(id);
	}
	@Override
	public List<ZipVO> zipSearch(String dong) throws SQLException {
		return dao.zipSearch(dong);
	}
	@Override
	public String insertMember(MemberVO member) throws SQLException {
		return dao.insertMember(member);
	}

}
