package com.daily.service;

import java.util.List;

import com.daily.vo.CategoryVO;
import com.daily.vo.GoodsVO;
import com.daily.vo.GoodsViewVO;
import com.daily.vo.MemberVO;
import com.daily.vo.OrderListVO;
import com.daily.vo.OrderVO;
import com.daily.vo.ReplyListVO;

public interface AdminService {
	
	public List<MemberVO> list() throws Exception;
	
	public List<CategoryVO> category() throws Exception;
	
	public void register(GoodsVO vo) throws Exception;
	
	public List<GoodsViewVO> goodslist() throws Exception;
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	public void goodsModify(GoodsVO vo) throws Exception;
	
	public void goodsDelete(int gdsNum) throws Exception;
	
	// 특정 주문 목록
	public List<OrderVO> orderList() throws Exception;
				
	// 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	// 배송 상태
	public void delivery(OrderVO order) throws Exception;
		
	// 상품 수량 조절
	public void changeStock(GoodsVO goods) throws Exception;
	
	// 모든 소감(댓글)
	public List<ReplyListVO> allReply() throws Exception;
		
	// 소감(댓글) 삭제
	public void deleteReply(int repNum) throws Exception;
	
	
	
	
}
