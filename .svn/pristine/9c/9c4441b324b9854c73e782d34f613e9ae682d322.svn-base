<%@page import="site.itwill.dao.OrderDAO"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="site.itwill.dao.OrderDetailDAO"%>
<%@page import="site.itwill.dto.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dto.OrderDTO"%>
<%@page import="site.itwill.dto.LushUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String orderNo=request.getParameter("orderNo");
	OrderDTO order=OrderDAO.getOrderDAO().getOrder(orderNo);

	LushUserDTO loginUser=(LushUserDTO)session.getAttribute("loginUser");
	String id=loginUser.getId();
%>
<form>
<h3>주문/배송 상세</h3>
<div>
<table id="infoTable">
	<tr>
		<th class="name">상품명</th>
		<th class="price">상품금액</th>
		<th class="vol">수량</th>
		<th class="status">주문상태</th>
	</tr>
			<%      //order by item_no
					List<OrderDetailDTO> detailList = OrderDetailDAO.getOrderDAO().getOrderDetail(loginUser.getId(),
							order.getOrderNo());
					ArrayList<Integer> itemNoList = new ArrayList<Integer>();
					for (OrderDetailDTO detail : detailList) {
						int itemNo = detail.getItemNo();
						itemNoList.add(itemNo);
					}

					//order by item_no
					ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
					for (int itemNo : itemNoList) {
						ProductDTO product = ProductDAO.getDAO().getProduct2(itemNo);
						productList.add(product);
			} %>
			
	<% for(int i=1;i<detailList.size();i++) { %>
		<tr>
		<td class="name">
			<div style="width: 256px;">
		   		<img src="<%=request.getContextPath()%>/admin/product_image/<%=productList.get(i).getImage()%>" alt="<%=productList.get(i).getName()%>" style="width: 80px; height: 80px;">
				<input type="text" readonly="readonly" value="<%=productList.get(i).getName()%>" class="tt" style="width: 100px; padding-top: 50px;">
			</div>
		</td>
		<td class="price"></td>
		<td class="vol"></td>
		<td class="status"></td>
		</tr>
	<% } %>
	
</table>
</div>

<h3>주문자 정보</h3>
<div>
<table id="orderTable">
	<tr>
		<th class="name">주문자</th>
		<th class="price">주소</th>
		<th class="vol">휴대폰번호</th>
		<th class="status">이메일</th>
	</tr>
	<tr>
		<td class="name">
		</td>
		<td class="price"><%=order.getName() %></td>
		<td class="vol"><%= %></td>
		<td class="status"><%= %></td>
		</tr>
</table>
</div>

<h3>배송지 정보</h3>
<div>
<table id="deliTable">
	<tr>
		<th class="name">배송자</th>
		<th class="price">주소</th>
		<th class="vol">휴대폰번호</th>
		<th class="status">배송메세지</th>
	</tr>
	<tr>
		<td class="name">
		</td>
		<td class="price"><%=order.getName() %></td>
		<td class="vol">[<%=order.getPostcode() %>]&nbsp;<%=order.getAddress1() %>&nbsp;<%=order.getAddress2() %></td>
		<td class="status"><%=order.getPhone() %></td>
		</tr>
</table>
</div>

<h3>결제 정보</h3>
<div>
<table id="payTable">
	<tr>
		<th class="name">상품 합계 금액</th>
		<th class="price">배송비</th>
		<th class="vol">총 결제금액</th>
		<th class="status">결제수단</th>
	</tr>
	<tr>
		<td class="name">
		</td>
		<td class="price"></td>
		<td class="vol"></td>
		<td class="status"></td>
		</tr>
</table>
</div>
</form>