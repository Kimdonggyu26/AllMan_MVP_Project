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

	public Inquiry selectInquiry(Connection conn, int inquiryNo) {
		Inquiry i = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inquiryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new Inquiry();
				i.setInquiryNo(rset.getInt("inquiry_no"));
				i.setInquiryTitle(rset.getString("inquiry_title"));
				i.setInquirycontent(rset.getString("inquiry_content"));
				i.setInquiryType(rset.getString("inquiry_type"));
				i.setRegistDate(rset.getDate("regist_date"));
				i.setUserNo(rset.getString("user_id"));
				i.setReplyContent(rset.getString("reply_content"));
				i.setUserNickname(rset.getString("user_nickname"));
				i.setReplyDate(rset.getDate("reply_date"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return i;
	}

	public Attachment selectAttachment(Connection conn, int inquiryNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inquiryNo);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}

	public int deleteInquiry(Connection conn, int iqNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iqNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Inquiry selectInquiryByNo(Connection conn, int iqNo) {
		return null;
	}

	public int updateInquiry(Connection conn, Inquiry i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInquiry");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, i.getInquiryType());
			pstmt.setString(2, i.getInquiryTitle());
			pstmt.setString(3, i.getInquirycontent());
			pstmt.setInt(4, i.getInquiryNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}close(pstmt);
		
		
		return result;
	}

	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3,  at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertNewAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefNo());
			pstmt.setString(2, at.getRefType());
			pstmt.setString(3, at.getOriginName());
			pstmt.setString(4, at.getChangeName());
			pstmt.setString(5, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertInquiry(Connection conn, Inquiry i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getInquiryType());
			pstmt.setString(2, i.getInquiryTitle());
			pstmt.setString(3, i.getInquirycontent());
			pstmt.setString(4, i.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getRefType());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

    public List<Inquiry> selectInquiriesByUser(Connection conn, String userId,PageInfo pi) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Inquiry> inquiries = new ArrayList<>();
        
        // properties 파일에서 쿼리 불러오기
        String sql = prop.getProperty("selectUser");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
            pstmt.setString(1, userId);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);
            rset = pstmt.executeQuery();

            // 결과 처리: Inquiry 객체 리스트에 저장
            while (rset.next()) {
            	inquiries.add(new Inquiry(rset.getInt("INQUIRY_NO"),
                                     rset.getString("INQUIRY_TITLE"),
                                     rset.getDate("REGIST_DATE")));   
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return inquiries;
    }

	public int answerInquiry(Connection conn, Inquiry i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("answerInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getReplyContent());
			pstmt.setString(2, i.getUserNo());
			pstmt.setInt(3, i.getInquiryNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
