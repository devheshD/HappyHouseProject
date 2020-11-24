package com.ssafy.house.dto;

import java.sql.Date;

public class QnaBoardDto {
	private int no;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	
	public int getNo() {
		return no;
	}
	public void setNoq(int no) {
		this.no = no;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	
}
