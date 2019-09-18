<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//POST 방식으로 요청되어 전달된 값들에 대한 캐릭터셋 변경
	request.setCharacterEncoding("UTF-8");
%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Archivo+Black&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
body {
	color: #000000;
	font-family: "Noto Sans KR";
	font-size: 16px;
	line-height: 1.4;
	letter-spacing: -0.5px;
}
#shoppingCart {
	font-family: 'Archivo Black', sans
	-serif;
	text-align: center;
	font-size: 42px;
	margin-top: 70px;
}
#cooc {
	text-align: center;
	margin-bottom: 80px;
}
#orderConfirmedDiv {
	margin-bottom: 50px;
	padding-left: 50px;
	height: 300px;
}
img {
	float: left;
}
#orderConfirmedText {
	float: left;
	margin-left: 50px;
}
#bottomBtn {
	text-align: center;
}
#continueShopping,#confirmOrder:hover {
	cursor: pointer;
}
*:focus {
    outline: none;
}
</style>
<form method="post" id="orderForm" style="width: 800px; height: 800px; margin: 0 auto;">
	<h2 id="shoppingCart">SHOPPING CART</h2>
	<h4 id="cooc" style="color: rgb(168, 168, 168); font-size: 15px;">
		Cart&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;Order
		&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;<span	id="order" style="color: #333">Order confirmed</span></h4>
	<div id="orderConfirmedDiv">
		<img src="<%=request.getContextPath() %>/resources/lush.PNG" width="306" height="306">
		<div id="orderConfirmedText" style="width: 370px; height: 306px;">
			<br><br><br>
			<span style="font-size: 20px; font-weight: bold;">결제가 완료되었습니다.</span><br><br>
			<span>감사합니다<br><br>상세 주문내역 및 진행 상황은<br>
			마이페이지 > 내주문에서 확인하실 수 있습니다.</span>
		</div>
	</div>
	<div id="bottomBtn">
		<button type="button" name="continueShopping" id="continueShopping"
				onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=rush&work=rush_main'">쇼핑 계속하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" name="confirmOrder" id="confirmOrder"
				onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=lushuser&work=mypage'">주문 확인하기</button>
	</div>
</form>
	
<script type="text/javascript">
$("#bottomBtn").children("#continueShopping").css({"width":250,"height":60,"background":"white","color":"black","font-size":"15px","border":"solid 0.5px black","font-weight":"bold"});
$("#bottomBtn").children("#confirmOrder").css({"width":250,"height":60,"background":"black","color":"white","font-size":"15px","border":"none","font-weight":"bold"});
</script>