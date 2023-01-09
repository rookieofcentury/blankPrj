package com.blank.app.project.vo;

import lombok.Data;

@Data
public class ItemVo {
	
	/*item*/
	private String itemNo;
	private String itemName;
	
	/*option*/
	private String optionNo;
	private String optionName;
	
	/*set item*/
	private String setNo;
	private String setName;
	private String setQuantity;
	private String setPrice;
	private String option;
	private String prjNo;
	
	/*range*/
	private String rangeNo;

}
