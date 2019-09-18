<%@page import="java.text.DecimalFormat"%>
<%@page import="site.itwill.dao.pageDAO"%>
<%@page import="site.itwill.dto.pageDTO"%>
<%@page import="site.itwill.dao.OrderDAO"%>
<%@page import="site.itwill.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	List<OrderDTO> orderList1 = OrderDAO.getOrderDAO().getStaus1();
	List<OrderDTO> orderList2 = OrderDAO.getOrderDAO().getStaus2();
	List<OrderDTO> orderList3 = OrderDAO.getOrderDAO().getStaus3();
		

	String search = request.getParameter("search");
	if (search == null)
		search = "";
	String keyword = request.getParameter("keyword");
	if (keyword == null)
		keyword = "";

	int pageNum = 1;
	if (request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));

	}

	int pageSize = 10;

	int totalDelivery1 = pageDAO.getDAO().getPageTotal1(search, keyword);
	int totalPage = (int) Math.ceil((double) totalDelivery1 / pageSize);

	if (pageNum <= 0 || pageNum > totalPage) {
		pageNum = 1;
	}

	int startRow = (pageNum - 1) * pageSize + 1;

	int endRow = pageNum * pageSize;

	if (endRow > totalDelivery1) {
		endRow = totalDelivery1;
	}

	List<pageDTO> pageList1 = pageDAO.getDAO().getPageDeliver1List(startRow, endRow, search, keyword);

	int number = totalDelivery1 - (pageNum - 1) * pageSize;
	
	
%>
<jsp:include page="/admin/header.jsp" />
<link href="css/admin_delivery.css" rel="stylesheet" type="text/css">

<style type="text/css">
#content {
	width: 1280px;
	height: 1029px;
	padding: 0px 40px 40px 40px;
	box-sizing: border-box;
	vertical-align: top;
}

form {
	width: 1280px;
	height: 999px;
}




.headingArea {
	position: relative;
	width: 1280px;
	height: 30px;
	margin: 0px 0px 38px 0px;
}

.mTitle {
	width: 1280px;
	height: 30px;
	position: relative;
	margin: 40px 0 14px 0;
}

h1 {
	width: 129px;
	height: 30px;
	position: relative;
	display: inline-block;
	font-size: 30px;
	line-height: 30px;
	font-weight: bold;
	vertical-align: middle;
}

.mTabtypeOrderdelivery {
	width: 1280px;
	height: 102px;
	margin: 0 0 20px 0px;
	display: flex;
	background-color: #fff;
	display: flex;
	position: relative;
}

.tab {
	width: 1279px;
	height: 100px;
	display: flex;
	flex: 1;
	position: relative;
	border: 1px solid #dadcdd;
	border-right: 0;
}
/*입금확인*/
#ship_tab_no_pay_cnt {
	width: 254.797px;
	height: 100px;
	position: relative;
	flex: 1;
	border-right: 1px solid #dadcdd;
}

#no_pay_cnt {
	width: 148.797px;
	height: 54px;
	position: relative;
	display: inline-block;
	padding: 23px 0 23px 106px;
	font-size: 16px;
	color: #6e6e6e;
	box-sizing: border-box;
	text-decoration: none
}

#no_pay_cnt .title {
	font-size: 16px;
	font-weight: normal;
}

.count {
	width: 148.797px;
	height: 26px; / /*   margin: 7px 0 0 0;*/
	display: block;
	font-size: 26px;
	line-height: 26px;
	color: #2e3039;
	font-weight: bold;
}

/*배송대기*/
#ship_tab_is_shipped_f {
	width: 254.797px;
	height: 100px;
	flex: 1;
	position: relative;
	border-right: 1px solid #dadcdd;
	display: inline-block;
}

#is_shipped_f {
	width: 148.797px;
	height: 54px;
	position: relative;
	font-size: 16px;
	padding: 23px 0 23px 106px;
	display: inline-block;
	/* width: 100%;*/
	color: #6e6e6e;
	box-sizing: border-box;
	text-decoration: none;
}

#is_shipped_f .title {
	font-size: 16px;
	color: #55a0ff;
	font-weight: normal;
}

#is_shipped_f_value {
	width: 148px;
	height: 26px;
	display: block;
	/*margin: 7px 0 0;*/
	font-size: 26px;
	line-height: 26px;
	color: #2e3039;
	font-weight: bold;
}

/*배송중*/
#ship_tab_is_shipped_w {
	width: 254.797px;
	height: 100px;
	position: relative;
	flex: 1;
	border-right: 1px solid #dadcdd;
}

#is_shipped_w {
	width: 148.797px;
	height: 54px;
	position: relative;
	display: inline-block;
	/* width: 100%;*/
	padding: 23px 0 23px 106px;
	font-size: 16px;
	color: #6e6e6e;
	box-sizing: border-box;
	text-decoration: none;
}

.title {
	font-size: 16px;
	color: #2e3039;
	font-weight: normal;
}

#is_shipped_w_value {
	width: 148px;
	height: 26px;
	display: block;
	margin: 7px 0 0;
	font-size: 26px;
	line-height: 26px;
	color: #2e3039;
	font-weight: bold;
}

/*배송완료*/
#ship_tab_is_shipped_m {
	width: 254.797px;
	height: 100px;
	position: relative;
	flex: 1;
	border-right: 1px solid #dadcdd;
}

#is_shipped_m {
	width: 148.797px;
	height: 54px;
	position: relative;
	display: inline-block;
	/* width: 100%;*/
	padding: 23px 0 23px 106px;
	font-size: 16px;
	color: #6e6e6e;
	box-sizing: border-box;
	text-decoration: none;
}

.title {
	font-size: 16px;
	color: #2e3039;
	font-weight: normal;
}

.optionArea {
	width: 1238px;
	height: 274px;
	margin: 0 0 30px 0;
	padding: 20px 20px 20px 20px;
	border-radius: 2px;
	clear: both;
	border: 1px solid #ddd;
	background: #fff;
	box-shadow: 0px 2px 1px 0px rgba(205, 211, 222, 1);
}

.mOption {
	width: 1238px;
	height: 198px;
}

.mOption table {
	width: 1237px;
	height: 197px;
	table-layout: fixed;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	line-height: 1.5;
	background-color: #fff;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}

.mButtongCenter {
	position: relative;
	text-align: center;
	width: 1234px;
	height: 36px;
	margin: 20px 0 100px 0;
	padding: 0 4px 0 0;
}

.mButton a:first-child {
	margin-left: 0;
}

.mButton a {
	margin: 0 0 0 10px;
}

.btnSearch {
	width: 42px;
	height: 34px;
	padding: 0 20px 0 20px;
	color: #fff;
	line-height: 34px;
	border: 1px solid transparent;
	background-color: #55a0ff;
	text-decoration: none;
}

.btnSearch.reset {
	width: 42px;
	height: 34px;
	color: #55a0ff;
	
	background-color: #fff;
	line-height: 34px;
	
	padding: 0 20px 0 20px;
	border: 1px solid #55a0ff;
	text-decoration: none;
}

/*하단 테이블*/
.section {
	width: 1238px;
	height: 360px;
	border: 1px solid;
	margin: 0 0 30px 0;
	padding: 30px 20px 30px 20px;
	border-radius: 2px;
	border: 1px solid #ddd;
	background: #fff;
	box-shadow: 0px 2px 1px 0px rgba(205, 211, 222, 1);
}

#tabNumber {
	width: 1238px;
	height: 305px;
}

.mCtrltypeHeadersetting {
	width: 1169px;
	height: 28px;
	padding: 7px 52px 7px 15px;
	position: relative;
	z-index: 1;
	margin-bottom: -1px;
	border: 1px solid #dedede;
	background: #fff;
}

.gLeft {
	width: 147.922px;
	height: 28px;
	float: left;
	text-align: left;
	margin-bottom: 10px;
}

tbody {
	width: 1663px;
	height: 59px;
	isplay: table-row-group;
	vertical-align: middle;
	border-color: inherit;
	    text-align: center;
}

.btnCtrl {
	    color: #fff;
    width: 80px;
    height: 30px;
    background: #55a0ff;
}

.mBoardtypeOrdergScrollgCellSingle {
	width: 1236px;
	height: 169px;
	position: relative;
	/*overflow: auto;*/
	/*border-right: 1px solid #d9dadc;*/
}

#searchResultList {
	width: 100%;
	height: 168px;
	border-top: 0;
	margin-left: -1px;
	line-height: 1.5;
	background-color: #fff;
	table-layout: fixed;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

thead th {
	padding: 8px 5px;
	border: 1px solid #dedede;
	text-align: center;
	vertical-align: middle;
}

.count {
	display: block;
}


</style>

<!--본문내용역역 시작 content로 잡으면 됩니다  -->

<div id="content">

	<form action="" method="post"  name="deliveryform" id="deliveryform">

		<div class="headingArea">
			<div class="mTitle">
				<h1>배송관리</h1>
			</div>


		</div>

		<div class="mTabtypeOrderdelivery">

			<ol class="tab" style="margin-bottom: 0px; margin-top: 0px;">
				<!-- 	<li id="ship_tab_no_pay_cnt"><a href="admin_delivery.jsp"
								id="no_pay_cnt" style="width: 206px;"><span
									class="thumb deposit"><strong class="title">입금확인</strong><span
										class="count" id="no_pay_cnt_value">0</span></span></a></li> -->





				<li id="ship_tab_is_shipped_f"><a
					href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery"
					id="is_shipped_f" style="width: 206px;"><span
						class="thumb ready"><strong class="title">배송대기</strong><span
							class="count" id="is_shipped_f_value"><%=orderList1.size() %></span></span></a></li>
							


				<li id="ship_tab_is_shipped_w"><a
					href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery2"
					id="is_shipped_w" style="width: 206px;"><span
						class="thumb delivery"><strong class="title">배송중</strong><span
							class="count" id="is_shipped_m_value"><%=orderList2.size() %></span></span></a></li>

				<li id="ship_tab_is_shipped_m"><a
					href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery3"
					id="is_shipped_m" style="width: 206px;"><span
						class="thumb delivery"><strong class="title">배송완료</strong><span
							class="count" id="is_shipped_m_value"><%=orderList3.size() %></span></span></a></li>

			</ol>
		</div>
		<!-- 상단탭완료 -->






		<div class="section" id="QA_deposit2"
			style="margin-left: -50; height: 800px;">

			<div class="mTitle" style="display: none;"></div>

			<div class="mTab typeTab eTab"></div>
			<div id="tabNumber" class="tabCont" style="display: block;">


		
				<div class="mBoardtypeOrdergScrollgCellSingle"
					style="height: 550px; margin-top: 50
					px;">


				
				<div class="gLeft">


					<button  type="submit"id="delivery" class="btnCtrl" >배송</button>	
						
					</div>


					<table id="searchResultList" border="1" class="eChkTr"
						style="height: 500px;">


						<tr>

							<th scope="col" style="width: 30px;" id="check">
							<input type="checkbox" name="allCheck" id="allCheck"></th>

	
							<th scope="col" >주문번호</th>
							<th scope="col" >아이디</th>
							
							<th scope="col">금액</th>
							<th scope="col">주문일자</th>
							<th scope="col" >상태</th>
							<!-- <th scope="col" style="widht: 50px;">상태</th> -->
							<!--<th scope="col" style="widht: 50px; ">메모</th>
											  -->
						</tr>
						<%
							for (pageDTO order : pageList1) {
						%>
						
						<tr>
							<td><input type="checkbox" name="checkNo" id="checkNo"
							value="<%=order.getOrderNo()
							%>" class="check"></td>
							
							<td><%=order.getOrderNo()%> </td>
							<td><%=order.getId() %></td>
							 <td><%=order.getProductSum() %></td>
							<!--  <td><=DecimalFormat.getCurrencyInstance().format(order.getProductSum()) ></td>-->
							<td><%=order.getOrderDate().substring(0, 19)%></td>
							<td>
								<%
									if (order.getDeliveryStatus() == 1) {
								%> 배송전 <%
									} else if (order.getDeliveryStatus() == 2) {
								%>
								배송중 <%
									} else if (order.getDeliveryStatus() == 3) {
								%> 배송완료 <%
									}
								%>
							</td>
						</tr>
						<%
							}
						%>





					</table>


				<%
					int blockSize = 5;

					int startPage = (pageNum - 1) / blockSize * blockSize + 1;

					int endPage = startPage + blockSize - 1;

					if (endPage > totalPage) {
						endPage = totalPage;
					}
				%>

<div id="page" style="text-align: center;padding-top: 50px;">
					<%
						if (startPage > blockSize) {
					%>
					<a
						href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">[처음]</a>
					<a
						href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery&pageNum=<%=startPage - blockSize%>&search=<%=search%>&keyword=<%=keyword%>">[이전]</a>
					<%
						} else {
					%>
					[처음][이전]
					<%
						}
					%>

					<%
						for (int i = startPage; i <= endPage; i++) {
					%>
					<%
						if (pageNum != i) {
					%>
					<a
						href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i%>]
					</a>
					<%
						} else {
					%>
					<span style="font-weight: bold; color: red;">[<%=i%>]
					</span>
					<%
						}
					%>
					<%
						}
					%>

					<%
						if (endPage != totalPage) {
					%>
					<a
						href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery&pageNum=<%=startPage + blockSize%>&search=<%=search%>&keyword=<%=keyword%>">[다음]</a>
					<a
						href="<%=request.getContextPath()%>/admin/index.jsp?workgroup=order&work=delivery&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">[마지막]</a>
					<%
						} else {
					%>
					[다음][마지막]
					<%
						}
					%>

				</div>


			</div>
</div>


		</div>

	</form>
</div>
<!--content 영역종료 -->


</div>
<!-- container 영역종료 -->
</div>
<!-- wrap영역종료 -->

</body>
</html>

<script type="text/javascript">
$("#allCheck").change(function() {
   if($(this).is(":checked")) {
      $(".check").prop("checked",true);
   } else {
      $(".check").prop("checked",false);
   }   
});

$("#delivery").click(function () {
	
	$("#deliveryform").attr("action","<%=request.getContextPath()%>/admin/order/order_delivery_action.jsp");
	$("#deliveryform").submit();
	
	
});


    
    </script>