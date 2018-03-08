package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDao;
import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	
	private static BoardService service = new BoardServiceImpl();
	
	private BoardDao dao;
	
	private BoardServiceImpl(){
		dao = BoardDaoImpl.getInstance();
	}
	
	public static BoardService getInstance(){
		return (service==null) ? service = new BoardServiceImpl() : service;
	}
	
	@Override
	public List<BoardVO> selectAll() {
		List<BoardVO> boardList = null;
		try {
			boardList = dao.selectAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public List<BoardVO> selectPage(Map<String, Object> map) {
		List<BoardVO> pageList = null;
		try {
			pageList = dao.selectPage(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pageList;
	}

	@Override
	public int getListCount() {
		int index = 0;
		try {
			index = dao.getListCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return index;
	}

	@Override
	public int insertBoard(BoardVO vo){
		int res = 0;
		try {
			res =  dao.insertBoard(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		int res = 0;
		try {
			res= dao.updateBoard(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteBoard(int seq) {
		int res = 0;
		try {
			res= dao.deleteBoard(seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public BoardVO detailView(int seq) {
		BoardVO vo =null;
		try {
			vo= dao.detailView(seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

}
