package com.blank.app.admin.vo;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Data
public class NoticeVo {

	private String no;
	private String adminNo;
	private String title;
	private String content;
	private String fixeYn;
	private String writeDate;
	private String deleteYn;
	private String views;
	
}
