package com.blank.app.goods.vo;

import lombok.Data;

@Data
public class ReviewVo {
	
	private String no;
	private String goods;
	private String writer;
	private int score;
	private String content;
	private String enrollDate;

}
