package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDTO;

public class MemberDAO {

	private static MemberDAO instance = null;
	
	public synchronized static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}
	
	// 회원등록
	public int insert(MemberDTO dto) throws Exception {
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, default, ?, ?)";
		
		try (
		Connection con = getConnection();
		PreparedStatement stat = con.prepareStatement(sql); ){
		stat.setString(1, dto.getId());
		stat.setString(2, dto.getPw());
		stat.setString(3, dto.getName());
		stat.setString(4, dto.getPhone());
		stat.setString(5, dto.getEmail());
		stat.setString(6, dto.getZipcode());
		stat.setString(7, dto.getRoadAddress());
		stat.setString(8, dto.getJibunAddress());
		stat.setString(9, dto.getSpecAddress());
		stat.setString(10, dto.getPersonalAnswer());
		stat.setInt(11, dto.getReliability());
		
		int result = stat.executeUpdate();
		con.commit();
		
		return result; }
	}
	
	// 아이디 중복검사
	public boolean duplCheck(String id) throws Exception {
		String sql = "select * from member where id=?";
		
		try (
		Connection con = getConnection();
		PreparedStatement stat = con.prepareStatement(sql); ){
		stat.setString(1, id);
		try (
		ResultSet rs = stat.executeQuery(); ){
		
		return rs.next(); }}
	}
	
	// 로그인
	public boolean isLoginOk(String id, String pw) throws Exception {
		String sql = "select * from member where id=? and pw=?";
		
		try (
		Connection con = getConnection();
		PreparedStatement stat = con.prepareStatement(sql); ){
		stat.setString(1, id);
		stat.setString(2, pw);
		try (
		ResultSet rs = stat.executeQuery(); ){
		
		return rs.next(); }}
	}
	
	// 회원탈퇴
	public int memberOut(String id) throws Exception {
		String sql = "delete from member where id=?";
		
		try (
		Connection con = getConnection();
		PreparedStatement stat = con.prepareStatement(sql); ){
		stat.setString(1, id);
		int result = stat.executeUpdate();
		con.commit();
		
		return result; }
	}
	
	// 마이페이지
	public MemberDTO myPage(String id) throws Exception {
		String sql = "select * from member where id=?";
		
		try(Connection con = getConnection();
		PreparedStatement stat = con.prepareStatement(sql);){
		stat.setString(1, id);
		
		try(ResultSet rs = stat.executeQuery();){
		rs.next();
		
		MemberDTO dto = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
						rs.getString(8), rs.getString(9), rs.getTimestamp(10),
						rs.getString(11), rs.getInt(12));
		
		return dto;
		}
		}
	}
	
	// 개인정보수정
	public int update(MemberDTO dto) throws Exception {
		String sql = "update member set phone=?, email=?, zipcode=?, roadAddress=?, jibunAddress=?, specAddress=?, personalAnswer=? where id=?";
		
		try (
		Connection con = getConnection();
		PreparedStatement stat = con.prepareStatement(sql); ){
		stat.setString(1, dto.getPhone());
		stat.setString(2, dto.getEmail());
		stat.setString(3, dto.getZipcode());
		stat.setString(4, dto.getRoadAddress());
		stat.setString(5, dto.getJibunAddress());
		stat.setString(6, dto.getSpecAddress());
		stat.setString(7, dto.getPersonalAnswer());
		stat.setString(8, dto.getId());
		int result = stat.executeUpdate();
		
		con.commit();
		return result; }
	}
	
	//email id 찾기 하나
	public String findIdEmail(String name, String email) throws Exception{
		String id = null;
		String sql = "select id from member where name=? and email=?";

		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, name);
			pstat.setString(2, email);
			try(ResultSet rs = pstat.executeQuery()){
				
				if(rs.next()) {
					id = rs.getString("id");
				}
				return id;
			}
		}
	}

	//phone로 id 찾기 하나
	public String findIdPhone(String name, String phone) throws Exception{
		String id = null;
		String sql = "select id from member where name=? and phone=?";

		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, name);
			pstat.setString(2, phone);
			try(ResultSet rs = pstat.executeQuery()){
				
				if(rs.next()) {
					id = rs.getString("id");
				}
				return id;
			}

		}
	}
	
	//pw 개인질문 답 확인 하나
	public String isPWExist(String id, String personalanswer) throws Exception{
		String id2 = null;
		String sql = "select id from member where id=? and personalanswer=?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			
			pstat.setString(1, id);
			pstat.setString(2, personalanswer);
			try(ResultSet rs = pstat.executeQuery()){
				
				if(rs.next()) {
					id2 = rs.getString("id");
				}
				return id2;
			}
	
		}
	}
	
	//pw 재설정 하나
	public int pwUpdate(String id, String pw) throws Exception{
		String sql = "update member set pw=? where id=? ";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			
			pstat.setString(1, pw);
			pstat.setString(2, id);
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	// 윤태추가 - 신뢰도 업데이트
	   public int updatereliability(int reliability,String id) throws Exception {
	         String sql = "update member set reliability=reliability+? where id=?";
	         
	         try (
	         Connection con = getConnection();
	         PreparedStatement stat = con.prepareStatement(sql); ){
	         stat.setInt(1, reliability);
	         stat.setString(2, id);
	         
	         int result = stat.executeUpdate();
	         
	         con.commit();
	         return result; }
	         
	      }
	   
	  // 등급
	   public int getReliablity(String id) throws Exception {
	         String sql = "select reliability from member where id=?";
	         
	         try(Connection con = this.getConnection();
	               PreparedStatement pstat = con.prepareStatement(sql);){
	               pstat.setString(1, id);
	               
	               try(ResultSet rs = pstat.executeQuery();){
	                  
	                  rs.next();
	                  return rs.getInt(1);
	               }
	               
	            }
	      }
}