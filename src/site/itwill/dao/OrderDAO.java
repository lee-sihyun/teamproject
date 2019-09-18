package site.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.itwill.dto.OrderDTO;

public class OrderDAO extends JdbcDAO {
	private static OrderDAO _dao;
	
	private OrderDAO() {
		
	}
	
	static {
		_dao=new OrderDAO();
	}
	
	public static OrderDAO getOrderDAO() {
		return _dao;
	}
	
	//�ֹ� ���
	//�ֹ������� ���޹޾� ORDER_TABLE ���̺� �������� �����ϴ� �޼ҵ�
	public int insertOrder(OrderDTO order) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="insert into order_table values(?,?,?,?,?,?,?,?,?,sysdate,?,?,?)";
			pstmt=con.prepareStatement(sql);			
			pstmt.setString(1, order.getOrderNo());	
			pstmt.setString(2, order.getId());	
			pstmt.setString(3, order.getName());
			pstmt.setString(4, order.getPostcode());
			pstmt.setString(5, order.getAddress1());
			pstmt.setString(6, order.getAddress2());
			pstmt.setString(7, order.getPhone());
			pstmt.setString(8, order.getMessage());
			pstmt.setString(9, order.getPayChoice());
			pstmt.setInt(10, 1);
			pstmt.setInt(11, 1);
			pstmt.setInt(12, order.getProductSum());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����] insertOrder() �޼ҵ� ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	//�������������� �ֱ� �ֹ� ���� �� �ֹ���ȣ�� ������ ������ �ֹ� ������
	
	//(����������) ORDER_TABLE ���� �ֹ� ������ ������ 1.�ֹ�������  2.���������  3.�������� �� �˻��ϴ� �޼ҵ�
	// => 1,2,3 ���� ��ü�˻� �޼ҵ� ȣ�� �� GETTER �޼ҵ�� �Ϻθ� ��������
	public OrderDTO getOrder(String orderNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		OrderDTO order=null;
		
		try {
			con=getConnection();
			
			String sql="select * from order_table where order_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, orderNo);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				//����Ŭ MEMBET ���̺��� �÷����� "_"�� ����ϱ� ������ ī��ǥ����� �ƴ� _�� ����ؾ� ��
				order=new OrderDTO();
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_Date"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setProductSum(rs.getInt("product_sum"));
			}
			
		} catch (SQLException e) {
			System.out.println("[����] getOrder() �޼ҵ� ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return order;
	}
	
	//
	
	//�ֹ���ȣ�� �ֹ����¸� ���޹޾� ORDER_TABLE ���̺� ����� ȸ������ �� �ֹ� ���¸� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int modifyOrderStatus(String orderNo, int orderStatus) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update order_table set order_status=? where order_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,orderNo);
			pstmt.setInt(2, orderStatus);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����] modifyOrderStatus() �޼ҵ� ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�ֹ���ȣ�� ��ۻ��¸� ���޹޾� ORDER_TABLE ���̺� ����� ȸ������ �� ��ۻ��¸� �����ϰ� ������ ������ ��ȯ�޾� ����ϴ� �޼ҵ�
	public int modifyDeilveryStatus(String orderNo, int deliveryStatus) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update order_table set delivery_status=? where order_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,orderNo);
			pstmt.setInt(2, deliveryStatus);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����] modifyDeilveryStatus() �޼ҵ� ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//������������ ����� �ֹ� ���
	//ORDER_TABLE ���� ��ü �ֹ�(�ֹ� ���)�� ������ ��ȯ�ϴ� �޼ҵ�
	//���� : �ֱ� �ֹ���¥ �������
	/*
	 * public List<OrderDTO> getOrderList(String orderNo) { Connection con=null;
	 * PreparedStatement pstmt=null; ResultSet rs=null; List<OrderDTO> orderList=new
	 * ArrayList<OrderDTO>();
	 * 
	 * try { con=getConnection();
	 * 
	 * String
	 * sql="select * from order_table where order_no=? order by order_date desc";
	 * pstmt=con.prepareStatement(sql); pstmt.setString(1, orderNo);
	 * 
	 * rs=pstmt.executeQuery();
	 * 
	 * while(rs.next()) { OrderDTO order=new OrderDTO(); orderList.add(order); } }
	 * catch (SQLException e) {
	 * System.out.println("[����] getOrderList() �޼ҵ� ���� = "+e.getMessage()); } return
	 * orderList;
	 * 
	 * }
	 */

	//��ü�ֹ���� ����� ���� �޼ҵ� ����- �����ڿ�
	public List<OrderDTO> getOrderList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from order_table order by order_date  desc";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				
				/*
				�̸�          ��?       ����           
				----------- -------- ------------ 
				ORDER_NO        NOT NULL VARCHAR2(30)  
				ID              NOT NULL VARCHAR2(20)  
				NAME            NOT NULL VARCHAR2(20)  
				POSTCODE        NOT NULL VARCHAR2(30)  
				ADDRESS1        NOT NULL VARCHAR2(400) 
				ADDRESS2        NOT NULL VARCHAR2(400) 
				PHONE           NOT NULL NUMBER(20)    
				MESSAGE                  VARCHAR2(50)  
				PAY_CHOICE      NOT NULL VARCHAR2(20)  
				ORDER_DATE      NOT NULL DATE          		: SYSDATE
				ORDER_STATUS    NOT NULL NUMBER(10)    		: 1 = �Ϸ� / 2 = ȯ�ҿ�û / 3 = ȯ�ҿϷ� / 4=��ȯ��û / 5=��ȯ�Ϸ�
				DELIVERY_STATUS NOT NULL NUMBER(10) 		: 1 = ����� / 2 = ����� / 3 = ��ۿϷ�
				*/   
				
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
		
			}
		} catch (SQLException e) {
			System.out.println("[����]getOrderList() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	//���������� �ֹ���� ��� �޼ҵ�
	public List<OrderDTO> getOrderList2(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
				
			String sql="select * from order_table where id=? order by order_date desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
			}
		} catch (SQLException e) {
			System.out.println("[����]getOrderList() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}

	
	
	
	//��ǰ���¸� �����Ͽ�  ��۰��� ó�� ����
	
	//��ۻ��¿� ���� �޼ҵ� �޼ҵ�ȣ��
	public List<OrderDTO> getStaus1(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from order_table where delivery_status=1  order by order_date  desc ";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				
				/*
				�̸�          ��?       ����           
				----------- -------- ------------ 
				ORDER_NO        NOT NULL VARCHAR2(30)  
				ID              NOT NULL VARCHAR2(20)  
				NAME            NOT NULL VARCHAR2(20)  
				POSTCODE        NOT NULL VARCHAR2(30)  
				ADDRESS1        NOT NULL VARCHAR2(400) 
				ADDRESS2        NOT NULL VARCHAR2(400) 
				PHONE           NOT NULL NUMBER(20)    
				MESSAGE                  VARCHAR2(50)  
				PAY_CHOICE      NOT NULL VARCHAR2(20)  
				ORDER_DATE      NOT NULL DATE          		: SYSDATE
				ORDER_STATUS    NOT NULL NUMBER(10)    		:  1 = �Ϸ� / 2 = ȯ�ҿ�û / 3 = ȯ�ҿϷ� / 4=��ȯ��û / 5=��ȯ�Ϸ�
				DELIVERY_STATUS NOT NULL NUMBER(10) 		: 1 = ����� / 2 = ����� / 3 = ��ۿϷ�
				*/   
				
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
		
			}
		} catch (SQLException e) {
			System.out.println("[����]getStaus1() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	public List<OrderDTO> getStaus2(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from order_table where delivery_status=2  order by order_date  desc ";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				
				/*
				�̸�          ��?       ����           
				----------- -------- ------------ 
				ORDER_NO        NOT NULL VARCHAR2(30)  
				ID              NOT NULL VARCHAR2(20)  
				NAME            NOT NULL VARCHAR2(20)  
				POSTCODE        NOT NULL VARCHAR2(30)  
				ADDRESS1        NOT NULL VARCHAR2(400) 
				ADDRESS2        NOT NULL VARCHAR2(400) 
				PHONE           NOT NULL NUMBER(20)    
				MESSAGE                  VARCHAR2(50)  
				PAY_CHOICE      NOT NULL VARCHAR2(20)  
				ORDER_DATE      NOT NULL DATE          		: SYSDATE
				ORDER_STATUS    NOT NULL NUMBER(10)    		:  1 = �Ϸ� / 2 = ȯ�ҿ�û / 3 = ȯ�ҿϷ� / 4=��ȯ��û / 5=��ȯ�Ϸ�
				DELIVERY_STATUS NOT NULL NUMBER(10) 		: 1 = ����� / 2 = ����� / 3 = ��ۿϷ�
				*/   
				
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
		
			}
		} catch (SQLException e) {
			System.out.println("[����]getStaus2() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	public List<OrderDTO> getStaus3(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from order_table where delivery_status=3  order by order_date  desc ";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				
				/*
				�̸�          ��?       ����           
				----------- -------- ------------ 
				ORDER_NO        NOT NULL VARCHAR2(30)  
				ID              NOT NULL VARCHAR2(20)  
				NAME            NOT NULL VARCHAR2(20)  
				POSTCODE        NOT NULL VARCHAR2(30)  
				ADDRESS1        NOT NULL VARCHAR2(400) 
				ADDRESS2        NOT NULL VARCHAR2(400) 
				PHONE           NOT NULL NUMBER(20)    
				MESSAGE                  VARCHAR2(50)  
				PAY_CHOICE      NOT NULL VARCHAR2(20)  
				ORDER_DATE      NOT NULL DATE          		: SYSDATE
				ORDER_STATUS    NOT NULL NUMBER(10)    		: 1 = �Ϸ� / 2 = ȯ�ҿ�û / 3 = ȯ�ҿϷ� / 4=��ȯ��û / 5=��ȯ�Ϸ�
				DELIVERY_STATUS NOT NULL NUMBER(10) 		: 1 = ����� / 2 = ����� / 3 = ��ۿϷ�
				*/   
				
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
		
			}
		} catch (SQLException e) {
			System.out.println("[����]getStaus3() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	//ȯ�ҿ�û��ǰ�� ȯ��ó�� �Ϸ�  ��� ���
	public List<OrderDTO> getRefund(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from order_table where order_status=2 or order_status=3   order by order_status ";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				
				/*
				�̸�          ��?       ����           
				----------- -------- ------------ 
				ORDER_NO        NOT NULL VARCHAR2(30)  
				ID              NOT NULL VARCHAR2(20)  
				NAME            NOT NULL VARCHAR2(20)  
				POSTCODE        NOT NULL VARCHAR2(30)  
				ADDRESS1        NOT NULL VARCHAR2(400) 
				ADDRESS2        NOT NULL VARCHAR2(400) 
				PHONE           NOT NULL NUMBER(20)    
				MESSAGE                  VARCHAR2(50)  
				PAY_CHOICE      NOT NULL VARCHAR2(20)  
				ORDER_DATE      NOT NULL DATE          		: SYSDATE
				ORDER_STATUS    NOT NULL NUMBER(10)    		:  1 = �Ϸ� / 2 = ȯ�ҿ�û / 3 = ȯ�ҿϷ� / 4=��ȯ��û / 5=��ȯ�Ϸ�
				DELIVERY_STATUS NOT NULL NUMBER(10) 		: 1 = ����� / 2 = ����� / 3 = ��ۿϷ�
				*/   
				
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
		
			}
		} catch (SQLException e) {
			System.out.println("[����]getRefund() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	//2����û 3 ȯ�ҿϷ�-������������
	public List<OrderDTO> getRefundCompelete(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from order_table where order_status=3   order by order_status ";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				
				/*
				�̸�          ��?       ����           
				----------- -------- ------------ 
				ORDER_NO        NOT NULL VARCHAR2(30)  
				ID              NOT NULL VARCHAR2(20)  
				NAME            NOT NULL VARCHAR2(20)  
				POSTCODE        NOT NULL VARCHAR2(30)  
				ADDRESS1        NOT NULL VARCHAR2(400) 
				ADDRESS2        NOT NULL VARCHAR2(400) 
				PHONE           NOT NULL NUMBER(20)    
				MESSAGE                  VARCHAR2(50)  
				PAY_CHOICE      NOT NULL VARCHAR2(20)  
				ORDER_DATE      NOT NULL DATE          		: SYSDATE
				ORDER_STATUS    NOT NULL NUMBER(10)    		:  1 = �Ϸ� / 2 = ȯ�ҿ�û / 3 = ȯ�ҿϷ� / 4=��ȯ��û / 5=��ȯ�Ϸ�
				DELIVERY_STATUS NOT NULL NUMBER(10) 		: 1 = ����� / 2 = ����� / 3 = ��ۿϷ�
				*/   
				
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
		
			}
		} catch (SQLException e) {
			System.out.println("[����]getRefund() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	//ȯ�ҿ�û���� - ������������ (������)
	public List<OrderDTO> getRefundRequire(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from order_table where order_status=2  order by order_status ";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				
				/*
				�̸�          ��?       ����           
				----------- -------- ------------ 
				ORDER_NO        NOT NULL VARCHAR2(30)  
				ID              NOT NULL VARCHAR2(20)  
				NAME            NOT NULL VARCHAR2(20)  
				POSTCODE        NOT NULL VARCHAR2(30)  
				ADDRESS1        NOT NULL VARCHAR2(400) 
				ADDRESS2        NOT NULL VARCHAR2(400) 
				PHONE           NOT NULL NUMBER(20)    
				MESSAGE                  VARCHAR2(50)  
				PAY_CHOICE      NOT NULL VARCHAR2(20)  
				ORDER_DATE      NOT NULL DATE          		: SYSDATE
				ORDER_STATUS    NOT NULL NUMBER(10)    		:  1 = �Ϸ� / 2 = ȯ�ҿ�û / 3 = ȯ�ҿϷ� / 4=��ȯ��û / 5=��ȯ�Ϸ�
				DELIVERY_STATUS NOT NULL NUMBER(10) 		: 1 = ����� / 2 = ����� / 3 = ��ۿϷ�
				*/   
				
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
		
			}
		} catch (SQLException e) {
			System.out.println("[����]getRefund() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	
	
	
	//��ȯ��û  ��ȯ�Ϸ� ���� ��� ���
	public List<OrderDTO> getExchange(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from order_table where order_status=4 or order_status=5 order by order_status ";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				
				/*
				�̸�          ��?       ����           
				----------- -------- ------------ 
				ORDER_NO        NOT NULL VARCHAR2(30)  
				ID              NOT NULL VARCHAR2(20)  
				NAME            NOT NULL VARCHAR2(20)  
				POSTCODE        NOT NULL VARCHAR2(30)  
				ADDRESS1        NOT NULL VARCHAR2(400) 
				ADDRESS2        NOT NULL VARCHAR2(400) 
				PHONE           NOT NULL NUMBER(20)    
				MESSAGE                  VARCHAR2(50)  
				PAY_CHOICE      NOT NULL VARCHAR2(20)  
				ORDER_DATE      NOT NULL DATE          		: SYSDATE
				ORDER_STATUS    NOT NULL NUMBER(10)    		: 1 = �Ϸ� / 2 = ��� / 3 = ȯ��
				DELIVERY_STATUS NOT NULL NUMBER(10) 		:  1 = �Ϸ� / 2 = ȯ�ҿ�û / 3 = ȯ�ҿϷ� / 4=��ȯ��û / 5=��ȯ�Ϸ�
				*/   
				
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
		
			}
		} catch (SQLException e) {
			System.out.println("[����]getExchange() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	//������ ������������ ��ȯ��û
	
	public List<OrderDTO> getExchangeRequire (){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from order_table where order_status=4  order by order_status ";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				
				/*
				�̸�          ��?       ����           
				----------- -------- ------------ 
				ORDER_NO        NOT NULL VARCHAR2(30)  
				ID              NOT NULL VARCHAR2(20)  
				NAME            NOT NULL VARCHAR2(20)  
				POSTCODE        NOT NULL VARCHAR2(30)  
				ADDRESS1        NOT NULL VARCHAR2(400) 
				ADDRESS2        NOT NULL VARCHAR2(400) 
				PHONE           NOT NULL NUMBER(20)    
				MESSAGE                  VARCHAR2(50)  
				PAY_CHOICE      NOT NULL VARCHAR2(20)  
				ORDER_DATE      NOT NULL DATE          		: SYSDATE
				ORDER_STATUS    NOT NULL NUMBER(10)    		: 1 = �Ϸ� / 2 = ��� / 3 = ȯ��
				DELIVERY_STATUS NOT NULL NUMBER(10) 		:  1 = �Ϸ� / 2 = ȯ�ҿ�û / 3 = ȯ�ҿϷ� / 4=��ȯ��û / 5=��ȯ�Ϸ�
				*/   
				
				order.setOrderNo(rs.getString("order_no"));
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setPostcode(rs.getString("postcode"));
				order.setAddress1(rs.getString("address1"));
				order.setAddress2(rs.getString("address2"));
				order.setPhone(rs.getString("phone"));
				order.setMessage(rs.getString("message"));
				order.setPayChoice(rs.getString("pay_choice"));
				order.setOrderDate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setDeliveryStatus(rs.getInt("delivery_status"));
				order.setProductSum(rs.getInt("product_sum"));
				orderList.add(order);
		
			}
		} catch (SQLException e) {
			System.out.println("[����]getExchange() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	

	
	//���º��� �޼ҵ� �����->�����
	public int orderDelivery(int orderNo) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update order_table set delivery_status='2' where order_no=? ";
			pstmt=con.prepareStatement(sql);
		
			pstmt.setInt(1,orderNo);
			
			
			rows=pstmt.executeUpdate();
			
			
			
		}catch (SQLException e) {
		System.out.println("[����]orderDelivery()sql ����="+e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
		
	}
	 
	//���º���޼ҵ� �����->��ۿϷ�
	public int orderDelivery2(int orderNo) {
			
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
			
		try {
			con=getConnection();
			
			String sql="update order_table set delivery_status='3' where order_no=? ";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1,orderNo);
				
				
			rows=pstmt.executeUpdate();
				
				
				
		}catch (SQLException e) {
		System.out.println("[����]orderDelivery2()sql ����="+e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
			
	}
		
	//�ֹ����� ���� : �ֹ��Ϸ� >> ȯ�ҿ�û
	public int requestRedund(String orderNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update order_table set order_status='2' where order_no=? ";
			pstmt=con.prepareStatement(sql);
		
			pstmt.setString(1,orderNo);
			
			
			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
		System.out.println("[����]exchange()sql ����="+e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	//�ֹ����� ���� : ȯ�ҿ�û >> ȯ�ҿϷ�
	//ORDER_STATUS    NOT NULL NUMBER(10)  
	public int refund(String orderNo) {	
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update order_table set order_status='3' where order_no=? ";
			pstmt=con.prepareStatement(sql);
		
			pstmt.setString(1,orderNo);
			
			
			rows=pstmt.executeUpdate();
			
			
			
		}catch (SQLException e) {
		System.out.println("[����]refund()sql ����="+e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
		
	}
	
	
	//�ֹ����� ���� : �ֹ��Ϸ� >> ��ȯ��û
	public int requestExchange(String orderNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update order_table set order_status='4' where order_no=? ";
			pstmt=con.prepareStatement(sql);
		
			pstmt.setString(1,orderNo);
			
			
			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
		System.out.println("[����]exchange()sql ����="+e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	//�ֹ����� ���� : ��ȯ��û >> ��ȯ�Ϸ�
	public int exchange(String orderNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update order_table set order_status='5' where order_no=? ";
			pstmt=con.prepareStatement(sql);
		
			pstmt.setString(1,orderNo);
			
			
			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
		System.out.println("[����]exchange()sql ����="+e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
	
		
	//������ó��
	public List<OrderDTO> getOrderList(int startRow, int endRow, String search, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDTO> orderList = new ArrayList<OrderDTO>(); 
		try {
			con = getConnection();
	
			if (keyword.equals("")) {
				String sql = "select * from (select rownum rn, temp.* from (select * from order order by order_no desc) temp) where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql = "select * from (select rownum rn, temp.* from (select * from notice where " + search
						+ " like '%'||?||'%'  order by order_no desc) temp) where rn between ? and ?";
	
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
	
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
	
				OrderDTO order = new OrderDTO();
					order.setOrderNo(rs.getString("order_no"));
					order.setId(rs.getString("id"));
					order.setName(rs.getString("name"));
					order.setPostcode(rs.getString("postcode"));
					order.setAddress1(rs.getString("address1"));
					order.setAddress2(rs.getString("address2"));
					order.setPhone(rs.getString("phone"));
					order.setMessage(rs.getString("message"));
					order.setPayChoice(rs.getString("pay_choice"));
					order.setOrderDate(rs.getString("order_date"));
					order.setOrderStatus(rs.getInt("order_status"));
					order.setDeliveryStatus(rs.getInt("delivery_status"));
					order.setProductSum(rs.getInt("product_sum"));
					orderList.add(order);
			
	
			}
	
		} catch (SQLException e) {
			System.out.println("[����]getOrderList()sql ����="+e.getMessage());
			// TODO: handle exception
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	
	}

	//ORDER_SEQ �������� �ڵ� �������� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public int getOrderNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		
		try {
			con=getConnection();
			
			String sql="select order_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[����]getOrderNum() �޼ҵ��� SQL ���� = "+e.getMessage()); 			
		} finally {
			close(con, pstmt, rs);
		}
		return num;
	}
	
	
	//�ֹ� ������ ��ȯ�ϴ� �޼ҵ�
	public int getOrderAmount(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		
		try {
			con=getConnection();
			
			String sql="select count(*) from order_table where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[����]orderAmount() �޼ҵ��� SQL ���� = "+e.getMessage()); 			
		} finally {
			close(con, pstmt, rs);
		}
		return num;
	}

}










