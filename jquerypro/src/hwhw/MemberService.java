package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/**
 * @Class Name : IMemberService.java
 * @Description : DAO에 접근하기 위한 Service 인터페이스
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
public interface MemberService {
	
	/**
	 * Dao를 통해 회원 정보 리스트 가져오기 위한 인터페이스
	 * @param java.util.List
	 * @throws java.sql.SQLException
	 */
	public List<MemberVO> getMemberList();
	
	/**
	 * id중복검사를 위한 인터페이스
	 * @param java.util.List
	 * @throws java.sql.SQLException
	 */
	public MemberVO idCheck(String mem_id);
	
	/**
	 * 우편번호 검색을 위한 인터페이스
	 * @param java.util.List
	 * @throws java.sql.SQLException
	 */
	public List<ZipVO> zipSearch(String dong);
	
	/**
	 * 회원 가입을 위한 인터페이스
	 * @param java.util.List
	 * @throws java.sql.SQLException
	 */
	public String insertMember(MemberVO member);
	
	//시도
	public List<ZipVO> zipSido();

	//구군
	public List<ZipVO> zipGugun(String gugun);
	
	//동
	public List<ZipVO> zipDong(String dong);
	
	//주소 디테일
	public List<ZipVO> zipDetail(String detail);
}
