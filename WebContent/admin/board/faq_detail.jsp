<%@page import="site.itwill.dao.FAQDAO"%>
<%@page import="site.itwill.dto.FAQDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//비정상적인 요청에 대한 응답 처리
	// => 전달값이 존재하지 않을 경우	
	if (request.getParameter("num") == null) {
		out.println("<script>");
		out.println("location.href='" + request.getContextPath()
				+ "/admin/index.jsp?workgroup=board&work=faq_list';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	String keyword = request.getParameter("keyword");

	//게시글 번호를 전달하여 BOARD 테이블에 저장된 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출

	FAQDTO FAQ=FAQDAO.getDAO().getFAQ(num);
	
	
	//비정상적인 요청에 대한 응답 처리
	// => 검색된 게시글이 없거나 삭제된 게시글인 경우
	if (FAQ == null) {
		out.println("<script>");
		out.println("location.href='" + request.getContextPath()
				+ "/admin/index.jsp?workgroup=board&work=faq_list';");
		out.println("</script>");
		return;
	}

	//세션으로 공유된 인증정보를 반환받아 저장
	//MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

	//게시글 번호를 전달하여 BOARD 테이블에 저장된 게시글의 조회수를 1 증가 되도록 변경하는 DAO 클래스의 메소드 호출
	FAQDAO.getDAO().modifyReadCount(num);
%>
<jsp:include page="/admin/header.jsp" />
<style type="text/css">
#wrapper {
	width: 500px;
	margin: 0 auto;
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
    height: 1000px;
    margin: 0 0 30px 0;
    padding: 80px 20px 30px 20px;
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
	height: 828px;
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
	<h2 style="
    margin-top: 10px;
">게시글</h2>
	</div>
	
	<div class="toggleArea"> 
	<table>


		<tr>
			<th>작성자</th>
			<td><%=FAQ.getId()%> </td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=FAQ.getRegdate().substring(0, 19)%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=FAQ.getReadcount() + 1%></td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td><%=FAQ.getCategory() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td class="title">
		 <%=FAQ.getTitle()%>
			</td>
		</tr>

		<tr>
			<th>내용</th>
			<td class="content"><%=FAQ.getContent()%> 
			</td>
		</tr>
	</table>
	</div>

	<div id="board_menu" style="
    margin-top: 40px;     text-align: center;
">


		<button type="button" id="removeBtn" class="button">삭제</button>
		<button type="button" id="modifyBtn" class="button">변경</button>
		<button type="button" id="listBtn" class="button">목록</button>
	</div>
</div>
</div>
<form id="boardForm" method="post">
	<input type="hidden" name="num" value="<%=num%>"> <input
		type="hidden" name="pageNum" value="<%=pageNum%>"> <input
		type="hidden" name="search" value="<%=search%>"> <input
		type="hidden" name="keyword" value="<%=keyword%>">
</form>

<script type="text/javascript">
$("#removeBtn").click(function() {
	if(confirm("정말로 삭제 하시겠습니까?")) {
		$("#boardForm").attr("action", "<%=request.getContextPath()%>/admin/board/faq_remove_action.jsp");
		$("#boardForm").submit();
	}
});

$("#modifyBtn").click(function() {
	$("#boardForm").attr("action", "<%=request.getContextPath()%>/admin/index.jsp?workgroup=board&work=faq_modify");
	$("#boardForm").submit();
});


$("#listBtn").click(function() {
	$("#boardForm").attr("action", "<%=request.getContextPath()%>/admin/index.jsp?workgroup=board&work=faq_list");
	$("#boardForm").submit();
});
</script>




