package kr.or.ddit.zip.service;


import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.ZipVO;
import kr.or.ddit.zip.dao.ZipDao;
import kr.or.ddit.zip.dao.ZipDaoImpl;

public class ZipServiceImpl implements ZipService {
	
	
	private static ZipService service = new ZipServiceImpl();
	
	private ZipDao dao;
	
	private ZipServiceImpl(){
		dao = ZipDaoImpl.getInstance();
	}
	
	public static ZipService getInstance(){
		return (service==null) ? service = new ZipServiceImpl() : service;
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
