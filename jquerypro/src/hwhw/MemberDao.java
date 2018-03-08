package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/**
 * @Class Name : IMemberDao.java
 * @Description : DB에 접근하기위한 DAO인터페이스
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
public interface MemberDao {
	/**
	 * 회원 정보 리스트 가져오기 위한 Dao 인터페이스
	 * @param java.util.List
	 * @throws java.sql.SQLException
	 */
	public List<MemberVO> getMemberList() throws SQLException;
	
	/**
	 * id중복검사를 위한 Dao 인터페이스
	 * @param java.util.List
	 * @throws java.sql.SQLException
	 */
	public MemberVO idCheck(String mem_id) throws SQLException;
	
	/**
	 * 우편번호 검색을 위한 Dao 인터페이스
	 * @param java.util.List
	 * @throws java.sql.SQLException
	 */
	public List<ZipVO> zipSearch(String dong) throws SQLException;
	
	/**
	 * 회원 가입을 위한 Dao 인터페이스
	 * @param java.util.List
	 * @throws java.sql.SQLException
	 */
	public String insertMember(MemberVO member) throws SQLException;
	
	//시도
	public List<ZipVO> zipSido() throws SQLException;

	//구군
	public List<ZipVO> zipGugun(String gugun) throws SQLException;
	
	//동
	public List<ZipVO> zipDong(String dong) throws SQLException;
	
	//주소 디테일
	public List<ZipVO> zipDetail(String detail) throws SQLException;
	
}
