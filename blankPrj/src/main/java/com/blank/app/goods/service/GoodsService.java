package com.blank.app.goods.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.blank.app.admin.common.PageVo;
import com.blank.app.goods.vo.CartVo;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.PaymentVo;
import com.blank.app.goods.vo.ReviewVo;

@Service
public interface GoodsService {

	int add(GoodsVo vo);

	int reviewWrite(ReviewVo vo);

	List<GoodsVo> adminList(Map<String, String> map, PageVo pageVo);

	GoodsVo detail(int no);

	int deleteGoods(int no);

	int listCount();

	List<Map<String, String>> categoryOption();

	List<Map<String, String>> exhibitionOption();

	List<String> findThumbnail(int no);

	int edit(GoodsVo vo, @Param("delete") String[] delete);
	
	List<GoodsVo> selectMainGoodsList();

	List<CartVo> getCartList(List<String> array);

	int insertOrder(List<CartVo> orderList, PaymentVo pay);

	PaymentVo selectPaymentVoByNo(PaymentVo pay);

	List<ReviewVo> reviewListbyGNo(int no, PageVo pageVo);

	int findReviewCnt(int no);

}
