package com.blank.app.project.vo;

import lombok.Data;

@Data
public class itemVo {
	
	/*item*/
	private String itemNo;
	private String itemName;
	
	/*option*/
	private String optionNo;
	private String optionName;
	
	/*set item*/
	private String no;
	private String name;
	private String quantity;
	private String price;
	
	/*range*/
	private String rangeNo;
	private String prjNo;

}
