package com.mvp.semi.cs.faq.model.dao;

import static com.mvp.semi.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.cs.faq.model.vo.FaQ;
import com.mvp.semi.cs.notice.model.dao.NoticeDao;



public class FaQDao {
	
	private Properties prop = new Properties();
	
	public FaQDao() {
		try {
			prop.loadFromXML(new FileInputStream(FaQDao.class.getResource("/db/mappers/faq-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public int selectFaQListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaQListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}


	public List<FaQ> selectFaQList(Connection conn, PageInfo pi) {
		List<FaQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaQList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FaQ(rset.getInt("faq_no")
								  , rset.getString("faq_title")
								  , rset.getString("faq_content")
								  , rset.getDate("regist_date")
								  , rset.getString("user_id")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public FaQ selectFaQByNo(Connection conn, int faqNo) {
		FaQ n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaQByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new FaQ();
				n.setFaqNo(rset.getInt("faq_no"));
				n.setFaqTitle(rset.getString("faq_title"));
				n.setFaqContent(rset.getString("faq_content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}


	public int updateFaQ(Connection conn, FaQ f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			pstmt.setInt(3, f.getFaqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteFaQ(Connection conn, int faqNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFaQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
