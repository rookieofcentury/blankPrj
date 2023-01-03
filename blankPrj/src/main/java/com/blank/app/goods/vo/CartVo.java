package com.blank.app.goods.vo;

import java.util.List;

import lombok.Data;

@Data
public class CartVo {
	
	private String no;
	private String name;
	private List<String> thumbnail;
	private String price;
	private String cnt;

}
