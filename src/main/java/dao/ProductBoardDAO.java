package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ProductBoardDTO;

public class ProductBoardDAO {

	private static ProductBoardDAO instance = null;

	public synchronized static ProductBoardDAO getInstance() {
		if(instance == null) {
			instance = new ProductBoardDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	// 게시글 등록
	// 첨부파일 때문에 getParentSeq 메서드를 사용하므로 seq 에 nextval 이 아닌 받아온 값을 넣는 것에 주의한다.
	public int insert(ProductBoardDTO dto) throws Exception {
		String sql = "insert into product_board values(?,?,?,?,?,?,?,?,?,?,default)";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setInt(1, dto.getSeq());
			stat.setString(2, dto.getTitle());
			stat.setString(3, dto.getContents());
			stat.setString(4, dto.getWriter());
			stat.setString(5, dto.getPname());
			stat.setInt(6, dto.getPrice());
			stat.setString(7, dto.getCategory());
			stat.setString(8, dto.getSellingOption());
			stat.setString(9, dto.getStatus());
			stat.setInt(10, dto.getViewCount());
			int result = stat.executeUpdate();
			con.commit();

			return result; }
	}

	// 게시글 등록시에 첨부파일에 parentSeq (게시글의 등록 예정 번호) 을 전달하기 위해 미리 값을 받는 메서드
	public int getParentSeq() throws Exception {
		String sql = "select product_board_seq.nextval from dual";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql);
				ResultSet rs = stat.executeQuery(); ){
			rs.next();

			return rs.getInt(1); }
	}

	// 게시글 목록 출력
	public List<ProductBoardDTO> getBoardList(int currPage) throws Exception {
		String sql = "select * from (select row_number() over(order by seq desc) row_num, product_board.* from product_board) where row_num between ? and ?";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setInt(1, currPage*10-9);
			stat.setInt(2, currPage*10);
			try (
					ResultSet rs = stat.executeQuery(); ){
				List<ProductBoardDTO> list = new ArrayList<>();

				// row_number 가 함께 나오므로 2번부터 입력을 받는다.
				while(rs.next()) {
					list.add(new ProductBoardDTO(rs.getInt(2), rs.getString(3), rs.getString(4),
							rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9),
							rs.getString(10), rs.getInt(11), rs.getTimestamp(12)));
				}

				return list; }}
	}

	// 게시글 키워드 검색 출력
	public List<ProductBoardDTO> getSearchList(int currPage, String keyWord) throws Exception {
		String sql = "select * from (select row_number() over(order by seq desc) row_num, product_board.* from product_board where title like '%' || ? || '%') where row_num between ? and ?";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setString(1, keyWord);
			stat.setInt(2, currPage*10-9);
			stat.setInt(3, currPage*10);
			try (
					ResultSet rs = stat.executeQuery(); ){
				List<ProductBoardDTO> list = new ArrayList<>();

				// row_number 가 함께 나오므로 2번부터 입력을 받는다.
				while(rs.next()) {
					list.add(new ProductBoardDTO(rs.getInt(2), rs.getString(3), rs.getString(4),
							rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9),
							rs.getString(10), rs.getInt(11), rs.getTimestamp(12)));
				}

				return list; }}
	}

	// 게시글 카테고리별 출력
	public List<ProductBoardDTO> getCategoryList(int currPage, String category) throws Exception {
		String sql = "select * from (select row_number() over(order by seq desc) row_num, product_board.* from product_board where category like '%' || ? || '%') where row_num between ? and ?";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setString(1, category);
			stat.setInt(2, currPage*10-9);
			stat.setInt(3, currPage*10);
			try (
					ResultSet rs = stat.executeQuery(); ){
				List<ProductBoardDTO> list = new ArrayList<>();

				// row_number 가 함께 나오므로 2번부터 입력을 받는다.
				while(rs.next()) {
					list.add(new ProductBoardDTO(rs.getInt(2), rs.getString(3), rs.getString(4),
							rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9),
							rs.getString(10), rs.getInt(11), rs.getTimestamp(12)));
				}

				return list; }}
	}

	// 총 네비 페이지 수 얻기
	public int getTotalPage() throws Exception {
		String sql = "select count(*) from product_board";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql);
				ResultSet rs = stat.executeQuery(); ){
			rs.next();

			return (int)(Math.ceil(rs.getInt(1) / 10.0)); }
	}

	// 키워드 검색글 총 네비 페이지 수 얻기
	public int getSearchTotalPage(String keyWord) throws Exception {
		String sql = "select count(*) from product_board where title like '%' || ? || '%'";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setString(1, keyWord);
			try (
					ResultSet rs = stat.executeQuery(); ){
				rs.next();

				return (int)(Math.ceil(rs.getInt(1) / 10.0)); }}
	}

	// 카테고리별 게시글 총 네비 페이지 수 얻기
	public int getCategoryTotalPage(String category) throws Exception {
		String sql = "select count(*) from product_board where category like '%' || ? || '%'";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setString(1, category);
			try (
					ResultSet rs = stat.executeQuery(); ){
				rs.next();

				return (int)(Math.ceil(rs.getInt(1) / 10.0)); }}
	}

	// 게시글 상세내용 출력
	public ProductBoardDTO getBoardDetail(int seq) throws Exception {
		String sql = "select * from product_board where seq=?";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setInt(1, seq);
			try (
					ResultSet rs = stat.executeQuery(); ){
				rs.next();

				ProductBoardDTO dto = new ProductBoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8),
						rs.getString(9), rs.getInt(10), rs.getTimestamp(11));
				return dto; }}
	}

	// 게시글 조회수 증가
	public int updateViewCount(int seq) throws Exception {
		String sql = "update product_board set viewCount = viewCount+1 where seq=?";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setInt(1, seq);
			int result = stat.executeUpdate();
			con.commit();

			return result; }
	}

	// 게시글 삭제
	public int delete(int seq) throws Exception {
		String sql = "delete from product_board where seq=?";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setInt(1, seq);
			int result = stat.executeUpdate();
			con.commit();

			return result; }
	}

	// 게시글 수정
	public int update(ProductBoardDTO dto) throws Exception {
		String sql = "update product_board set title=?, contents=?, pname=?, price=?, category=?, sellingOption=? where seq=?";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setString(1, dto.getTitle());
			stat.setString(2, dto.getContents());
			stat.setString(3, dto.getPname());
			stat.setInt(4, dto.getPrice());
			stat.setString(5, dto.getCategory());
			stat.setString(6, dto.getSellingOption());
			stat.setInt(7, dto.getSeq());
			int result = stat.executeUpdate();
			con.commit();

			return result; }
	}

	// 게시글 거래상태 변경
	public int updateStatus(String Status, int seq) throws Exception {
		String sql = "update product_board set sellingOption=? where seq=?";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setString(1, Status);
			stat.setInt(2, seq);
			int result = stat.executeUpdate();
			con.commit();

			return result; }
	}

	// 무한스크롤 이미지정보 가져오기
	public List<String> getScrollImage() throws Exception {
		String sql = "select sysName from product_image where seq in (select min(seq) from product_image group by parentSeq) order by parentSeq desc";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql);
				ResultSet rs = stat.executeQuery(); ){

			List<String> list = new ArrayList<>();

			while(rs.next()) {
				list.add(rs.getString(1));
			}

			return list; }
	}

	// 무한스크롤 게시글정보 가져오기
	public List<ProductBoardDTO> getBoardAll() throws Exception {
		String sql = "select * from product_board order by seq desc";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();){
			List<ProductBoardDTO> list = new ArrayList<>();

			while(rs.next()) {
				list.add(new ProductBoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8),
						rs.getString(9), rs.getInt(10), rs.getTimestamp(11)));
			}

			return list; }
	}



	// 윤태 - 판매상태 변경
	public int statusChange(String status,int seq) throws Exception {
		String sql="update product_board set status=? where seq=?";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setString(1, status);
			stat.setInt(2, seq);
			int result = stat.executeUpdate();
			con.commit();

			return result;
		}
	}

	// 범준 - 개인상점 상품 dto
	public List<ProductBoardDTO> getMyShopList(String parentId) throws Exception {
		String sql = "select * from product_board where writer=? order by seq desc";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setString(1, parentId);
			try (
					ResultSet rs = stat.executeQuery(); ){

				List<ProductBoardDTO> list = new ArrayList<>();

				while(rs.next()) {
					list.add(new ProductBoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3),
							rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8),
							rs.getString(9), rs.getInt(10), rs.getTimestamp(11)));
				}

				return list; }}
	}

	// 범준 - 개인상점 상품 이미지
	public String getMyShopImage(int parentSeq) throws Exception {
		String sql = "select sysName from product_image where seq in (select min(seq) from product_image where parentSeq=? group by parentSeq) order by parentSeq desc";

		try (
				Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql); ){
			stat.setInt(1, parentSeq);
			try (
					ResultSet rs = stat.executeQuery(); ){

				rs.next();

				return rs.getString(1); }}
	}
	
	// 메인 상품 갯수 띄우기
	public int count() throws Exception{
		String sql = "select count(*) from product_board";
		try(Connection con = getConnection();
				PreparedStatement stat = con.prepareStatement(sql);
				ResultSet rs = stat.executeQuery();){
				
			rs.next();
			return rs.getInt(1);
		}
	}












}