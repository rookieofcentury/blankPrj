package com.blank.app.goods.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.ReviewVo;

@Service
public interface GoodsService {

	int add(GoodsVo vo);

	int reviewWrite(ReviewVo vo);

	List<GoodsVo> adminList();

	GoodsVo detail(int no);

	int deleteGoods(int no);

}
