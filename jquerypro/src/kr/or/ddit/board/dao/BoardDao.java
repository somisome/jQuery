package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;

public interface BoardDao {
	
	//전체 리스트
	public List<BoardVO> selectAll() throws SQLException; 
	
	//해당 페이지 리스트
	public List<BoardVO> selectPage(Map<String, Object> map) throws SQLException;
	
	//전체글 개수 가져오기
	public int getListCount() throws SQLException;
	
	//저장하기
	public int insertBoard(BoardVO vo) throws SQLException;
	
	//수정
	public int updateBoard(BoardVO vo) throws SQLException;
	
	//삭제
	public int deleteBoard(int seq) throws SQLException;
	
	//상세보기 - 수정하기 할 때 해당 seq의 번째의 내용
	public BoardVO detailView(int seq) throws SQLException;
	
}
