<%@page import="site.itwill.dao.LushUserDAO"%>
<%@page import="site.itwill.utill.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_status.jspf" %>
<%
    if(request.getMethod().equals("GET")) {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        return;
    }

    String passwd=Utility.encrypt(request.getParameter("pass"), "SHA-256");
    
    if(!passwd.equals(loginUser.getPasswd())){
        session.setAttribute("message", "비밀번호가 맞지 않습니다.");
        response.sendRedirect(request.getContextPath()+"/index.jsp?workgroup=lushuser&work=deleteUser");
        return;
    }
    
    LushUserDAO.getDao().deleteUser(loginUser.getId());
    
    response.sendRedirect(request.getContextPath()+"/lushuser/logout.jsp");
    
    
    
%>