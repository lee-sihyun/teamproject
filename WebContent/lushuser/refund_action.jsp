<%@page import="site.itwill.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 주문정보의 주문상태를 주문완료에서 환불요청으로 변경하고 주문 상세 내역페이지로 돌아가기 --%>
<%
	String orderNo=request.getParameter("orderNo");

	//주문상태값을 주문완료 >> 환불요청 으로 변경하는 메소드 호출
	OrderDAO.getOrderDAO().requestRedund(orderNo);

	//페이지 이동
	response.sendRedirect(request.getContextPath()+"/index.jsp?workgroup=lushuser&work=order_search");
%>