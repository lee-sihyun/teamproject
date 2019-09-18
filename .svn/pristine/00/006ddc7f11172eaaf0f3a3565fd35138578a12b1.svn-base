<%@page import="java.text.DecimalFormat"%>
<%@page import="site.itwill.dao.ProductDAO"%>
<%@page import="site.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	String keyword = request.getParameter("keyword");

	ProductDTO product = ProductDAO.getDAO().getProduct(num);
%>
<jsp:include page="/admin/header.jsp" />
<style type="text/css">
#wrapper {
	width: 500px;
	margin: 0 auto;
}

table {
	    width: 1239px;
 /*   height: 827px;*/
    border-top: 1px solid #dedede;
    line-height: 1.5;
    background-color: #fff;
    table-layout: fixed;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 5px;
}

th {
	width: 100px;
}

td {
	width: 400px;
}

.title, .content {
	text-align: left;
}

.content {
	height: 100px;
	vertical-align: middle;
}

#board_menu {
	text-align: right;
	margin: 5px;
}





#content {
	width: 1280px;
	min-height: 750px;
	padding: 0px 40px 130px 40px;
	box-sizing: border-box;
vertical-align: top;


}


.section {
    width: 1238px;
   /* height: 1000px;*/
    margin: 0 0 30px 0;
    padding: 30px 20px 30px 20px;
    border-radius: 2px;
    border: 1px solid #ddd;
    background: #fff;
    box-shadow: 0px 2px 1px 0px rgba(205, 211, 222, 1);


}

.mToggleBar {
	width: 1278px;
	height: 48px;
	margin: 0 0 -1px 0;
	box-sizing: border-box;
	background-color: #8b93a9;
	border: 1px solid #787d8f;
}

.mToggleBar h2 {
	width: 68.625px;
	height: 21px;
	float: left;
	padding: 0 0 0 20px;
	font-size: 16px;
	color: #535354;
	font-weight: normal;
}
.toggleArea {
	width: 1240px;
	/*ight: 828px*/
	display: block;
	/*padding: 30px 20px 30px 20px;*/
	border-radius: 2px;
	background: #fff;
	box-shadow: 0px 2px 1px 0px rgba(205, 211, 222, 1);
}

.title {width: 159px;
    height: 31px;
    padding: 11px 15px 10px 15px;
    border: 1px solid #dedede;
    text-align: left;
    word-break: keep-all;
   /* vertical-align: top;*/
    color: #2e3039;
    background-color: #f3f3f3;
    font-size: 16px;
    text-align: justify;
    }
    td {
        width: 1018px;
    height: 32px;
    border: 1px solid #dedede;
    padding: 10px 15px 10px 15px;
    line-height: 24px;
   /* vertical-align: top;*/
    display: table-cell;
    }
    
    
    .button {
    color: black;
    width: 100x;
    height: 30px;
    background: #55a0ff;
    
    }

.action {
text-align: center;
}

.test {

   color: white;
    width: 100px;
    height: 30px;
    background: #55a0ff;
}

</style>

<div id="content"> 
<div class="section">
<div class="mToggleBar" style="
    width: 1238.989583px;
    height: 41.979166px;
    border-bottom-width: 0px;
    border-right-width: 0px;
">
<h2>제품정보</h2>
</div>


<div class="toggleArea">
<table style="padding-left: 500px;">

	<tr>
		<td class="title">카테고리-대분류</td>
		<td class="value">
			<%
				if (Integer.parseInt(product.getMainCategory()) == 1) {
			%> 배쓰 <%
				} else if (Integer.parseInt(product.getMainCategory()) == 2) {
			%> 샤워 <%
				} else if (Integer.parseInt(product.getMainCategory()) == 3) {
			%> 보디 <%
				}
			%>
		
	</tr>

	<tr>
		<td class="title">카테고리-소분류</td>
		<td class="value">
			<% if (Integer.parseInt(product.getSubCategory()) == 1) {%> 
			배쓰밤 
			<% } else if (Integer.parseInt(product.getSubCategory()) == 2) {%> 
			버블바 
			<% } else if (Integer.parseInt(product.getSubCategory()) == 3) {%> 
			배쓰오일 
			<% }else if (Integer.parseInt(product.getSubCategory())==4){%> 
			솝 
			<%}else if (Integer.parseInt(product.getSubCategory())==5){ %>
			샤워젤 젤리
			<%}else if (Integer.parseInt(product.getSubCategory())==6){ %>
			보디컨디셔너
			<%}else if (Integer.parseInt(product.getSubCategory())==7){ %>
			샤워밤
				<%}else if (Integer.parseInt(product.getSubCategory())==8){ %>
			클렌저
					<%}else if (Integer.parseInt(product.getSubCategory())==9){ %>
					핸드앤풋
			<%}else if (Integer.parseInt(product.getSubCategory())==10){ %>
			로션
			<%} %>
		</td>
	</tr>


	<tr>
		<td class="title">상품코드</td>
		<td class="value"><%=product.getItemNo()%></td>
	</tr>

	<tr>
		<td class="title">제품수량</td>
	
		<td class="value"><%=DecimalFormat.getInstance().format(product.getStock()) %></td>
	</tr>



	<tr>
		<td class="title">제품가격</td>
		<td class="value"><%=DecimalFormat.getCurrencyInstance().format(product.getPrice())%></td>
	</tr>


	<tr>

		<td class="title">제품이름</td>
		<td class="value"><%=product.getName()%></td>
	</tr>
	<tr>
		<td class="title">제품이미지</td>
		<td class="value"><img
			src="<%=request.getContextPath()%>/admin/product_image/<%=product.getImage()%>"
			width="200"></td>
	</tr>


	<tr>
		<td class="title">제품상세설명</td>
		<td class="value"><img
			src="<%=request.getContextPath()%>/admin/product_image/<%=product.getImageDetail()%>"
			width="200"></td>
	</tr>



</table>
</div>

<div id="board_menu"  style="
    padding-top: 30px;
">

	<div class="action">
		<button type="button" id="removeBtn" class="test">상품삭제</button>
		<button type="button" id="modifyBtn" class="test">상품변경</button>
		<button type="button" id="listBtn" class="test">목록</button>
	</div>
</div>

<form id="boardForm" method="post">
	<input type="hidden" name="num" value="<%=num%>"> 
	
</form>

</div>
</div>

<script type="text/javascript">
$("#removeBtn").click(function() {
	if(confirm("정말로 삭제 하시겠습니까?")) {
		$("#boardForm").attr("action", "<%=request.getContextPath()%>/admin/product/product_remove_action.jsp");
		$("#boardForm").submit();
	}
});

$("#modifyBtn").click(function() {
	$("#boardForm").attr("action", "<%=request.getContextPath()%>/admin/index.jsp?workgroup=product&work=product_modify");
	$("#boardForm").submit();
});

$("#listBtn").click(function() {
	$("#boardForm").attr("action", "<%=request.getContextPath()%>/admin/index.jsp?workgroup=product&work=product_list");
						$("#boardForm").submit();
					});
					

				
					
</script>