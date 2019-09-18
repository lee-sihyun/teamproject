<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<%@include file="/security/login_status.jspf" %>
<%
    String message=(String)session.getAttribute("message");

    if(message==null){
        message="";
    } else {
        session.removeAttribute("message");
        return;
    }
    
    LushUserDTO user=new LushUserDTO();

%>
<style>

/* Style the body */
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

/* Sidebar/left column */
.side {
  width: 200px;
  height: 100%;
  float: left;
}

/* Main column */
.main {   
  width: 75%;
  height: 100%;
  float: right;
  padding-top: 70px;
}

.main h3 {
    padding-bottom: 15px;
}

.mypage{
    width: 100%;
    margin-top: 50px;
}

#deleteInfor {
    border: 1px solid gray;
    text-align: left;
}


.thclass {
    text-align: left;
    margin: 40px;
}

#message {
    color: red;
    position: relative;
    display: none;
}


.spanclass {
    margin-right: 80px;
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
            <!-- 회원탈퇴 -->
            <div class="mypage" id="mygrade">
	        <h2>회원탈퇴</h2>
	        <hr>
            </div>
            <!-- 회원탈퇴 안내 -->
            <div class="mypage" id="ordering">
	            <h3>01. 회원탈퇴 안내</h3>
	              <div id="deleteInfor">
	                  <p>러쉬탈퇴안내<br>불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해
	                  드리도록 노력하겠습니다. <br> 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.<br>
	                  1.회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한
	                  고객정보 보호정책에 따라 관리 됩니다.<br>
	                  2.탈퇴 시 회원님께서 보유하셨던 데이터는 삭제 됩니다.</p>
	              </div>
	             </div>
            <!-- 회원탈퇴 하기 -->
            <form name="deleteForm" id="deleteForm" action="<%=request.getContextPath()%>/lushuser/deleteUser_action.jsp" method="post">
            <div class="mypage" id="orderlist">
            <h3>02. 회원탈퇴 하기</h3>
              <div class="section-header" id="">
                            <label class="thclass">비밀번호</label>
                            <input type="password" name="pass" id="pass">
                            <span id="message"><%=message %></span>
                            
                        <!-- 
                        <tr>
                            <th class="thclass">탈퇴사유</th>
                            <td class="tdclass">
                                <div>
                                    <div>
                                    <span class="spanclass"><input type="checkbox" name="choice" value="1">고객서비스(상담,포장 등)불만</span>
                                    <span class="spanclass"><span id="first"><input type="checkbox" name="choice" value="2">배송불만</span></span>
                                    </div>
                                    <div>
                                    <span class="spanclass"><input type="checkbox" name="choice" value="3">교환/환불/반품 불만</span>
                                    <span class="spanclass"><span id="second"><input type="checkbox" name="choice" value="4">방문빈도가 낮음</span></span>
                                    </div>
                                    <div>
                                    <span class="spanclass"><input type="checkbox" name="choice" value="5">상품가격 불만</span>
                                    <span class="spanclass"><span id="third"><input type="checkbox" name="choice" value="6">개인 정보유출 우려</span></span>
                                    </div>
                                    <div>
                                    <span class="spanclass"><input type="checkbox" name="choice" value="7">쇼핑몰의 신뢰도 불만</span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th class="thclass">남기실 말씀</th>
                            <td class="tdclass">
                                <textarea rows="5" cols="30"></textarea>
                            </td>
                        </tr>
                         -->
              </div>
            </div>
            <!-- 버튼 -->
            <div class="mypage" id="choicelist">
	            <div class="btn_Sc">
	              <div class="backBtn">
	                  <button type="button" id="backBtn" class="Btn">취소</button>
	                  <button type="submit" id="submitBtn" class="Btn">정보수정</button>
	              </div>
	            </div>
            </div>
            </form>
        </div>
</div>

<script type="text/javascript">
$("#backBtn").click(function() {
    location.href="<%=request.getContextPath()%>/index.jsp?workgroup=lushuser&work=mypage";
});

</script>