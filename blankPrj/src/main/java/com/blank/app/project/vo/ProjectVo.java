package com.blank.app.project.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProjectVo {
	
	private String no;
	private String mno;
	private String news;
	private String review;
	private String creator;
	private String creatorInfo;
	private String category;
	private String title;
	private String price;
	private String startDate;
	private String endDate;
	private String deliveryDate;
	private String summary;
	private String time;
	private String url;
	private String story;
	private String status;
	private String deleteYn;
	private int percent;
	private String calDate; // 남은기간 계산 
	private String payDate;
	private String changeName;
	private MultipartFile prjfile;
	
	public boolean isEmpty() {
		if(prjfile == null){return true;}
		if(prjfile.isEmpty()) {return true;}
		if(prjfile.getSize() == 0){return true;}
		
		return false;
	}

}
