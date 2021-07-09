package com.daily.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.daily.dao.ShopDAO;
import com.daily.vo.CartListVO;
import com.daily.vo.CartVO;
import com.daily.vo.GoodsViewVO;
import com.daily.vo.OrderDetailVO;
import com.daily.vo.OrderListVO;
import com.daily.vo.OrderVO;
import com.daily.vo.ReplyVO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Inject
	ShopDAO dao;

	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
		int cateCodeRef = 0;  // 카테고리 참조 코드. 없어도 무관
		 
		 if(level == 1) {  // lavel 1 = 1차 분류.
		  
		  cateCodeRef = cateCode;
		  return dao.list(cateCode, cateCodeRef);
		  // 두가지 모두 cateCode로 해도 무관
		  
		 } else {  // lavel 2 = 2차 분류
		  
		  return dao.list(cateCode);
		  
		 }
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);
	}

	@Override
	public List<ReplyVO> replyList(int gdsNum) throws Exception {
		return dao.replyList(gdsNum);
	}

	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}

	@Override
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}


	@Override
	public void addCart(CartListVO cart) throws Exception {
		dao.addCart(cart);
	}

	@Override
	public List<CartListVO> cartList(String userid) throws Exception {
		return dao.cartList(userid);
	}

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}
	
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}
	
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}

	@Override
	public void cartAllDelete(String userid) throws Exception {
		dao.cartAllDelete(userid);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	
	
}
