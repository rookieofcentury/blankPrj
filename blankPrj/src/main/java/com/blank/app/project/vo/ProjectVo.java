package com.blank.app.project.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProjectVo {
	
	private String no;
	private String news;
	private String review;
	private String creator;
	private String category;
	private String title;
	private String price;
	private Date startDate;
	private Date endDate;
	private String summary;
	private String time;
	private String url;
	private String status;
	private String deleteYn;
	private String changeName;
	private List<MultipartFile> prjfile;
	
	public boolean isEmpty() {
		if(prjfile.get(0).isEmpty()) {return true;}
		if(prjfile == null){return true;}
		if(prjfile.size() == 0){return true;}
		
		return false;
	}

	
}
