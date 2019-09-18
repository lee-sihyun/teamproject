<%@page import="site.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력페이지(cart_list.jsp)에서 전달된 정보들을 반환받아 CART 테이블에서 삭제하고 장바구니 목록 출력페이지(cart_list.jsp)로 이동 --%>
<%
	//POST 방식으로 요청되어 전달된 값들에 대한 캐릭터셋 변경
	request.setCharacterEncoding("UTF-8");

	//삭제하고자 선택된 장바구니번호들을 반환받아 저장
	// => 체크박스로 선택된 동일한 입력태그의 name 속성값들을 배열로 반환
	String[] checkCartNo=request.getParameterValues("checkCartNo");
	
	//전달된 장바구니 번호에 대한 장바구니 정보 삭제
	for(String cartNo:checkCartNo) {
		//장바구니 번호를 전달하여 CART 테이블에 저장된 장바구니정보를 삭제하는 DAO 클래스의 메소드 호출
		CartDAO.getCartDAO().deleteCart(Integer.parseInt(cartNo));
	}
		
	//장바구니 목록 출력페이지로 이동
	response.sendRedirect(request.getContextPath()+"/index.jsp?workgroup=cart&work=cart_list");
%>