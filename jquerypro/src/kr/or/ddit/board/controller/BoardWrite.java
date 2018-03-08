package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.vo.BoardVO;

/**
 * Servlet implementation class BoardWrite
 */
@WebServlet("/BoardWrite")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 요청시 전송되는 데이터(글쓰기 모달창에서 입력한 값)를 가져온다.
		//제목, 작성자, 내용, 비밀번호 , 이메일  //// ip
		request.setCharacterEncoding("UTF-8");
		BoardVO vo = new BoardVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//DB에 저장하기
		vo.setHit(0);
		vo.setWip(request.getRemoteAddr());
		
		BoardService service = BoardServiceImpl.getInstance();
		int seq = 0;

		seq = service.insertBoard(vo);
	
		
		request.setAttribute("seq", seq);
		RequestDispatcher disp = request.getRequestDispatcher("0307/write.jsp");
		disp.forward(request, response);
		
		
	}

}
