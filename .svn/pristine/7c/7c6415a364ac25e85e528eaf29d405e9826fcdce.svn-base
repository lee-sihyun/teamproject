<%@page import="site.itwill.dao.LushUserDAO"%>
<%@page import="site.itwill.dto.LushUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_status.jspf" %>
<%
    String message=(String)session.getAttribute("message");

    if(message==null) {
        message="";
    } else {
        session.removeAttribute("message");
    }
    
%>
<style type="text/css">

.main {
    margin: 0 auto;
    width: 800px;
    height: 500px;
    padding: 0px;
    text-align: center;
}

.mainBox {
    padding-top: 100px;
}

.total{
    padding-top: 20px;
}

.inputBox {
    text-align: center;
    padding: 20px;
}

.buttonBox {
    padding-top: 20px;
    margin: 15px;
}

.Btn {
    background-color: black;
    color: white;
    width: 20%;
    height: 30px;
    font: 15px bold;
    text-align: center;
}

#message {
    color: red;
    font-weight: bold;
}

</style>

<div class="main">
	<div class="mainBox">
	   <h2>회원정보변경</h2>
	   <hr>
		<div class="total">
		   <p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해 주세요.</p>
		   <div class="inputBox">
		   <form name="confrimForm" action="<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=changeUser" method="post">
	       <p>아이디 <%=loginUser.getId() %>&nbsp;&nbsp;&nbsp; <span>비밀번호 <input type="password" name="pass" required></span> </p>
	       <div class="buttonBox">
	        <button type="button" id="backBtn" class="Btn">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <button type="submit" id="submitBtn" class="Btn">인증하기</button>
	       </div>
	       <div id="message"><%=message%></div>
		   </form>
		   </div>
		</div>
	</div>	
</div>

<script type="text/javascript">

$("#backBtn").click(function() {
    location.href="<%=request.getContextPath()%>/index.jsp?workgroup=lushuser&work=mypage";
});

</script>

    
