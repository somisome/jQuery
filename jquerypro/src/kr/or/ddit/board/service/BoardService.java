package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;

public interface BoardService {
	
	//전체 리스트
		public List<BoardVO> selectAll();
		
	//해당 페이지 리스트
	public List<BoardVO> selectPage(Map<String, Object> map);
	
	//전체글 개수 가져오기
	public int getListCount();
	
	//저장하기
	public int insertBoard(BoardVO vo);
	
	
	//수정
	public int updateBoard(BoardVO vo);
	
	//삭제
	public int deleteBoard(int seq);
	
	//상세보기 - 수정하기 할 때 해당 seq의 번째의 내용
	public BoardVO detailView(int seq);
}
