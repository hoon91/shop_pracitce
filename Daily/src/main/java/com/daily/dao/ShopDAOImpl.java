package com.daily.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daily.vo.CartListVO;
import com.daily.vo.CartVO;
import com.daily.vo.GoodsViewVO;
import com.daily.vo.OrderDetailVO;
import com.daily.vo.OrderListVO;
import com.daily.vo.OrderVO;
import com.daily.vo.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	@Inject
	SqlSession sql;

	// 카테고리별 상품 리스트 : 1차 분류
	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
	 
	 HashMap<String, Object> map = new HashMap<String, Object>();
	 
	 map.put("cateCode", cateCode);
	 map.put("cateCodeRef", cateCodeRef);
	 
	 return sql.selectList("shopMapper.list_1", map);
	}

	// 카테고리별 상품 리스트 : 2차 분류
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
	 
	 return sql.selectList("shopMapper.list_2", cateCode);
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne("adminMapper.goodsView", gdsNum);
	}

	@Override
	public void registReply(ReplyVO reply) throws Exception {
		sql.insert("shopMapper.registReply", reply);
	}

	@Override
	public List<ReplyVO> replyList(int gdsNum) throws Exception {
		return sql.selectList("shopMapper.replyList", gdsNum);
	}

	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete("shopMapper.deleteReply", reply);
	}

	@Override
	public String idCheck(int repNum) throws Exception {
		return sql.selectOne("shopMapper.replyUserIdCheck", repNum);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		sql.update("shopMapper.modifyReply", reply);
	}

	@Override
	public void addCart(CartListVO cart) throws Exception {
		sql.insert("shopMapper.addCart", cart);
	}

	@Override
	public List<CartListVO> cartList(String userid) throws Exception {
		return sql.selectList("shopMapper.cartList", userid);
	}

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete("shopMapper.deleteCart", cart);
	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert("shopMapper.orderInfo_Details", orderDetail);
	}

	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert("shopMapper.orderInfo", order);
	}

	@Override
	public void cartAllDelete(String userid) throws Exception {
		sql.delete("shopMapper.cartAllDelete", userid);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList("shopMapper.orderList", order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList("shopMapper.orderView", order);
	}
	
	
	
	
}
