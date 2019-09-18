<%@page import="site.itwill.utill.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_status.jspf" %>
<%
   
   String passwd=Utility.encrypt(request.getParameter("pass"), "SHA-256");
   
   String message= (String)session.getAttribute("message");
   if(message==null){
       message="";
   } else {
       session.removeAttribute("message");
   }
   
   if(!passwd.equals(loginUser.getPasswd())){
       session.setAttribute("message", "비밀번호가 맞지 않습니다.");
       out.println("<script type='text/javascript'>");
       out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=lushuser&work=changeUser_confirm';");
       out.println("</script>");
       return;
   }

%>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>

/* Style the body */
body {
  font-family: Noto Sans KR;
}

p{
    margin: 0;
}

/* Header/logo Title */
#side1 {
    display: inline;
    width: 20%;
    float: left;
}

#side1 .side2 {
    padding: 0;
    width: 200px;
    margin: 0;
}


#side1 .lnb {
    width: 100%;
    margin: 0 auto;
    position: relative;
    z-index: 2;
}

.side4 {
    padding: 90px 0 100px;
}

#side1 .side4 h2 {
    font-size: 22px;
    font-family: "notokrB";
    font-weight: bold;
    line-height: 24px;

}

#side1 h2 {
    position: relative;
    margin: 0 auto 10px;
    text-align: left;
}

h2 {
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

#side1 .side4 h3 {
    position: relative;
    padding: 0 0 15px 0;
    line-height: 20px;
    font-size: 16px;
    font-weight: bold;
    font-family: "notokrM";
    letter-spacing: 1px;
    text-align: left;
    background: none;
}

.side h3 {
    margin: 32px 0 0;
    color: #222;
}

#side1 h3 {
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

#side1 .side4 ul {
    padding: 0 0 0 8px;
    
}

.mypageUser {
    margin-top: 50px;
    margin-bottom: 100px;
}

.side4 ul {
    line-height: 24px;
}

#side1 .side4 li {
    line-height: 28px;
}

#side1 .side4 li a {
    color: #8f8f8f;
}

a {
    text-decoration: none;
}

.content {  
    width: 1200px;
    height: 1000px;
    margin: 0 auto;
}

/* Main column */
.main {   
  width: 75%;
  height: 100%;
  float: right;
  padding-top: 70px;
}

.mainBox {
    text-align: left;
}

.mypageBox {
    border-bottom: 1px solid black;
    padding: 10px 0;
}

.myInfor {
    padding-top: 20px;
    width: 100%;
}

table tr {
    padding-top: 10px;
}

#message {
    color: blue;
    font-size: 20px;
    font-weight: bold;
}

#ordering {
    border-collapse: collapse;
    margin: 5px 0;
}

#deleteInfor {
    border: 1px solid gray;
    text-align: left;
}

.section-header {
    text-align: left;
    display: inline;
}

.pTag {
    text-align: right;
}

.thclass {
    text-align: left;
    margin: 40px;
}


.spanclass {
    margin-right: 80px;
}

.click {
    display: none;
    position: relative;
}

.error{
    color: red;
    position: relative;
    display: none;
}

.mypage_sc {
    height: 80px;
    text-align: center;
}

.btn_Sc {
    width: 75%;
    height: 75%;
    margin: 0 auto;
    margin-top: 10px;
}

.Btn {
    background-color: black;
    color: white;
    width: 20%;
    height: 30px;
    font: 15px bold;
    text-align: center;
}

th {
	padding: 15px;
}

th td {
	padding: 15px 0;
}



</style>
<!-- content -->    
<div class="content">
        <!-- side -->
        <div id="side1">
	    <div class="side2">
	        <div class="side3">
	            <div class="side4">
	                <h2>마이페이지</h2>
	                <h3>쇼핑정보</h3>
	                <ul>
	                    <li>
	                      <a href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=order_search';">주문목록/배송조회</a></li>
	                    <li>
	                      <a href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=order_cancel';">취소/반품/교환내역</a></li>
	                    <li>
	                      <a href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=order_refund';">환불/입금리스트</a></li>
	                </ul>
	                <h3>고객센터</h3>
	                <ul>
	                    <li>
	                      <a href="javascript:location.href='<%=request.getContextPath() %>/lushuser/changeUser_confirm.jsp">공지사항</a></li>
	                    <li>
	                      <a href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=board/QnA&work=QnA_list';">1:1문의</a></li>
	                    <li>
	                      <a href="javascript:location.href='<%=request.getContextPath() %>/lushuser/changeUser_confirm.jsp">FAQ</a></li>
	                </ul>
	                <h3>회원정보</h3>
	                <ul>
	                    <li>
	                      <a href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=changeUser_confirm';">회원정보변경</a></li>
	                    <li>
	                      <a href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=deleteUser';">회원탈퇴</a></li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    </div>
        <!-- main -->  
          <div class="main">
            <div class="mainBox">
            <div class="mypageBox" id="mygrade">
            <h2>회원정보 변경</h2>
            <hr>
            </div>
            <div class="mypageBox" id="ordering">
	            <div>
	               <h3>개인회원 정보입력</h3>
	               <p class="pTag">*  표시는 반드시 입력하셔야 하는 항목입니다.</p>
	            </div>
	            <hr>
            </div>
            <form name="changeForm" id="change" action="<%=request.getContextPath() %>/lushuser/changeUser_action.jsp" method="post">
                <div class="myInfor" id="orderlist">
                    <table>
			            <tr>
			                <th>*   아이디</th>
			                <td>
			                <input type="text" name="id" id="id" value="<%=loginUser.getId() %>">
			                </td>
			            </tr>
			            <tr>
			                <th>*   비밀번호</th>
			                <td>
			                <button type="button" id="changeBtn" >비밀번호 변경 ▼</button>
				                <div id="btnClick" class="click">
				                    <label class="newPw">새 비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                    <input type="password" name="pass" id="pass" required>
				                    <br>
				                    <label class="newPw">새 비밀번호 확인</label>&nbsp;&nbsp;
				                    <input type="password" name="repass" id="repass" required>
				                </div>
				                <div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
				                <div id="repasswdMatchMsg" class="error">변경 비밀번호와 비밀번호 확인이 서로 다릅니다.</div>
			                </td>
			            </tr>
			            <tr>
			                <th>*   이름</th>
			                <td>
			                <input type="text" name="name" id="name" value="<%=loginUser.getName() %>" required>
			                </td>
			            </tr>
			            <tr>
			                <th>닉네임</th>
			                <td>
			                <input type="text" name="nickName" id="nickName">
			                </td>
			            </tr>
			            <tr>
			                <th>이메일</th>
			                <td>
			                <input type="text" name="email" id="email" value="<%=loginUser.getEmail() %>" >
			                <select name="choice" id="select">
			                    <option value="" selected>직접입력</option>
			                    <option value="@naver.com">naver.com</option>
			                    <option value="@daum.net">daum.net</option>
			                    <option value="@gmail.com">gmail.com</option>
			                    <option value="@nate.com">nate.com</option>
			                </select>
			                <div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
                            <div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
			                </td>
			            </tr>
			            <tr>
			                <th>*   휴대폰번호</th>
			                <td>
			                <input type="number" name="phone" id="phone" value="0<%=loginUser.getPhone() %>" placeholder="-없이입력하세요." required>
			                <div id="phoneRegMsg" class="error">전화번호는 - 없이 숫자로만 입력해 주세요.</div>
			                </td>
			            </tr>
			             <tr>
			                <th>주소</th>
			                <td>
			                <input type="text" name="postcode" id="addr"  readonly>
			                <span id="postAddress">우편번호검색</span><br>
			                <input type="text" name="address1" id="address1" readonly> <input type="text" name="address2" id="address2">
			                </td>
			            </tr>
			        </table>
                </div>
            <div class="mypage_sc" id="choicelist">
            <div class="btn_Sc">
              <div class="backBtn">
                  <button type="button" id="backBtn" class="Btn">취소</button>
                  <button type="submit" id="submitBtn" class="Btn">정보수정</button>
              </div>
              </div>
            </div>
              <div id="message"><%=message %></div>
            </form>
        </div>
        </div>
</div>

<script type="text/javascript">
$("#changeBtn").click(function() {
	$("#btnClick").css("display", "block");
});

$("#backBtn").click(function() {
    location.href="<%=request.getContextPath()%>/index.jsp?workgroup=lushuser&work=mypage";
});

$("#insert").submit(function() {
    var submitResult=true;
    
    $(".error").css("display","none");

    var idReg=/^[a-zA-Z]\w{5,19}$/g;
    if(!idReg.test($("#id").val())) {
        $("#idRegMsg").css("display","block");
        submitResult=false;
    }
        
    var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
    if(!passwdReg.test($("#pass").val())) {
        $("#passwdRegMsg").css("display","block");
        submitResult=false;
    } 
    
    if($("#pass").val()!=$("#repass").val()) {
        $("#repasswdMatchMsg").css("display","block");
        submitResult=false;
    }

    var phoneReg=/^\d{11}$/;
    if(!phoneReg.test($("#phone").val())) {
        $("#phoneRegMsg").css("display","block");
        submitResult=false;
    }
    
    var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
    if($("#email").val()=="") {
        $("#emailMsg").css("display","block");
        submitResult=false;
    } else if($("#select option:selected").val()==""){
        $("#emailRegMsg").css("display","block");
        submitResult=false;
    }
    
    return submitResult;
    
});


$("#postAddress").click(function() {
    window.open("<%=request.getContextPath() %>/lushuser/postaddress_search.jsp","우편번호검색","width=500,height=400,left=400,top=350");
});

</script>
