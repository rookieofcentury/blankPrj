package com.blank.app.goods.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GoodsVo {
	
	private String no;
	private String category;
	private String name;
	private int price;
	private String stock;
	private String content;
	private String enrollDate;
	private char deleteYn;
	private String exhibition;
	private List<String> thumbnail;
	private List<MultipartFile> thumbnailFile;
	
	public boolean isEmpty() {
		if(thumbnailFile.get(0).isEmpty()) {return true;}
		if(thumbnailFile == null){return true;}
		if(thumbnailFile.size() == 0){return true;}
		
		return false;
	}


}