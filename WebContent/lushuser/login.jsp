<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String message=(String)session.getAttribute("message");

    if(message== null){
        message="";
    } else {
        session.removeAttribute("message");
    }
    
    String id=(String)session.getAttribute("id");
    if(id==null) {
        id="";
    } else {
        session.removeAttribute("id");
    }

%>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">;
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

.loginBox{
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

#user li {
    witdh:90%;
}

#message {
    color: red;
    font-weight: bold;
}

#login {
    witdh:90%;
}

#checkBox {
    text-align: left;
}

#loginBtn {
    background-color: black;
    color: white;
    font-size: 20px;
}

.inputLa {
    witdh:90%;
    border: 1px solid black;
    font-size: 18px;
}

ul li {
    font-size: 18px;
}

</style>
<div class="contentBox">
   <div class="innerBox">
   <div class="member">
	   <h2>로그인</h2>
	       <ul id="user">
	                <li>회원</li>
	       </ul>
   </div>
   <div class="member">
       <form id="login" name="loginForm" action="<%=request.getContextPath() %>/lushuser/login_action.jsp" method="post">
        <div class="loginBox">
            <div class="dataBox">
	            <div class="dataBox_re">
	                <input type="text" class="inputLa" name="id" placeholder="아이디" required style="width: 100%; text-align: center; height: 50px;">
	            </div>
	            <div class="dataBox_re">
	                <input type="password" class="inputLa" name="pass"  placeholder="비밀번호" required style="width: 100%; text-align: center; height: 50px;">
	            </div>
	            <div id="message"><%=message%></div>
		        <div class="dataBox_re" id="checkBox">
		            <input type="checkbox" id="idCheckbox" >
		            <label>아이디 저장</label>
		        </div>
		        <div class="dataBox_re">
		            <button type="submit" id="loginBtn" style="width: 100%; height: 50px;"> 로그인 </button>
		        </div>
		        <div id="login_menu" class="dataBox_re">
		            <button type="submit" id="new_id">회원가입</button> |
		            <button type="submit" id="find_id">아이디 찾기</button>
		        </div>
	        </div>
        </div>
       </form>
   </div>
   </div>
</div>


<script type="text/javascript">
$("#new_id").click(function() {
	location.href="<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=insertUser";
});

$("#find_id").click(function() {
    location.href="<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=findUser_confirm";
});

$(document).ready(function(){
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idCheckbox").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idCheckbox").change(function(){ // 체크박스에 변화가 발생시
        if($("#idCheckbox").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idCheckbox").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>
