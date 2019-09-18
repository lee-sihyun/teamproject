<%@page import="site.itwill.dao.ZipcodeDAO"%>
<%@page import="site.itwill.dto.ZipcodeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	 
	List<ZipcodeDTO> addressList=null;
	if(request.getParameter("dong")!=null){ 
    String dong=request.getParameter("dong");

    addressList=ZipcodeDAO.getDao().getZipcodeList(dong);
}
%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
#all {
    margin: 0 auto;
    width: 400px;
    text-align: center;
    font-family: "Noto Sans KR";
}

#btn {
	background: none;
	border: 1px solid black;
}

td {
	text-align: center;
}

#ad {
    font-size: 15px;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

tr td {
	border: 1px solid black;
}

.post {
    width: 100px;
    text-align: left;
    padding-left: 10px;
}

.address {
    width: 300px;
}

a {
    text-decoration: none;
}

a:hover {
    color: red;
    cursor: pointer;
}

</style>

<div id="all">
    <form method="post" name="addressForm" id="addressForm">
        <input type="text" name="dong" style="font-family: 'Noto Sans KR';" id="search" required>
        <button type="submit" style="font-family: 'Noto Sans KR';" id="btn">주소검색</button>
    </form>
    
    <%if(addressList!=null) { %>
	    <table id="ad">
	        <tr>
	            <td class="post">우편번호</td>
	            <td class="address" style="text-align: center; padding-left: 0;">상세주소</td>
	        </tr>
	        <%for (ZipcodeDTO address:addressList) { %> 
	        <tr>
	            <td class="post"><%=address.getZipcode() %></td>
	            <td class="address"><a href="javascript:sendClose('<%=address.getZipcode() %>','<%=address.getAddress() %>');"><%=address.getAddress() %></a></td>
	        </tr>
	        <%} %>
	    </table>
	 <%} %>
</div>

<script type="text/javascript">
function sendClose(code,addr) {
    if(!opener.insertForm){
        opener.changeForm.addr.value=code;
        opener.changeForm.address1.value=addr;
        window.close();
    } else {
	    opener.insertForm.addr.value=code;
	    opener.insertForm.address1.value=addr;
	    window.close();
    }
}

</script>