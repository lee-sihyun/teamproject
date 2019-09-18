<%@page import="site.itwill.dao.FAQDAO"%>
<%@page import="site.itwill.dto.FAQDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getParameter("num") == null) {
		out.println("<script>");
		out.println("loaction.href='" + request.getContextPath()
				+ "/admin/index.jsp?workgroup=board&work=faq_list';");
		out.println("</script>");
		return;
	}

	request.getParameter("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	String keyword = request.getParameter("keyword");

	//게시글 번호를 받아와 게시글을 검색하는 DAO클래스 메소드 호출
	FAQDTO notice = FAQDAO.getDAO().getFAQ(num);

	if (notice == null) {

		out.println("<script>");
		out.println("loaction.href='" + request.getContextPath()
				+ "/admin/index.jsp?workgroup=board&work=faq_list';");
		out.println("</script>");
		return;
	}
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

th {width: 159px;
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

.btn {

   color: white;
    width: 100px;
    height: 30px;
    background: #55a0ff;
}


.mButtongCenter{
text-align: center;
padding-top: 30px;
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
<h2>FAQ 수정</h2>
</div>
<form
	action="<%=request.getContextPath()%>/admin/board/faq_modify_action.jsp"
	method="post" id="boardForm" >
	<input type="hidden" name="num" value="<%=num%>"> <input
		type="hidden" name="pageNum" value="<%=pageNum%>"> <input
		type="hidden" name="search" value="<%=search%>"> <input
		type="hidden" name="keyword" value="<%=keyword%>">
			<div class="tableArea">
	<div class="toggleArea">
	<table  style="padding-left: 500px;">
		<tr>
			<th>카테고리</th>
			<td><select name="category">
					<option value="주문/배송" selected="selected">&nbsp;주문/배송&nbsp;</option>
					<option value="교환/반품">&nbsp;교환/반품&nbsp;</option>

			</select></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title"
				value="<%=notice.getTitle()%>"></td>
		</tr>

		<tr>
			<th>내용</th>
			<td><textarea cols="150" rows="20" name="content" id=""><%=notice.getContent()%></textarea>
			</td>
		</tr>

	

	</table>
	
	</div>
	<div style="
    text-align: center;
    padding-top: 20px;
">
	
			<button type="submit" class="btn">수정</button>
	</div>
	</div>
</form>
</div>
</div>