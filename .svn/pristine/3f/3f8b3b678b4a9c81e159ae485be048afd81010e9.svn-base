<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.itwill.dao.pageDAO"%>
<%@page import="site.itwill.dao.OrderDAO"%>
<%@page import="site.itwill.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
	<%
	List<OrderDTO> orderList1 = OrderDAO.getOrderDAO().getStaus1();
	List<OrderDTO> orderList2 = OrderDAO.getOrderDAO().getStaus2();
	List<OrderDTO> orderList3 = OrderDAO.getOrderDAO().getStaus3();
	
	List<OrderDTO> orderList4 = OrderDAO.getOrderDAO().getRefund();
	List<OrderDTO> orderList5 = OrderDAO.getOrderDAO().getExchange();
	
	
	List<OrderDTO> orderList = OrderDAO.getOrderDAO().getOrderList();
	
	//환불요청상태- 상태 2
	List<OrderDTO> RefundReqire=OrderDAO.getOrderDAO().getRefundRequire();

	//환불완료상태 - 상태 3
	List<OrderDTO> RefundCompelete=OrderDAO.getOrderDAO().getRefundCompelete();

	//교환요청 상태 -상태 4
	List<OrderDTO> ExchangeRequire=OrderDAO.getOrderDAO().getExchangeRequire();

	
	
	
	int stock=ProductDAO.getDAO().Stock();
	int totalPrice=pageDAO.getDAO().totalPrice();
	int refundPrice=pageDAO.getDAO().totalRefundPrice();
	
	%>
	
<jsp:include page="/admin/header.jsp" />
<style type="text/css">
#content {
	width: 1280px;
	padding: 0 40px 40px 40px;
	box-sizing: border-box;
	vertical-align: top;
}

#dashboardArea {
	width: 1280px;
	height: 942.266px;
}

.mTitle {
	width: 1280px;
	height: 22.422px;
	position: relative;
	margin: 40px 0px 14px 0px;
}

.mTitle h2 {
	display: inline-block;
	height: 22px;
	padding: 0 5px 0 0;
	font-size: 16px;
	line-height: 18px;
	color: #2e3039;
	font-weight: normal;
	vertical-align: middle;
}

.gridSet {
	width: 1280px;
	height: 147px;
	display: flex;
	flex-wrap: wrap;
}

.mDashSales {
	width: 1280px;
	height: 147px;
	display: flex;
	background: #fff;
	border-radius: 2px;
	box-shadow: 0px 2px 1px 0px rgba(205, 211, 222, 1);
	transition: .2s ease-out;
}
/*주문*/
.mDashSales .item {
	width: 206.672px;
	height: 60px;
	padding: 42px 40px 45px 180px;
	position: relative;
	flex: 1;
	display: block;
	height: 147px;
	color: #2e3039;
	box-sizing: border-box;
	transition: .3s ease-out;
	border: 1px solid #c9cfe0;;
}

.mDashSales .item .data {
	display: block;
	margin: 10px 0 0;
	line-height: 1;
}

.mDashStatus {
	flex: 1;
	text-align: center;
	background: #fff;
	border-radius: 2px;
	box-shadow: 0px 2px 1px 0px rgba(205, 211, 222, 1);
	transition: .2s ease-out;
	    border: 1px solid #c9cfe0;
}

.mDashStatus
:not
 
(
:last-child
 
)
{
margin-right
:
 
20
px
;


}
.mDashStatus .item {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: center;
	min-height: 147px;
	padding: 36px 0;
	box-sizing: border-box;
	
	
}

.mDashStatus .title {
	order: 3;
	display: block;
	width: 100%;
	margin: 15px 0 0;
	font-size: 16px;
	color: #5ea5fe;
	font-weight: normal; . mDashSales .item .data { display : block;
	margin: 10px 0 0;
	line-height: 1;
}
</style>

<div id="content">
	<div class="dashboardArea" id="dashboardArea">
		<div class="mTitle">
			<h2>매출 현황</h2>

		</div>
		<div class="mDashSales">

			<a  class="item order"> <img  src="image/choices.png">
					<span id="orderCount" class="count"></span>
			<strong class="title">
			</strong> <span class="data"> <strong id="orderPrice" class="value"></strong>
					<span class="unit">주문&nbsp;&nbsp;&nbsp;<%=orderList.size() %>건</span>
			</span>
			
			</a> 
			<a class="item payment"> <img  src="image/money.png"><strong class="title">
					<span id="payedCount" class="count"></span>
			</strong> 
			<span class="data"> 매출&nbsp;&nbsp;&nbsp;<%= DecimalFormat.getCurrencyInstance().format(totalPrice)%>
			<strong id="payedPrice" class="value"></strong>
				
			</span>
			</a> 
			
			
			
			<a  class="item refund"> <img  src="image/refund.png"> <strong class="title">
				
			</strong> 
				<span id="refundCount" class="count">
					</span>
					
					
						<span class="data"> &nbsp;&nbsp;&nbsp;환불완료&nbsp;&nbsp;&nbsp;<%=RefundCompelete.size() %>건
			<strong id="payedPrice" class="value"></strong>
			<%= DecimalFormat.getCurrencyInstance().format(refundPrice)%>
				
			</span>
			</a>





		</div>
		<div class="mTitle">
			<h2>주문현황</h2>
		</div>
		<div class="gridSet">

			<!--  -->
			<div class="mDashStatus order">
				<a
					href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery"
					id="no_pay_cnt" class="item"> <img  src="image/boxes.png">
					<span class="count"></span>
					<strong class="title">배송전&nbsp;&nbsp;&nbsp;<%=orderList1.size() %>건</strong>

				</a>
			</div>
			<div class="mDashStatus order">
				<a
					href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery2"
					class="item" id="is_shipped_f"><img  src="image/free-delivery.png">
					
					
					<span class="count"></span>
					<strong class="title">배송중&nbsp;&nbsp;&nbsp;<%=orderList2.size() %>건</strong>
					
					
					
					 </a>
			</div>
			<div class="mDashStatus order">
				<a
					href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery3"
					class="item" id="is_shipped_w"> <img  src="image/delivery-man.png">
					<span class="count"></span>
					
					<strong class="title">배송완료&nbsp;&nbsp;&nbsp;<%=orderList3.size() %>건
				</strong> 
				</a>
			</div>

		</div>
		<div class="mTitle">
			<h2>오늘 확인 사항</h2>
			<span class="dec"></span>
		</div>
		<div class="gridSet">

			<div class="mDashStatus cs">
				<a
					href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=refund"
					id="cancel_count" class="item"> <img  src="image/refund.png">
					<span class="count"></span>
				
						<span class="title">환불요청 &nbsp;&nbsp;&nbsp; <%=RefundReqire.size() %>건 </span>
				</a>
				
			</div>


			<div class="mDashStatus cs">
				<a
					href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=exchange"
					id="before_refund" class="item"> <img  src="image/return.png">
					<span class="count"></span>
					<span class="title">교환요청&nbsp;&nbsp;&nbsp; <%=ExchangeRequire.size() %>건</span>
				</a>
			</div>
			<div class="mDashStatus cs">
				<a
					href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=product&work=product_list"
					id="before_refund" class="item"> <img  src="image/stock.png">
					<span class="count"></span>
					<span class="title">재고관리대상&nbsp;&nbsp;&nbsp; <%=stock %>건</span>
				</a>
			</div>


					


		</div>

	</div>


</div>



</div>
<!-- container 영역종료 -->
</div>
</body>
</html>