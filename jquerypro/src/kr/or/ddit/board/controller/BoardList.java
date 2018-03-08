package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.vo.BoardVO;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/BoardList")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page = Integer.parseInt(request.getParameter("cpage"));
		
		BoardService service = BoardServiceImpl.getInstance();
		
//		List<BoardVO> list = service.selectAll();
		// 페이지당 글개수 처리
		int totalCount = service.getListCount(); //전체 글 개수
		int perList = 5; //한페이지당 글 개수
		
//		int totalPage = totalCount / perList;
//		totalPage = totalCount % perList >= 0 ? totalPage++ : totalPage;
		
		int totalPage = (int)(Math.ceil((double)totalCount / perList));
		
		//현재페이지에 의한 start와 end를 구한다.
		int start = (page-1) * perList + 1;
		int end = start + perList - 1;
		
		//값을 map에 저장한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		//service.selectPage()메소드를 호출한다.
		List<BoardVO> list = service.selectPage(map);
		
		
		//결과값 list로 json타입의 응답데이터를 생성
		//jsp로 위임해서 생성 - forword로 이동
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		
		RequestDispatcher disp = request.getRequestDispatcher("/0307/list.jsp");
		disp.forward(request, response);
		
		
	}
}
