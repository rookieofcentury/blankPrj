package com.blank.app.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PayController {

	@GetMapping("pay")
	public String payProject() {
		return "payProject/payMain";
	}
	
}