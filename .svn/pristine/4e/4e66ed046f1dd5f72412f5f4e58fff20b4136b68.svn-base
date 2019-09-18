<%@page import="site.itwill.dto.CartDTO"%>
<%@page import="site.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력페이지(order_write.jsp)에서 전달된 정보들을 반환받아 CART 테이블에서 삭제하고 주문완료 출력페이지(order_confirmed.jsp)로 이동 --%>
<%
	/* //비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	} */

	//POST 방식으로 요청되어 전달된 값들에 대한 캐릭터셋 변경
	request.setCharacterEncoding("UTF-8");

	//삭제하고자 선택된 장바구니번호들을 반환받아 저장
	// => 체크박스로 선택된 동일한 입력태그의 name 속성값들을 배열로 반환
	String[] checkCartNo=(String[])session.getAttribute("checkCartNo");
	
	//장바구니 정보 삭제
	for(String cartNo:checkCartNo) {
		//상태값을 반환받기 위한 장바구니 DTO 생성
		CartDTO cart=CartDAO.getCartDAO().getCartInfo(Integer.parseInt(cartNo));
		
		if(cart.getCartStatus()==1) {
			CartDAO.getCartDAO().deleteCart(Integer.parseInt(cartNo));
			
		} else {
			CartDAO.getCartDAO().deleteZeroCart();
		}
	}
	
	//세션 삭제
	session.removeAttribute("checkCartNo");
		
	//장바구니 목록 출력페이지로 이동
	response.sendRedirect(request.getContextPath()+"/index.jsp?workgroup=order&work=order_confirmed");
%>