<%@page import="site.itwill.dto.ReviewDTO"%>
<%@page import="site.itwill.dao.ReviewDAO"%>
<%@page import="site.itwill.utill.Utility"%>
<%@page import="site.itwill.dto.LushUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_status.jspf" %>


<%-- 입력페이지(QnA_write.jsp)에서 전달된 게시글(새글 또는 답글)을 반환받아 
QnA 테이블에 저장하고  게시글 목록 출력페이지(QnA_list.jsp)로 이동하는 JSP 문서 --%>
<%
	System.out.println("asdasd");
	request.setCharacterEncoding("UTF-8");
	LushUserDTO loginUser1=(LushUserDTO)session.getAttribute("loginUser");
	
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	System.out.println("asdasd1");
	/* if(request.getParameter("num")==null) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board/Review&work=Review_list';");
		out.println("</script>");
		return; 
	}*/
	System.out.println("asdasd2");
	//전달된 입력값을 반환받아 저장
	String pageNum=request.getParameter("pageNum");
	String rating=request.getParameter("rating");
	System.out.println("별점 확인 : " +rating);
	int status=0;
	String title=request.getParameter("title");
	String content = request.getParameter("content");
	String image = request.getParameter("image");
	System.out.println("내용 확인 : " +content);
	System.out.println("제목 확인 : " +title);
	//Review_SEQ 객체의 자동 증가값을 검색하여 반환하는 DAO 클래스의 메소드 호출
	int num=ReviewDAO.getDAO().getReviewNum();
	System.out.println("확인 : "+num);
	
	//DTO 인스턴스 생성 후 필드값 변경
	ReviewDTO Review=new ReviewDTO();
	Review.setNum(num);//자동 증가값
	Review.setRating(rating);//평점
	Review.setName(title);
	Review.setImage(image);//상품의 고유넘버
	Review.setContent(content);//리뷰 내용
	Review.setId(loginUser1.getId());//로그인 사용자 아이디
	Review.setStatus(status);//일반글 : 0, 삭제글 : 9
	
	//게시글을 전달하여 QnA 테이블에 저장하는 DAO 클래스의 메소드 호출
	ReviewDAO.getDAO().addReview(Review);
		
	System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
	//게시글 목록 출력페이지 이동
	response.sendRedirect(request.getContextPath()+"/index.jsp?workgroup=board/Review&work=Review_list&pageNum="+pageNum);
%>
	