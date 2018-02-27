package kr.or.ddit.ibatis;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
/**
 * @Class Name :SqlMapClientFactory.java
 * @Description : SqlMapConfig.xml을 읽어와 client 정의
 * @Modification Information
 * @author 윤소미
 * @since  2018.02.21.
 * @version 1.0
 * @see 
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일    	    수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.21.  윤소미          최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public class SqlMapClientFactory {
	
	private static SqlMapClient client;
	
	
	static{
		Charset charSet = Charset.forName("UTF-8");
		Resources.setCharset(charSet);
		try {
			Reader reader = Resources.getResourceAsReader("kr/or/ddit/ibatis/SqlMapConfig.xml");
			client = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public static SqlMapClient getSqlMapClient(){
		return client;
	}
	
	
}
