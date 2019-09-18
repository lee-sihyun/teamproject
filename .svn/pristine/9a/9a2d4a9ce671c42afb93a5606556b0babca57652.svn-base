<%@page import="site.itwill.dao.LushUserDAO"%>
<%@page import="site.itwill.utill.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_status.jspf" %>
<%
   if(request.getMethod().equals("GET")){
       response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
       return;
   }

   request.setCharacterEncoding("UTF-8");

   String id=request.getParameter("id");
   
   String passwd=request.getParameter("change_pass");
   
   if(passwd!=null && !passwd.equals("")) {
       passwd=Utility.encrypt(request.getParameter("change_pass"), "SHA-256");
   } else {
       passwd=loginUser.getPasswd();
   }
   
   String name=request.getParameter("name");
   String nickname=request.getParameter("nickName");
   String email=request.getParameter("email")+request.getParameter("choice");
   String phone=request.getParameter("phone");
   String postcode=request.getParameter("postcode");
   String address1=request.getParameter("address1");
   String address2=request.getParameter("address2");
   
   LushUserDTO user = new LushUserDTO();
   user.setId(id);
   user.setPasswd(passwd);
   user.setName(name);
   user.setNickname(nickname);
   user.setEmail(email);
   user.setPhone(phone);
   user.setPostcode(postcode);
   user.setAddress1(address1);
   user.setAddress2(address2);
   
   LushUserDAO.getDao().updateUser(user);
   
   session.setAttribute("loginUser", LushUserDAO.getDao().getUser(id));
   
   session.setAttribute("message", "정상적으로 변경되었습니다.");
   
   response.sendRedirect(request.getContextPath()+"/index.jsp?workgroup=lushuser&work=mypage");
   
%>