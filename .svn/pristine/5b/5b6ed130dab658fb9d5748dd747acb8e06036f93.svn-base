<%@page import="site.itwill.dao.LushUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name=(String)session.getAttribute("name");
    String id=(String)session.getAttribute("id");
%>

<style type="text/css">

.contentBox {
    margin: 0 auto;
    width: 800px;
    height: 500px;
    padding: 0px;
}

.innerBox{
    witdh: 80%;
    margin: 0 auto;
}

.member {
    margin: 0 auto;
    width: 100%;
    text-align: center;
}

.userBox{
    width: 70%;
    margin: 0 auto;
    padding: 30px 15%;
}

.dataBox {
    width: 75%;
    margin: 0 auto;
}

.dataBox_re {
    margin: 15px;
}

h2 {
    color: black;
    padding-bottom: 30px;
    font-size: 25px;
}

p {
	font: 20px bold;
}

#login {
    background-color: black;
    color: white;
    font-size: 20px;
}

</style>

<div class="contentBox">
   <div class="innerBox">
   <div class="member">
       <h2>아이디 찾기</h2>
   </div>
   <div class="member">
        <div class="userBox">
            <div class="dataBox">
                <div class="dataBox_re">
                <p><%=name %> 회원님의 아이디는 <br>
                '<strong><%=id %></strong>' 입니다.
                </div>
                <div id="findUser_menu" class="dataBox_re">
                    <button type="submit" id="login" style="width: 100%; height: 50px;">로그인</button>
                </div>
            </div>
        </div>
   </div>
   </div>
</div>

<script type="text/javascript">
$("#login").click(function() {
    location.href="<%=request.getContextPath()%>/index.jsp?workgroup=lushuser&work=login";
});

</script>