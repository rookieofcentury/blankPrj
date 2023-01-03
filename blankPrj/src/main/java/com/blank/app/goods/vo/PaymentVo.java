package com.blank.app.goods.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class PaymentVo {
	
	private String no;
	private String consumer;
	private String price;
	private String delivery;
	private String usepoint;
	private String totalprice;
	private String payDate;
	private String payment;
	private String status;
	private String impUid;
	private String payMethod;
	private String paidAt;
	private String receiptUrl;
	
	private String name;
	private String phone;
	private String address1;
	private String address2;
	private String address3;
	private String message;

}
