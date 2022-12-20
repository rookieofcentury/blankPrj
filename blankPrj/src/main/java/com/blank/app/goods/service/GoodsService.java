package com.blank.app.goods.service;

import org.springframework.stereotype.Service;

import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.ReviewVo;

@Service
public interface GoodsService {

	int add(GoodsVo vo);

	int reviewWrite(ReviewVo vo);

}
