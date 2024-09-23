package com.mvp.semi.cs.inquiry.model.dao;

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

import com.mvp.semi.common.model.vo.Attachment;
import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.cs.inquiry.model.vo.Inquiry;


public class InquiryDao {
	
	private Properties prop = new Properties();
	
	public InquiryDao() {
		try {
			prop.loadFromXML(new FileInputStream(InquiryDao.class.getResource("/db/mappers/inquiry-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectInquiryListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInquiryListCount");
		
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

	public List<Inquiry> selectInquiryList(Connection conn, PageInfo pi) {
		List<Inquiry> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInquiryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Inquiry(rset.getInt("inquiry_no")
								  , rset.getString("inquiry_title")
								  , rset.getString("inquiry_content")
								  , rset.getDate("regist_date")
								  , rset.getString("user_id")
								  , rset.getString("reply_content")
								  , rset.getString("user_nickname")
								  , rset.getDate("reply_date")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public Inquiry selectInquiry(Connection conn, int boardNo) {
		return i;
	}

	public Attachment selectAttachment(Connection conn, int boardNo) {
		return null;
	}

}
