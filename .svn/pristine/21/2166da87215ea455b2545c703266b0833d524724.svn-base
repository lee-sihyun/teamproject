<%@page import="java.net.URLEncoder"%>
<%@page import="site.itwill.dto.LushUserDTO"%>
<%@page import="site.itwill.dao.ReviewDAO"%>
<%@page import="site.itwill.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글 번호를 전달받아 Review 테이블에 저장된 게시글을 삭제처리하고 게시글 목록 출력페이지(Review_list.jsp)로 이동하는 JSP 문서 --%>
<%-- => 삭제처리 : Review 테이블의 STATUS 컬럼값 변경 --%>    
<%
	//비정상적인 요청에 대한 응답 처리
	// => 전달값이 존재하지 않을 경우
	if(request.getParameter("num")==null) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=/Review/Review&work=Review_list';");
		out.println("</script>");
		return;
	}
	
	//POST 방식으로 요청되어 전달된 값에 대한 캐릭터셋 변경
	request.setCharacterEncoding("UTF-8");
	
	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");

	
	//게시글 번호를 전달하여 Review 테이블에 저장된 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
	ReviewDTO Review=ReviewDAO.getDAO().getReview(num);
	
	//비정상적인 요청에 대한 응답 처리
	// => 검색된 게시글이 없거나 삭제된 게시글인 경우
	if(Review==null || Review.getStatus()==9) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board/Review&work=Review_list';");
		out.println("</script>");
		return;
	}

	//세션으로 공유된 인증정보를 반환받아 저장
	LushUserDTO loginUser=(LushUserDTO)session.getAttribute("loginUser");
		
	//비정상적인 요청에 대한 응답 처리
	// => 로그인 상태가 아니거나 로그인 사용자가 작성자 또는 관리자가 아닌 경우	
	if(loginUser==null || !loginUser.getId().equals(Review.getId()) && loginUser.getStatus()!=9) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board/Review&work=Review_list';");
		out.println("</script>");
		return;
	}
	
	//게시글 번호를 전달하여 Review 테이블에 저장된 게시글의 삭제처리(게시글 상태 변경)하는 DAO 클래스의 메소드 호출
	ReviewDAO.getDAO().removeReview(num);
	
	//페이지 이동
	response.sendRedirect(request.getContextPath()+"/index.jsp?workgroup=board/Review&work=Review_list&pageNum="+pageNum);
%>
