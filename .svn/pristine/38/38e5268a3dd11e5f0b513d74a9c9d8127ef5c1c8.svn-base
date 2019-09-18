<%@page import="site.itwill.dao.LushUserDAO"%>
<%@page import="site.itwill.dto.LushUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if(request.getParameter("id")==null) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        return;
    }

    String id=request.getParameter("id");
    
    LushUserDTO lushUser=LushUserDAO.getDao().getUser(id);
    
%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
div {
	text-align: center;
	margin: 0 auto;
	font: 14px notokrB;
}
</style>
<%if(lushUser==null) { %>
	<div><span class="id">" <%=id %> "</span>는 사용 가능합니다.</div>
	   <div><button type="button" onclick="Close();">사용하기</button> </div>
<% } else { %>
	<div>현재 <span class="id">" <%=id %> "</span>는 이미 사용중입니다.
	   <br>
	       다른 아이디를 입력해 주십시오.
	</div>
	<div>
		<form name="checkForm" onsubmit="return Check();">
		    <input type="text" name="id">
		    <button type="submit">사용하기</button>
		</form>
	</div>
<% } %>

<script type="text/javascript">
function Close() {
    opener.insertForm.id.value="<%=id %>";
    opener.insertForm.idCheckSc.value="1";
    window.close();
};

function Check() {
    var id=checkForm.id.value;
    if(id=="") {
        document.getElementById("message").innerHTML="아이디를 입력해 주세요.";
        document.getElementById("message").style="color:red;";
        return false;
    }
    
    var idReg=/^[a-zA-Z]\w{4,14}$/g;
    if(!idReg.test(id)) {
        document.getElementById("message").innerHTML="아이디는 영문자로 시작되는 영문자,숫자,_의 5~15범위의 문자로만 작성 가능합니다.";
        document.getElementById("message").style="color:red;";
        return false;
    }
    
    return true;
};

</script>