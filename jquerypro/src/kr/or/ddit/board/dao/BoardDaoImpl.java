package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.ibatis.SqlMapClientFactory;

import com.ibatis.sqlmap.client.SqlMapClient;

public class BoardDaoImpl implements BoardDao {
	
	private static BoardDao dao = new BoardDaoImpl();
	
	private SqlMapClient client;
	
	private BoardDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static BoardDao getInstance(){
		return (dao==null) ? dao = new BoardDaoImpl() : dao;
	}
	
	@Override
	public List<BoardVO> selectAll() throws SQLException {
		return client.queryForList("board.selectAll");
	}

	@Override
	public List<BoardVO> selectPage(Map<String, Object> map)
			throws SQLException {
		return client.queryForList("board.selectPage", map);
	}

	@Override
	public int getListCount() throws SQLException {
		return (int) client.queryForObject("board.getListCount");
	}

	@Override
	public int insertBoard(BoardVO vo) throws SQLException {
		return (int) client.insert("board.insertBoard", vo);
	}

	@Override
	public int updateBoard(BoardVO vo) throws SQLException {
		return client.update("board.updateBoard",vo);
	}

	@Override
	public int deleteBoard(int seq) throws SQLException {
		return client.delete("board.deleteBoard",seq);
	}

	@Override
	public BoardVO detailView(int seq) throws SQLException {
		return (BoardVO) client.queryForObject("board.detailView",seq);
	}

}
