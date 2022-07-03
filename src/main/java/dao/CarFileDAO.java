package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CarFileDTO;

public class CarFileDAO {

private static CarFileDAO instance=null;
	
	public synchronized static CarFileDAO getInstance() {
		if(instance==null) {
			instance = new CarFileDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}
	
	
	
	

	public int insert(CarFileDTO dto) throws Exception {
		String sql = "insert into car_file values(car_file_seq.nextval, ?,?,?)";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, dto.getParentSeq());
			pstat.setString(2, dto.getOriName());
			pstat.setString(3, dto.getSysName());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<CarFileDTO> selectall(int parentseq) throws Exception {
		String sql = "select * from car_file where parentseq=? and oriName!=? and sysName!=?";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, parentseq);
			pstat.setString(2, "ori");
	        pstat.setString(3, "sys");
			
			try(ResultSet rs = pstat.executeQuery();){
				List<CarFileDTO> list = new ArrayList<>();
				while(rs.next()) {
					CarFileDTO dto = new CarFileDTO();
					dto.setSeq(rs.getInt("seq"));					
					dto.setParentSeq(rs.getInt("parentSeq"));
					dto.setOriName(rs.getString("oriName"));
					dto.setSysName(rs.getString("sysName"));

					list.add(dto);
				}
				return list;
			}
			
		}		
	}
	
}
