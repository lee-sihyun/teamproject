package site.itwill.dto;

/*CREATE TABLE NOTICE(
NUM NUMBER(20) NOT NULL PRIMARY KEY(NUM),
  TITLE VARCHAR2(200) , 
CONTENT VARCHAR2(3000),
  ID VARCHAR2(20) NOT NULL,
  REGDATE DATE DEFAULT SYSDATE,
  STATUS NUMBER(1),
  READCOUNT NUMBER(20)
 );*/

public class noticeDTO {

	
	private int num;
	private String title;
	private String content;
	private String id;
	private String regdate;
	private int readcount;
	
	
	public noticeDTO() {
		// TODO Auto-generated constructor stub
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}



	
	
	


	
}
