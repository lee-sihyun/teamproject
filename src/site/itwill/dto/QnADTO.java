package site.itwill.dto;

/*
이름        널?       유형             
--------- -------- -------------- 
NUM       NOT NULL NUMBER(20)  		- 게시글 번호(고유값) : 자동증가값     
TITLE     NOT NULL VARCHAR2(200)	- 게시글 제목   
CONTENT   NOT NULL VARCHAR2(3000) 	- 게시글 내용
CATEGORY  NOT NULL VARCHAR2(20)   	- 게시글이 속한 카테고리
INQUIRY   NOT NULL VARCHAR2(10)		- 질문에 대한 답변 상태
ID        NOT NULL VARCHAR2(20)   	- 작성자 아이디 : 로그인 사용자의 아이디
REGDATE            DATE           	- 게시글 작성일자 : 현재(저장날짜)
REF                NUMBER(4)      	- 게시글 그룹번호 : 답글
REF_STEP           NUMBER(4)      	- 게시글 그룹순서 : 답글
REF_LEVEL          NUMBER(4)      	- 게시글 깊이 : 답글 
STATUS    NOT NULL NUMBER(1)      	- 게시글 상태 : 0(일반글), 1(비밀글), 9(삭제글)
*/

public class QnADTO {
	private int num;
	private String title;
	private String content;
	private String category;
	private String inquiry;
	private String id;
	private String regDate;
	private int ref;
	private int refStep;
	private int refLevel;
	private int status;
	
	public QnADTO() {
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getInquiry() {
		return inquiry;
	}

	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRefStep() {
		return refStep;
	}

	public void setRefStep(int refStep) {
		this.refStep = refStep;
	}

	public int getRefLevel() {
		return refLevel;
	}

	public void setRefLevel(int refLevel) {
		this.refLevel = refLevel;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}

