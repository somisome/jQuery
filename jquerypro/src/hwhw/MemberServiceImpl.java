package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/**
 * @Class Name : IMemberServiceImpl.java
 * @Description : DAO에 접근하기 위한 Service 인터페이스를 구현한 클래스
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
public class MemberServiceImpl implements MemberService {

	private static MemberService service = new MemberServiceImpl();
	private MemberDao dao;
	
	private MemberServiceImpl(){
		dao = MemberDaoImpl.getInstance();
	}
	
	public static MemberService getInstance(){
		return (service == null) ? service = new MemberServiceImpl() : service;
		
//		if(service == null){
//			service = new IMemberServiceImpl();
//		}
//		return service;
	}
	
	/**
	 * Dao를 통해 회원 정보 리스트 가져오기 위한 메서드
	 * @param java.util.List
	 * @return memberList
	 * @throws java.sql.SQLException
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
	public MemberVO idCheck(String mem_id) {
		MemberVO member = null;
		try {
			member = dao.idCheck(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}

	@Override
	public List<ZipVO> zipSearch(String dong) {
		List<ZipVO> zipList = null;
		try {
			zipList = dao.zipSearch(dong);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zipList;
	}

	@Override
	public String insertMember(MemberVO member) {
		String insert = null;
		try {
			insert = dao.insertMember(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insert;
	}

	@Override
	public List<ZipVO> zipSido() {
		List<ZipVO> zipSido = null;
		try {
			zipSido = dao.zipSido();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zipSido;
	}

	@Override
	public List<ZipVO> zipGugun(String gugun) {
		List<ZipVO> zipGugun = null;
		try {
			zipGugun = dao.zipGugun(gugun);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zipGugun;
	}

	@Override
	public List<ZipVO> zipDong(String dong) {
		List<ZipVO> zipDong = null;
		try {
			zipDong = dao.zipDong(dong);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zipDong;
	}

	@Override
	public List<ZipVO> zipDetail(String detail) {
		List<ZipVO> zipDong = null;
		try {
			zipDong = dao.zipDetail(detail);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zipDong;
	}


}
