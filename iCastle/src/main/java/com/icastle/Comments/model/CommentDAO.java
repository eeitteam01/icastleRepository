package com.icastle.Comments.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CommentDAO implements CommentDAO_interface {
	private static final String INS_COMT = "INSERT INTO Comments(orderId,hotelId,email,avgScore,serviceScore,qualityScore,sceneScore,comment,commentTime) VALUES(?,?,?,?,?,?,?,?,?)";
	private static final String SHOW_COMT = "SELECT commentId,orderId,email,avgScore,serviceScore,qualityScore,sceneScore,good,comment,commentTime FROM Comments WHERE orderId = ?";
	private static final String SEL_HOTELID = "SELECT commentId,orderId,hotelId,email,avgScore,serviceScore,qualityScore,sceneScore,good,comment,commentTime,response FROM Comments WHERE hotelId = ? order by commentTime DESC";
	private static final String HOST_RESPONSE = "UPDATE Comments SET response = ?,responseTime = ? WHERE commentId = ?";
//	private static final String SEL_ORDERID = "SELECT response FROM Comments WHERE orderId = ?";
	private static final String UPD_COMT = "UPDATE Comments SET avgScore = ?,serviceScore = ?,qualityScore = ?,sceneScore =?,comment=? where commentId = ?";
	private static final String GOOD_COMT = "UPDATE Comments SET good = ? WHERE commentId = ?";
	private static final String SEL_GOOD = "SELECT orderId FROM Comments WHERE good = ?";
	private static final String SEL_COMTID = "SELECT orderId,email,avgScore,serviceScore,qualityScore,sceneScore,comment,commentTime FROM Comments WHERE commentId = ?";
	private static final String SEL_EMAIL = "SELECT orderId FROM Comments WHERE email = ?";
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs; 
	CommentVO com;
	CommentDAO commt;
	List<CommentVO> comtList = new ArrayList<CommentVO>();
	List<Integer> intList = new ArrayList<Integer>();
	
	
	private static DataSource ds = null;
	static{
		
		try {
			InitialContext context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/iCastleDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public String comtIns(CommentVO comt){

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(INS_COMT);
			stmt.setInt(1,comt.getOrderId());
			stmt.setInt(2,comt.getHotelId());
			stmt.setString(3,comt.getEmail());
			stmt.setDouble(4,(comt.getServiceScore()+comt.getSceneScore()+comt.getQualityScore())/3.0);
			stmt.setInt(5,comt.getServiceScore());
			stmt.setInt(6,comt.getQualityScore());
			stmt.setInt(7,comt.getSceneScore());
			stmt.setString(8,comt.getComment());
			stmt.setDate(9,comt.getCommentTime());
			stmt.executeUpdate();
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try { stmt.close();
			} catch (SQLException e) {e.printStackTrace();}
			try { conn.close();
			} catch (SQLException e) {e.printStackTrace();}
		}
		return "新增成功";
		
	}
	
	public List<CommentVO> hotelComtSearch(Integer hotelId){
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(SEL_HOTELID);
			stmt.setInt(1, hotelId);
			rs = stmt.executeQuery();
			while(rs.next()){
				
			com = new CommentVO();
			com.setCommentId(rs.getInt("commentId"));
			com.setOrderId(rs.getInt("orderId"));
			com.setHotelId(rs.getInt("hotelId"));
			com.setEmail(rs.getString("email"));
			com.setAvgScore(rs.getDouble("avgScore"));
			com.setServiceScore(rs.getInt("serviceScore"));
			com.setQualityScore(rs.getInt("qualityScore"));
			com.setSceneScore(rs.getInt("sceneScore"));
			com.setGood(rs.getInt("good"));
			com.setComment(rs.getString("comment"));
			com.setCommentTime(rs.getDate("commentTime"));
			com.setResponse(rs.getString("response"));
			comtList.add(com);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return comtList;
			
	}
	
	public String response(Integer commentId,java.sql.Date responseTime,String response){
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(HOST_RESPONSE);
			stmt.setString(1,response);
			stmt.setDate(2,responseTime);
			stmt.setInt(3, commentId);
			stmt.executeUpdate();
							
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "回覆成功!";
		
	}
	
	public String comUpdate(CommentVO comt){
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(UPD_COMT);
			stmt.setDouble(1,(comt.getSceneScore()+comt.getQualityScore()+comt.getServiceScore())/3);
            stmt.setInt(2,comt.getServiceScore());
            stmt.setInt(3,comt.getQualityScore());
            stmt.setInt(4,comt.getSceneScore());
            stmt.setString(5,comt.getComment());
            stmt.setDate(6,comt.getCommentTime());
            stmt.setInt(7,comt.getCommentId());
            
            stmt.executeUpdate();
            
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "修改成功";
		
	}
	
	public CommentVO findResponseByCommentId(Integer commentId){
		

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(GOOD_COMT);
			stmt.setInt(1, commentId);
			stmt.executeUpdate();
			
			stmt = conn.prepareStatement(SEL_GOOD);
			stmt.setInt(1,commentId);
			rs = stmt.executeQuery();
			rs.next();
			
			com = new CommentVO();
			com.setGood(rs.getInt("good"));
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return com;
			
	}
	
	public CommentVO findByOrderId(Integer orderId){
		
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(SHOW_COMT);
			stmt.setInt(1,orderId);
			rs = stmt.executeQuery();			
			rs.next();
			
			com = new CommentVO();
			com.setCommentId(rs.getInt("commentId"));
			com.setOrderId(rs.getInt("orderId"));
			com.setEmail(rs.getString("email"));
			com.setAvgScore(rs.getDouble("avgScore"));
			com.setServiceScore(rs.getInt("serviceScore"));
			com.setQualityScore(rs.getInt("qualityScore"));
			com.setSceneScore(rs.getInt("sceneScore"));
			com.setGood(rs.getInt("good"));
			com.setComment(rs.getString("comment"));
			com.setCommentTime(rs.getDate("commentTime"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return com;
		
	}
	
	@Override
	public CommentVO findByCommentId(Integer commentId) {
		try {
		
			conn = ds.getConnection();
			stmt = conn.prepareStatement(SEL_COMTID);
			stmt.setInt(1,commentId);
			rs = stmt.executeQuery();			
			rs.next();
			
			com = new CommentVO();
			com.setOrderId(rs.getInt("orderId"));
			com.setEmail(rs.getString("email"));
			com.setAvgScore(rs.getDouble("avgScore"));
			com.setServiceScore(rs.getInt("serviceScore"));
			com.setQualityScore(rs.getInt("qualityScore"));
			com.setSceneScore(rs.getInt("sceneScore"));
			com.setComment(rs.getString("comment"));
			com.setCommentTime(rs.getDate("commentTime"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// TODO Auto-generated method stub
		return com;
	}
	
	public void pressGood(Integer commentId,Integer good){
		

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(GOOD_COMT);
			stmt.setInt(1, good);
			stmt.setInt(2, commentId);
			stmt.executeUpdate();							
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
	}
	
//	public CommentVO findResponseByOrderId(Integer orderId){
//		
//		try {
//			
//			conn = ds.getConnection();
//			stmt = conn.prepareStatement(SEL_ORDERID);
//			stmt.setInt(1,orderId);
//			rs = stmt.executeQuery();			
//			rs.next();
//			
//			com = new CommentVO();
//			com.setOrderId(rs.getInt("orderId"));
//			com.setResponse(rs.getString("response"));
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			try {
//				conn.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		// TODO Auto-generated method stub
//		return com;
//		
//		
//	}
	
	public List<CommentVO> findByEmail(String email){

		try {
			conn = ds.getConnection();	
			stmt = conn.prepareStatement(SEL_EMAIL);
			stmt.setString(1,email);
			rs = stmt.executeQuery();
			
			while(rs.next()){
			com = new CommentVO();
			com.setOrderId(rs.getInt("orderId"));
			comtList.add(com);
							
			}
						
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return comtList;
	}



	public List<Integer> findByGood(int good){
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(SEL_GOOD);
			stmt.setInt(1,good);
			rs = stmt.executeQuery();			
			while(rs.next()){
				
				intList.add(rs.getInt(good));
				
				
			}
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return intList;
		
    }
	
}









