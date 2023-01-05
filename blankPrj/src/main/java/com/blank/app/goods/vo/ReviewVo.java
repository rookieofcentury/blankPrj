package com.blank.app.goods.vo;

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

}
