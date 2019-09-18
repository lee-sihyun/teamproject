package site.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.itwill.dto.OrderDetailDTO;

public class OrderDetailDAO extends JdbcDAO {
	private static OrderDetailDAO _dao;
	
	public OrderDetailDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new OrderDetailDAO();
	}
	
	public static OrderDetailDAO getOrderDAO() {
		return _dao;
	}
	
	//ORDER_DETAIL 테이블에서 주문상세 정보를 가져와 반환하는 메소드
	//한개의 주문번호에도 상품이 여러개 있을 수 있으니 반환타입을 리스트로?
	public List<OrderDetailDTO> getOrderDetail(String id, String orderNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDetailDTO> orderDetail=new ArrayList<OrderDetailDTO>();
		
		try {
			con=getConnection();
			
			String sql="select * from order_detail where id=? and order_no=? order by item_no";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, orderNo);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDetailDTO detail=new OrderDetailDTO();
				detail.setDetailNo(rs.getInt("detail_no"));
				detail.setId(rs.getString("id"));
				detail.setOrderNo(rs.getString("order_no"));
				detail.setItemNo(rs.getInt("item_no"));
				detail.setTotalPrice(rs.getInt("total_price"));
				detail.setVolume(rs.getInt("volume"));
				detail.setOrderDate(rs.getString("order_date"));
				orderDetail.add(detail);
			}
		} catch (SQLException e) {
			System.out.println("[에러] getOrderDetail() 메소드 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderDetail;
	}
	
	//ORDER_DETAIL 테이블에서 전체 주문상세 정보를 가져와 반환하는 메소드
	public List<OrderDetailDTO> getOrderDetailList(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDetailDTO> orderDetailList=new ArrayList<OrderDetailDTO>();
		
		try {
			con=getConnection();
			
			String sql="select * from order_detail where id=? order by order_no desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDetailDTO detail=new OrderDetailDTO();
				detail.setDetailNo(rs.getInt("detail_no"));
				detail.setId(rs.getString("id"));
				detail.setOrderNo(rs.getString("order_no"));
				detail.setItemNo(rs.getInt("item_no"));
				detail.setTotalPrice(rs.getInt("total_price"));
				detail.setVolume(rs.getInt("volume"));
				detail.setOrderDate(rs.getString("order_date"));
				orderDetailList.add(detail);
			}
		} catch (SQLException e) {
			System.out.println("[에러] getOrderDetailList() 메소드 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderDetailList;
	}
	
	//장바구니 정보를 전달받아 ORDER_DETAIL 테이블에 저장하고 자징행의 갯수를 반환하는 메소드
	public int addOrderDetail(OrderDetailDTO detail) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="insert into order_detail values(?,?,?,?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, detail.getDetailNo());
			pstmt.setString(2, detail.getId());
			pstmt.setString(3, detail.getOrderNo());
			pstmt.setInt(4, detail.getItemNo());
			pstmt.setInt(5, detail.getTotalPrice());
			pstmt.setInt(6, detail.getVolume());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러] addOrderDetail() 메소드 오류 = "+e.getMessage());			
		}
		return rows;
	}
	
	//ORDER_SEQ 시퀀스의 자동 증가값을 검색하여 반환하는 메소드
		public int getDetailNum() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int num=0;
			
			try {
				con=getConnection();
				
				String sql="select detail_seq.nextval from dual";
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					num=rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("[에러]getDetailNum() 메소드의 SQL 오류 = "+e.getMessage()); 			
			} finally {
				close(con, pstmt, rs);
			}
			return num;
		}
}



















