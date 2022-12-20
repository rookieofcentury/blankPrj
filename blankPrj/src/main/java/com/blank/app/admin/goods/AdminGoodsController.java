package com.blank.app.admin.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blank.app.goods.service.GoodsService;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.OptionVo;

@Controller
@RequestMapping("admin/goods")
public class AdminGoodsController {
	
	@Autowired
	private GoodsService gs;
	
	// 굿즈 등록 (화면)
	@GetMapping("/add")
	public String add() {
		return "admin/goods/add";
	}
	
	// 굿즈 등록 (찐)
	@PostMapping("/add")
	public String add(GoodsVo vo, List<OptionVo> op, HttpServletRequest req) {
		
		vo.setOptionList(op);
		int result = gs.add(vo);
		
		return "admin/goods/list";
	}

}
