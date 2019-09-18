package site.itwill.dto;

/*
DETAIL_NO   NOT NULL NUMBER(10)   	: PK
ID          NOT NULL VARCHAR2(20) 
ORDER_NO    NOT NULL VARCHAR2(30) 
ITEM_NO     NOT NULL NUMBER(10)   
TOTAL_PRICE NOT NULL NUMBER(30)   
VOLUME      NOT NULL NUMBER(30)   
ORDER_DATE  NOT NULL DATE   
 */
public class OrderDetailDTO {
	private int detailNo;
	private String id;
	private String orderNo;
	private int itemNo;
	private int totalPrice;
	private int volume;
	private String orderDate;
	
	public OrderDetailDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getDetailNo() {
		return detailNo;
	}

	public void setDetailNo(int detailNo) {
		this.detailNo = detailNo;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
}
