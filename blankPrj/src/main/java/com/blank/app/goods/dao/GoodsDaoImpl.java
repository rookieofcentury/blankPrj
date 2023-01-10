package com.blank.app.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.blank.app.admin.common.PageVo;
import com.blank.app.goods.vo.CartVo;
import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.PaymentVo;
import com.blank.app.goods.vo.ReviewVo;
import com.blank.app.member.vo.AddressVo;

@Repository
public class GoodsDaoImpl implements GoodsDao {
	
	// 굿즈 등록 페이지 Category List 찾기
	@Override
	public List<Map<String, String>> selectCategoryList(SqlSessionTemplate sst) {
		return sst.selectList("goodsMapper.selectCategoryList");
	}
	
	// 굿즈 등록 페이지 Exhibition List 찾기
	@Override
	public List<Map<String, String>> selectExhibitionList(SqlSessionTemplate sst) {
		return sst.selectList("goodsMapper.selectExhibitionList");
	}

	// 굿즈 등록하기 - insertGoods
	@Override
	public int insertGoods(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("goodsMapper.insertGoods", map);
	}

	// 리뷰 작성하기 - insertReview
	@Override
	public int insertReview(SqlSessionTemplate sst, ReviewVo vo) {
		return sst.insert("goodsMapper.insertReview", vo);
	}
	
	// 리뷰 파일 삽입하기
	public int insertReviewFile(SqlSessionTemplate sst, ReviewVo vo) {
		return sst.insert("goodsMapper.insertReviewFile", vo);
	}

	// admin 페이지 goods list Count - countGoods
	@Override
	public int countGoods(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("goodsMapper.goodsCnt", map);
	}
	
	// admin 페이지 goods list 조회 - selectAdminGoodsList
	@Override
	public List<GoodsVo> selectAdminGoodsList(SqlSessionTemplate sst, Map<String, String> map, PageVo pv) {
		
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("goodsMapper.selectAdminGoodsList", map, rb);
	}
	
	// 해당 굿즈 번호로 해당되는 사진들 찾기
	@Override
	public List<String> findThumbnail(SqlSessionTemplate sst, int no) {
		return sst.selectList("goodsMapper.findThumbnail", no);
	}
	
	// 굿즈 번호로 굿즈 한 개에 대한 정보 조회
	@Override
	public GoodsVo detail(SqlSessionTemplate sst, int no) {
		return sst.selectOne("goodsMapper.detail", no);
	}

	// 굿즈 삭제하기 - deleteGoods
	@Override
	public int deleteGoods(SqlSessionTemplate sst, int no) {
		return sst.update("goodsMapper.deleteGoods", no);
	}

	// 굿즈 수정하기
	@Override
	public int editGoods(SqlSessionTemplate sst, GoodsVo vo) {
		return sst.update("goodsMapper.editGoods", vo);
	}

	// 굿즈 수정하기 - Thumbnail 새로 받은 거 넣어 주기
	@Override
	public int insertAllThumbnail(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("goodsMapper.insertThumbnail", map);
	}

	// 굿즈 수정하기 - 사진 삭제
	public int deleteThumbnail(SqlSessionTemplate sst, @Param("delete") String[] delete) {
		return sst.delete("goodsMapper.deleteThumbnail", delete);
	}
	
	// 메인에서 굿즈 8 개 랜덤 출력하기
	public List<GoodsVo> selectMainGoodsList(SqlSessionTemplate sst) {
		return sst.selectList("goodsMapper.mainGoodsList");
	}

	// 장바구니 list 출력
	public List<CartVo> selectCartList(SqlSessionTemplate sst, List<String> array) {
		return sst.selectList("goodsMapper.getCartList", array);
	}

	// 주문 내역 insert all
	public int insertOrder(SqlSessionTemplate sst, Map<String, Object> list) {
		return sst.update("goodsMapper.insertOrder", list);
	}

	// 포인트 사용한 만큼 update
	public int updatePoint(SqlSessionTemplate sst, PaymentVo pay) {
		return sst.update("goodsMapper.updatePoint", pay);
	}

	// 결제 내역 찾기
	public PaymentVo selectPaymentVoByNo(SqlSessionTemplate sst, PaymentVo pay) {
		return sst.selectOne("goodsMapper.selectPaymentVoByNo", pay);
	}

	// 해당 굿즈 리뷰 수 확인
	public int selectReviewCnt(SqlSessionTemplate sst, int no) {
		return sst.selectOne("goodsMapper.selectReviewCntbyGNo", no);
	}

	// 리뷰 리스트 찾기
	public List<ReviewVo> selectReviewListbyGNo(SqlSessionTemplate sst, Map<String, Object> map, PageVo pv) {
		
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("goodsMapper.selectReviewListbyGNo", map, rb);
		
	}

	// 리뷰 개수, 스코어
	public List<Map<String, Object>> selectTotalListbyGNo(SqlSessionTemplate sst, int no) {
		return sst.selectList("goodsMapper.selectTotalListbyGNo", no);
	}

	// 리뷰 좋아요 추가
	public int insertReviewLike(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.insert("goodsMapper.insertReviewLike", map);
	}

	// 리뷰 좋아요 취소
	public int deleteReviewLike(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.delete("goodsMapper.deleteReviewLike", map);
	}

	// 회원번호로 주소 찾기
	public AddressVo selectAddressByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("goodsMapper.selectAddressByNo", no);
	}

	// 좋아요 여부 받기
	public String getIsLikeLm(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.selectOne("goodsMapper.getIsLikeLm", map);
	}

	// search 결과 값
	public int searchListCount(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("goodsMapper.searchListCount", map);
	}

	// 굿즈 검색 결과
	public List<GoodsVo> searchGoodsList(SqlSessionTemplate sst, Map<String, String> map, PageVo pv) {
		
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, limit);
		
		return sst.selectList("goodsMapper.searchGoodsList", map, rb);
		
	}

	// 주소지 변경
	public int updateAddress(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("goodsMapper.updateAddress", map);
	}

	// 굿즈 재고 알림 등록
	public int insertStockAlert(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("goodsMapper.insertStockAlert", map);
	}

	// 재고 알림 등록 여부
	public int selectStockAlert(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.selectOne("goodsMapper.selectStockAlert", map);
	}

	// 전화번호 목록 도출
	public List<String> selectPhoneList(SqlSessionTemplate sst, String no) {
		return sst.selectList("goodsMapper.selectPhoneList", no);
	}

	// 전화번호 목록 삭제
	public int deletePhoneList(SqlSessionTemplate sst, String no) {
		return sst.delete("goodsMapper.deletePhoneList", no);
	}
	
	// 리뷰 번호로 리뷰 찾기
	public ReviewVo findReviewByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("goodsMapper.findReviewByNo", no);
	}

	// 리뷰 삭제
	public int deleteReview(SqlSessionTemplate sst, String no) {
		return sst.delete("goodsMapper.deleteReview", no);
	}

	// 리뷰 수정
	public int editReview(SqlSessionTemplate sst, ReviewVo vo) {
		return sst.insert("goodsMapper.editReview", vo);
	}

	// 리뷰 첨부 파일 삭제
	public int deleteAtt(SqlSessionTemplate sst, String no) {
		return sst.delete("goodsMapper.deleteAtt", no);
	}


}
