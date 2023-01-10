package com.blank.app.goods.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVo {
	
	private String no;
	private String goods;
	private String writer;
	private int score;
	private String content;
	private int like;
	private String enrollDate;
	private String isLikeLm;
	private String fileName;
	private MultipartFile reviewFile;
	
	public boolean isEmpty() {
		if(reviewFile.isEmpty()) {return true;}
		if(reviewFile == null){return true;}
		if(reviewFile.getSize() == 0){return true;}
		
		return false;
	}

}
