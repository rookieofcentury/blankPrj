package com.blank.app.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PayController {

		@GetMapping("pay")
		public String payProject() {
			return "pay/payProject";
		}
		
	}


