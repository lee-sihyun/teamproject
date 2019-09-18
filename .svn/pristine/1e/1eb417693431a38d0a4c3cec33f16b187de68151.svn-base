<%@page import="site.itwill.dto.LushUserDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="site.itwill.dao.ReviewDAO"%>
<%@page import="site.itwill.dto.ReviewDTO"%>
<%@include file="/security/login_status.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력페이지(Review_modify.jsp)에서 전달된 게시글을 반환받아 Review 테이블에 
저장된 게시글을 변경하고 게시글 상세 출력페이지(Review_detail.jsp)로 이동하는 JSP 문서 --%>
<%
	request.setCharacterEncoding("UTF-8");
	LushUserDTO loginUser1=(LushUserDTO)session.getAttribute("loginUser");
	
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

		
	//전달된 입력값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=URLEncoder.encode(request.getParameter("keyword"),"UTF-8");
	
	//XSS(입력값으로 태그를 입력하는 기술)에 대한 처리
	// => 태그 관련 문자를 Escape 문자로 변환하거나 제거
	/* String subject=Utility.stripTag(request.getParameter("subject")); */
	int status=0;
	String rating=request.getParameter("rating");
	String image=request.getParameter("image");
	String content=request.getParameter("content");
	
	/* String content=Utility.stripTag(request.getParameter("content")); */
	
/* 	
	//태그 제거에 의해 입력값이 없을 경우에 대한 처리
	if(subject==null|| subject.equals("") || content==null || content.equals("")) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	} */
	
	//DTO 인스턴스 생성 후 필드값 변경
	ReviewDTO Review=new ReviewDTO();
	Review.setNum(num);
	Review.setRating(rating);
	Review.setImage(image);
	Review.setStatus(status);
	Review.setContent(content);
	
	//게시글을 전달하여 Review 테이블에 저장된 게시글을 변경하는 DAO 클래스의 메소드 호출
	ReviewDAO.getDAO().modifyReview(Review);
	
	//게시글 상세 출력페이지 이동
	response.sendRedirect(request.getContextPath()+"/site/index.jsp?workgroup=Review&work=Review_detail&num="+num+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword);
%>





