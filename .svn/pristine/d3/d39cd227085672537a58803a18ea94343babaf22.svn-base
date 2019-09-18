
<%@page import="site.itwill.dao.QnADAO"%>
<%@page import="site.itwill.dto.QnADTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	for(int i=1;i<=10;i++) {
		QnADTO QnA=new QnADTO();
		int num=QnADAO.getDAO().getQnANum();
		QnA.setNum(num);
		QnA.setId("aaaaaa");
		QnA.setCategory("배송 문의");
		QnA.setTitle("테스트-"+i);
		QnA.setContent("내용-"+i);
		QnA.setRef(num);
		QnA.setInquiry("노노노노");
		QnADAO.getDAO().addQnA(QnA);
	}
%>
<h1>500개의 테스트 게시글 저장 하였습니다.</h1>