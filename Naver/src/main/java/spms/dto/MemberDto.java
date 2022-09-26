package spms.dto;

import java.util.Date;

public class MemberDto {
	
	private int no = 0;
	private String id = "";
	private String name = "";
	private String birthdate = "";
	private String email = "";
	private Date createDate = null;
	private Date modifiedDate = null;
	
	
	public MemberDto() {
		super();
	}


	public MemberDto(int no, String id, String name, String birthdate, 
			String email, Date createDate, Date modifiedDate) {
		super();
		this.no = no;
		this.id = id;
		this.name = name;
		this.birthdate = birthdate;
		this.email = email;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBirthdate() {
		return birthdate;
	}


	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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
		return "MemberDto [no=" + no + ", id=" + id + ", name=" + name + ", birthdate=" + birthdate + ", email=" + email
				+ ", createDate=" + createDate + ", modifiedDate=" + modifiedDate + "]";
	}


	
	
}
