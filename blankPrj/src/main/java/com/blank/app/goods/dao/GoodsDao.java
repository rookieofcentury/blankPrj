package com.blank.app.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.blank.app.admin.common.PageVo;
import com.blank.app.goods.vo.CartVo;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.PaymentVo;
import com.blank.app.goods.vo.ReviewVo;

@Repository
public interface GoodsDao {

	// 카테고리 리스트 찾기
	List<Map<String, String>> selectCategoryList(SqlSessionTemplate sst);
	
	// 기획전 리스트 찾기
	List<Map<String, String>> selectExhibitionList(SqlSessionTemplate sst);

	// 굿즈 등록하기
	int insertGoods(SqlSessionTemplate sst, Map<String, Object> map);

	// 리뷰 등록하기
	int insertReview(SqlSessionTemplate sst, ReviewVo vo);

	// 굿즈 리스트 모두 보기 (삭제 여부 무관) - 번호, 카테고리, 이름 별로 검색 기능
	List<GoodsVo> selectAdminGoodsList(SqlSessionTemplate sst, Map<String, String> map, PageVo pv);

	// 해당 굿즈 번호로 해당되는 사진들 찾기
	List<String> findThumbnail(SqlSessionTemplate sst, int no);

	// 굿즈 번호로 굿즈 한 개에 대한 정보 조회
	GoodsVo detail(SqlSessionTemplate sst, int no);

	// 굿즈 삭제
	int deleteGoods(SqlSessionTemplate sst, int no);

	// 총 굿즈 몇 개
	int countGoods(SqlSessionTemplate sst);

	// 굿즈 수정하기
	int editGoods(SqlSessionTemplate sst, GoodsVo vo);

	// 받은 thumbnail 새로 삽입
	int insertAllThumbnail(SqlSessionTemplate sst, Map<String, Object> map);

	// thumbnail 행 DELETE
	int deleteThumbnail(SqlSessionTemplate sst, @Param("delete") String[] delete);
	
	// 메인에서 굿즈 8 개 랜덤 출력하기
	List<GoodsVo> selectMainGoodsList(SqlSessionTemplate sst);

	// 장바구니 화면 list 도출
	List<CartVo> selectCartList(SqlSessionTemplate sst, List<String> array);

	// 주문내역 insert
	int insertOrder(SqlSessionTemplate sst, Map<String, Object> list);

	// 포인트 update
	int updatePoint(SqlSessionTemplate sst, PaymentVo pay);

	// 주문 완료 화면 도출에 필요한 결제 내역 받기
	PaymentVo selectPaymentVoByNo(SqlSessionTemplate sst, PaymentVo pay);

}
