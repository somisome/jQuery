package kr.or.ddit.zip.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.ZipVO;

public interface ZipDao {
	//시도
	public List<ZipVO> zipSido() throws SQLException;

	//구군
	public List<ZipVO> zipGugun(String gugun) throws SQLException;
	
	//동
	public List<ZipVO> zipDong(String dong) throws SQLException;
	
	//주소 디테일
	public List<ZipVO> zipDetail(String detail) throws SQLException;

	List<ZipVO> zipSearch(String dong) throws SQLException;
}
