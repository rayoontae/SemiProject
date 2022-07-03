package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ProfileImageDTO;

public class ProfileImageDAO {

	private static ProfileImageDAO instance = null;

	public synchronized static ProfileImageDAO getInstance() {
		if(instance == null) {
			instance = new ProfileImageDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	public int insertImg(ProfileImageDTO dto) throws Exception{
		String sql = "insert into profile_image values(profile_image_seq.nextval, ?,?,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, dto.getParentId());
			pstat.setString(2, dto.getOriName());
			pstat.setString(3, dto.getSysName());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public String getSysName(String parentId) throws Exception {
		String sysName = null;
		String sql="select sysName from profile_image where parentId=? order by seq desc";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, parentId);
			try(ResultSet rs = pstat.executeQuery()){
				
				if(rs.next()) {
					sysName=rs.getString("sysName");
				}
				return sysName;
			}
		}
	}
	
//	public String getSysName(String parentId) throws Exception {
//	      String sql = "select sysName from profile_image where parentId=?";
//	      
//	      try (
//	      Connection con = getConnection();
//	      PreparedStatement stat = con.prepareStatement(sql); ){
//	      stat.setString(1, parentId);
//	      try (
//	      ResultSet rs = stat.executeQuery(); ){
//	      rs.next();
//	      
//	      return rs.getString(1); }}
//	   }
}