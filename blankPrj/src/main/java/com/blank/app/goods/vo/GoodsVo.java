package com.blank.app.goods.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsVo {
	
	private String no;
	private String category;
	private String name;
	private int price;
	private String content;
	private String enrollDate;
	private char deleteYn;
	private List<OptionVo> optionList;
	private List<ReviewVo> reviewList;

}