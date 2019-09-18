<%@page import="site.itwill.dto.QnADTO"%>
<%@page import="site.itwill.dao.QnADAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="site.itwill.dao.OrderDetailDAO"%>
<%@page import="site.itwill.dto.OrderDetailDTO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dao.CartDAO"%>
<%@page import="site.itwill.dto.CartDTO"%>
<%@page import="site.itwill.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.itwill.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_status.jspf"%>
<%
    String message= (String)session.getAttribute("message");
    if(message==null){
        message="";
    } else {
        session.removeAttribute("message");
    }
    
    List<OrderDTO> orderList=OrderDAO.getOrderDAO().getOrderList2(loginUser.getId());
    
    List<QnADTO> qnaList=QnADAO.getDAO().getQnAIDList(loginUser.getId());
    int num=0;
    for(QnADTO qna:qnaList) {
        num=qna.getRef();
    }
    
    int count=0; //구매완료 갯수증가
    int count2=0; //배송전
    int count3=0; //배송중
    int count4=0; //배송후
    int cancelCount=0; //취소
    int changeCount=0; //교환
    
    for(OrderDTO orderUser:orderList) {
        if(orderUser.getOrderStatus()==1){
            count++;
            if(orderUser.getDeliveryStatus()==1) {
                count2++;
            } else if (orderUser.getDeliveryStatus()==2){
                count3++;
            } else if (orderUser.getDeliveryStatus()==3){
                count4++;
            } else if (orderUser.getOrderStatus()==2) {
                cancelCount++;
            } else if (orderUser.getOrderStatus()==4) {
                changeCount++;
            }
        }
    }
    
	    String userGrade=null;
	    if(loginUser.getStatus()==1) {
	        userGrade="일반회원";
	    } else if(loginUser.getStatus()==2){
	        userGrade="휴면회원";
	    } else {
	        userGrade="관리자";
	    }
	
%>

<style type="text/css">

/* Column container */
#side1 {
	display: inline;
	width: 20%;
	float: left;
	height: 80%;
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

.side4 h3 {
	margin: 32px 0 0;
	color: #222;
}

h3 {
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

.lnb .side4 ul {
	line-height: 24px;
	text-align: center;
}

ul {
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

ul, li {
	margin: 0;
	list-style: none;
}

#side1 .side4 li {
	line-height: 28px;
}


ul, li {
	margin: 0 auto;
	padding: 0;
	list-style: none;
}

li {
	display: list-item;
}

#side1 .side4 li a {
	color: #8f8f8f;
}

a {
	text-decoration: none;
}

.content {
	width: 1200px;
	height: 1600px;
	margin: 0 auto;
}

/* Main column */
.main {
	width: 70%;
	float: right;
	height: 80%;
	margin: 6% 3% 6% 0;
}

/* 회원등급 및 문의 위치 */
.section {
	text-align: center;
	padding: 30px 30px 30px 20px;
    border: 1px solid gray;
	height: 80px;
}

.mypageUserGrade {
    width: 100%;
    height: 130px;
    margin: 0 auto;
}

.topSection {
    width: 100%;
    height: 100%;
    border: 1px solid black;
}

.midSection {
	width: 100%;
	height: 100%;
}

.member_infor1 {
    width: 60%;
    float: left;
    padding: 25px 0 10px 15px;
}

.member-image {
    width: 35%;
    height: 90%;
    display: table-cell;
    float: left;
}

.member-text {
    width: 55%;
    height: 90%;
    display: table-cell;
    overflow: hidden;
    float: right;
}

.member_infor2 {
    width: 30%;
    float: right;
    margin-top: 5%;
}

/*=======================================================*/

.section-h {
	text-align: left;
}

.section-h .option {
	text-align: right;
}

.listTable_order {
    width: 65%;
	float: left;
}

.listTable_stat {
    width: 30%;
	float: right;
}

.section-body1 {
    padding-top: 10px;
}

.order-step_clear {
	border: 1px solid gray;
	height: 150px;
	padding: 20px 20px;
}

.order-margin {
    margin: 30px;
}

.orderP {
    text-align: left;
}

.more {
    float: right;
}

ol li {
	display: inline-block;
}

tr {
	border-bottom: 1px solid #e7e7e7;
}

tr th {
	text-align: center;
}

tr td {
	text-align: center;
	font-weight: bold;
	height: 90px;
}

table #item {
	width: 100%;
}
table #item {
	width: 100%;
}
table #item {
	width: 100%;
}

.tt {
	border: none;
	text-align: center;
	font-weight: bold;
}
.orderText {
	border: none;
	font-weight: bold;
}
.nameDiv {
    width: 300px;
    margin-right: 0px;
}

</style>

<div class="content">
	<!-- sidebar -->
	<div id="side1">
		<div class="side2">
			<div class="side3">
				<div class="side4">
					<h2>마이페이지</h2>
					<h3>쇼핑정보</h3>
					<ul>
						<li><a
							href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=order_search';">주문목록/배송조회</a></li>
						<li><a
							href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=order_refund';">환불/반품/교환내역</a></li>
					</ul>
					<h3>고객센터</h3>
					<ul>
						<li><a
							href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=board/QnA&work=QnA_list';">1:1문의</a></li>
						<li><a
							href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=board/FAQ&work=FAQ_List';">FAQ</a></li>
					</ul>
					<h3>회원정보</h3>
					<ul>
						<li><a
							href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=changeUser_confirm';">회원정보변경</a></li>
						<li><a
							href="javascript:location.href='<%=request.getContextPath() %>/index.jsp?workgroup=lushuser&work=deleteUser';">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- main -->
	<div class="main">
		<!-- 회원 가입시 회원 요약정보 -->
		<div class="mypageUserGrade" id="mygrade">
                <div class="topSection" id="gradesize">
                   <div class="midSection">
                        <div class="member_infor1">
                            <div class="member-img">
                                <img alt="" src="<%=request.getContextPath()%>/lushuser/image/ico_member_upload1.png">
                            <div class="member-text">    
                                <p><%=loginUser.getName() %>님의
                                <br>
                                    회원등급은 <strong><%=userGrade %></strong>입니다.
                                </p>
                            </div>    
                            </div>
                        </div>
                        <div class="member_infor2">
                            <div class="member-question">
                                <div class="inner1">
                                    <span class=""></span>
                                    <p>문의
                                        <span class="number"><%=num %></span> 건
                                    </p>
                                </div>
                            </div>
                        </div>
                   </div>
                </div>
          </div>
		<!-- 배송주문 내역 -->
		<div class="mypageUser" id="ordering">
			<div class="section-h" id="">
				<h2>진행중인 주문</h2>
				<p>최근 30일 내에 진행중인 주문정보입니다.</p>
			</div>
			<div class="section-body1" id="order-section">
				<div class="order-step_table">
					<div class="order-step_clear">
					   <div class="order-margin">
						<div class="listTable_order">
							<table>
								<tr>
									<!-- 결제완료 -->
									<th class="order_th">
									   <%=count %>
									</th>
									<!-- 배송전 -->
									<th class="order_th">
									    <%=count2 %>
									</th>
									<th class="order_th">
									<!-- 배송중 -->
										<%=count3 %>
									</th>
									<th class="order_th">
									<!-- 배송후 -->
									    <%=count4 %>
                                    </th>
								</tr>
								<tr>
									<th class="order_th">결제완료</th>
									<th class="order_th">배송 전</th>
									<th class="order_th">배송 중</th>
									<th class="order_th">배송 도착</th>
								</tr>
							</table>
						</div>
						<div class="listTable_stat">
							<table>
								<tr>
									<td class="order_td">취소 처리완료</td>
									<th class="order_th"> <%=cancelCount %> 건</th>
								</tr>
								<tr>
									<td class="order_td">교환 처리완료</td>
									<th class="order_th"><%=changeCount %> 건</th>
								</tr>
							</table>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 최근 주문 정보 -->
		<div class="mypageUser" id="orderlist">
			<div class="section-h" id="">
				<h2>최근 주문 정보</h2>
				<div class="option">
				<p class="orderP">최근 30일 내에 주문하신 내역입니다.
					<a class="more" href="">더보기</a>
				</p>
				</div>
			</div>
			<hr>
			<div class="section-body" style="border-top: 1px solid #000; border-bottom: 0.5px solid #e7e7e7; margin-top: 10px;">
		        <table id="item">
		            <tr style="height: 50px;">
		                <th class="orderDate">주문날짜</th>
		                <th class="orderNo">주문번호</th>
		                <th class="name">상품명</th>
		                <th class="priceVolume">상품금액/수량</th>
		                <th class="oStatus">주문상태</th>
		                <th class="dStatus">배송상태</th>
		            </tr>
		            <% for(OrderDTO order:orderList) { %>
		            <%
		               //order by item_no
		               List<OrderDetailDTO> detailList=OrderDetailDAO.getOrderDAO().getOrderDetail(loginUser.getId(), order.getOrderNo());
		               ArrayList<Integer> itemNoList=new ArrayList<Integer>();
		               for(OrderDetailDTO detail:detailList) {
		            	   int itemNo=detail.getItemNo();
		            	   itemNoList.add(itemNo);
		               }
		               
		               //order by item_no
		               ArrayList<ProductDTO> productList=new ArrayList<ProductDTO>();
		               for(int itemNo:itemNoList) {
		            	   ProductDTO product=ProductDAO.getDAO().getProduct2(itemNo);
		            	   productList.add(product);
		               }
		            %>
		            <tr>
		                <td class="orderDate"><%=order.getOrderDate().substring(0, 10) %></td>
		                <td class="orderNo"><%=order.getOrderNo() %></td>
		                <% if(detailList.size()==1) { %>
		                <td class="name" style="height: 100px;">
		                	<div style="width: 256px;">
		                		<img src="<%=request.getContextPath()%>/admin/product_image/<%=productList.get(0).getImage()%>" alt="<%=productList.get(0).getName()%>" style="width: 80px; height: 80px;">
			                	<input type="text" value="<%=productList.get(0).getName()%>" style="margin-top: 25px;" class="orderText">
							</div>
		                </td>	
		                <% } else { %>
		                <td class="name">
		                	<div class="nameDiv">
		                		<img src="<%=request.getContextPath()%>/admin/product_image/<%=productList.get(0).getImage()%>" alt="<%=productList.get(0).getName()%>" style="width: 80px; height: 80px;">
			                	<input type="text" value="<%=productList.get(0).getName()%> 외 <%=detailList.size()-1%>건" style="margin-top: 25px;" class="orderText">
							</div>
		                </td>
		                <% } %>
		                <% if(detailList.size()==1) { %>
		                <td class="priceVolume">
		                	<div style="width: 132px;">
		                	<input type="text" readonly="readonly" value="<%=DecimalFormat.getCurrencyInstance().format(detailList.get(0).getTotalPrice())%>" style="width: 70px;" class="tt">
		                	<a>/</a>
		                	<input type="text" readonly="readonly" value="<%=detailList.get(0).getVolume()%>개" style="width: 30px;" class="tt">
		                	</div>
		                </td>
		                <% } else { %>
		                <td class="priceVolume">
		                	<div style="width: 132px;">
		                	<input type="text" readonly="readonly" value="<%=DecimalFormat.getCurrencyInstance().format(detailList.get(0).getTotalPrice())%>" style="width: 70px;" class="tt">
		                	<a>/</a>
		                	<input type="text" readonly="readonly" value="<%=detailList.get(0).getVolume()%>개" style="width: 30px;" class="tt">
		                	</div>
		                </td>
		                <% } %>
		                <td class="oStatus">
		                    <% if(order.getOrderStatus()==1) { %> 주문완료
		                    <% } else if(order.getOrderStatus()==2) { %> 환불요청
		                    <% } else if(order.getOrderStatus()==3) { %> 환불완료
		                    <% } else if(order.getOrderStatus()==4) { %> 교환요청
		                    <% } else { %> 교환완료
		                    <% } %>
		                </td>
		                <td class="dStatus">
		                    <% if(order.getDeliveryStatus()==1) { %> 배송대기중
		                    <% } else if(order.getDeliveryStatus()==2) { %> 배송중
		                    <% } else { %> 배송완료
		                    <% } %>
		                </td>
		            </tr>
		            <% } %>
		        </table>
		    </div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(".order_th").css("width", "150px");
$(".order_td").css("width", "100px");
$(".orderDate").css("width","150px");
$(".orderNo").css("width","100px");
$(".name").css("width","500px");
$(".priceVolume").css("width","250px");
$(".oStatus").css("width","200px");
$(".dStatus").css("width","200px");
</script>

