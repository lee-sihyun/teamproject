<%@page import="site.itwill.dao.FAQDAO"%>
<%@page import="site.itwill.dto.FAQDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

if(request.getParameter("num")==null){
	out.println("<script>");
	out.println("location.href='"+request.getContextPath()+"/admin/index.jsp?workgroup=board&work=faq_list';");

	out.println("</script>");
}

request.setCharacterEncoding("UTF-8");

int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
String search=request.getParameter("search");
String keyword=request.getParameter("keyword");


FAQDTO notice=FAQDAO.getDAO().getFAQ(num);

//삭제된 게시글에대한 유효성 검사
if(notice==null){
	out.println("<script>");
	out.println("location.href='"+request.getContextPath()+"/admin/index.jsp?workgroup=board&work=faq_list';");
	out.println("</script>");
}

FAQDAO.getDAO().removeFAQ(num);

response.sendRedirect(request.getContextPath()+"/admin/index.jsp?workgroup=board&work=faq_list&pageNum="+pageNum+"&search="+search+"&keyword="+keyword);

%>