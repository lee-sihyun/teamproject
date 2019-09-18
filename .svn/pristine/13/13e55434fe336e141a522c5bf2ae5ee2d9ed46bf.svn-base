<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageNum = "1";
%>
<jsp:include page="/admin/header.jsp" />
<style type="text/css">
#content {
	width: 1280px;
	min-height: 750px;
	padding: 0px 40px 130px 40px;
	box-sizing: border-box;
	vertical-align: top;


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
	height: 828px;
	display: block;
	padding: 30px 20px 30px 20px;
	border-radius: 2px;
	background: #fff;
	box-shadow: 0px 2px 1px 0px rgba(205, 211, 222, 1);
}

.mBoardtypeWrite {
	width: 1240px;
	height: 828px;
}

table {
	width: 1239px;
	height: 827px;
	border-top: 1px solid #dedede;
	line-height: 1.5;
	background-color: #fff;
	table-layout: fixed;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}

colgroup {
	display: table-column-group;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
	width: 1239px;
	height: 53px;
}

th {
	width: 159px;
	height: 31px;
	padding: 11px 15px 10px 15px;
	border: 1px solid #dedede;
	text-align: left;
	word-break: keep-all;
	vertical-align: top;
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
	vertical-align: top;
	display: table-cell;
}

.overlapTip {
	width: 500px;
	height: 32px;
	position: relative;
	display: inline-block;
}

.mFormRequired {
	width: 500px;
	height: 32px;
	position: relative;
	display: inline-block;
	transition: all .2s ease-out;
}

.fText {
	width: 480px;
	height: 28px;
	max-width: 100%;
	padding: 0 9px 2px;
	box-sizing: border-box;
	border: 1px solid #d4d4d4;
	font-size: 14px;
	color: #686b6d;
	outline: 0 none;
	transition: border .2s ease-out;
}

input {
	vertical-align: middle;
}

.mButtongCenter {
	width: 1234px;
	height: 36px;
	padding: 0px 4px 0px 0px;
	margin: 20px 0px 20px 0px;
	position: relative;
	text-align: center;
}

.btn {



	padding: 0px 20px 0px 20px;
	color: #fff;
	font-size: 20px;
	line-height: 20px;
	background-color: #55a0ff;
	font-weight: normal;
	transition: .2s ease-out;
}


</style>

<!--본문내용역역 시작 content로 잡으면 됩니다  -->


<div id="content">
	<div class="headingArea"></div>

	<form
		action="<%=request.getContextPath()%>/admin/board/faq_write_action.jsp
				"
		method="post" id="boardForm">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">

		<div class="mToggleBar eToggle selected ec-product-register-toggle">
			<h2>FAQ</h2>

		</div>
		

		
		<div class="toggleArea" style="display: block">
			<div class="mBoadrtypeWrite">
				<table border="1">

					<tbody>

						<tr>




							<th scope="row" id="title">제목</th>
							<td colspan="2"><input type="text" placeholder="제목을 입력하세요. "
								name="title" style="width: 500px; height: 20px;"></td>

						</tr>

						<tr>

							<th>카테고리</th>

							<td><select name="category">
									<option value="주문/배송" selected="selected">&nbsp;주문/배송&nbsp;</option>
									<option value="교환/반품">&nbsp;교환/반품&nbsp;</option>

							</select></td>
						</tr>

						<tr style="height: 750px;">

							<th scope="row" id="content"
								style="padding-left: 15px; padding-top: 11px;">내용</th>
							<td colspan="2"><textarea cols="50" name="content"
									style="height: 700px; width: 950px;" placeholder="내용을 입력하세요. "></textarea></td>

						</tr>

						<%--/*	 --%>




					</tbody>
				</table>
			</div>
			<!-- mBoadrtypeWrite종료 -->
		</div>
		<div class="mButtongCenter">
			<button type="submit" class="btn" style="
    height: 33.99306px;
">등록</button>


		</div>
	</form>

	<!-- toggleArea 종료 -->

	<!-- 표 헤더 -->


</div>
<!-- container 영역종료 -->
</div>
<!-- wrap영역종료 -->


</body>
</html>