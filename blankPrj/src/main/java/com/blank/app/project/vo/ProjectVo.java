package com.blank.app.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ProjectVo {
	
	private String no;
	private String creator;
	private String review;
	private String news;
	private String category;
	private String title;
	private String price;
	private Date startDate;
	private Date endDate;
	private String summary;
	private String time;
	private String url;
	private String status;
	
}
