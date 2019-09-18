package site.itwill.dto;

public class ProductDTO {
	
		private int num;
		private	String mainCategory;
		private	String subCategory;
		private int itemNo;
		private int stock;
		private int price;
		private String name;
		private String image;
		private String imageDetail;
	
public ProductDTO() {
	// TODO Auto-generated constructor stub
}

public int getNum() {
	return num;
}

public void setNum(int num) {
	this.num = num;
}

public String getMainCategory() {
	return mainCategory;
}

public void setMainCategory(String mainCategory) {
	this.mainCategory = mainCategory;
}

public String getSubCategory() {
	return subCategory;
}

public void setSubCategory(String subCategory) {
	this.subCategory = subCategory;
}



public int getItemNo() {
	return itemNo;
}

public void setItemNo(int itemNo) {
	this.itemNo = itemNo;
}

public int getStock() {
	return stock;
}

public void setStock(int stock) {
	this.stock = stock;
}

public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getImage() {
	return image;
}

public void setImage(String image) {
	this.image = image;
}

public String getImageDetail() {
	return imageDetail;
}

public void setImageDetail(String imageDetail) {
	this.imageDetail = imageDetail;
}



}