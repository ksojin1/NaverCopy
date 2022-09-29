package spms.dto;

import java.util.Date;

public class BoardDto {
	
	private int rowNum = 0;
	private int no = 0;
	private String userId = "";
	private String title = "";
	private String content = "";
	private Date createDate = null;
	private Date modifiedDate = null;
	
	
	public BoardDto() {
		super();
	}

	public BoardDto(int rowNum, int no, String userId, String title, String content, Date createDate,
			Date modifiedDate) {
		super();
		this.rowNum = rowNum;
		this.no = no;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
	}

	public BoardDto(int no, String userId, String title, String content, Date createDate, Date modifiedDate) {
		super();
		this.no = no;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
	}
	

	public BoardDto(int no, String userId, String title, String content) {
		super();
		this.no = no;
		this.userId = userId;
		this.title = title;
		this.content = content;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
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


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getModifiedDate() {
		return modifiedDate;
	}


	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Override
	public String toString() {
		return "BoardDto [no=" + no + ", userId=" + userId + ", title=" + title + ", content=" + content
				+ ", createDate=" + createDate + ", modifiedDate=" + modifiedDate + "]";
	}
	
}
