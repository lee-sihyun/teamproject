<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="site.itwill.dao.ProductDAO"%>

<%@page import="site.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String saveDirectory = request.getServletContext().getRealPath("/admin/product_image");

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, 30 * 1024 * 1024, "UTF-8",
			new DefaultFileRenamePolicy());

	//내가 입력한 값으로
	
	int num=ProductDAO.getDAO().getProductNum();
	
	
	String mainCategory = mr.getParameter("mainCategory");
	String subCategory = mr.getParameter("subCategory");
	//int itemNo = Integer.parseInt(mr.getParameter("num")); 아이템 번호 자동증가로 지워둠
	
	
	int stock = Integer.parseInt(mr.getParameter("stock"));
	int price = Integer.parseInt(mr.getParameter("price"));
	String name = mr.getParameter("name");
	String image = mr.getFilesystemName("image");
	String imageDetail = mr.getFilesystemName("imageDetail");

	//DTO 인스턴스 생성하고 입력값으로 필드값 변경
	ProductDTO product = new ProductDTO();
	product.setNum(num);
	product.setMainCategory(mainCategory);
	product.setSubCategory(subCategory);
	product.setItemNo(num);
	product.setStock(stock);
	product.setPrice(price);
	product.setName(name);
	product.setImage(image);
	product.setImageDetail(imageDetail);

	/*
	//제품코드를 전달하여 PRODUCT 테이블에 저장 유무를 검색하여 반환하는 DAO 클래스의 메소드 호출
	//=> 입력된 제품코드가 이미 PRODUCT 테이블에 저장된 경우
	if(ProductDAO.getDAO().isProduct(productCode)) {
		//자동으로 업로드 처리된 입력파일을 제거
		new File(saveDirectory,mainImage).delete();
		session.setAttribute("message", "이미 저장된 제품코드를 입력 하였습니다.");
		session.setAttribute("product", product);
		response.sendRedirect(request.getContextPath()+"/admin/index.jsp?workgroup=product&work=product");
		return;
	}
	*/

	//제품정보를 전달하여 PRODUCT 테이블에 저장하는 DAO 클래스의 메소드 호출
	ProductDAO.getDAO().insertProduct(product);

	//제품목록 출력페이지 이동
	response.sendRedirect(request.getContextPath() + "/admin/index.jsp?workgroup=product&work=product_list");
%>

