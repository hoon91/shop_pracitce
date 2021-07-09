package com.daily.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.daily.dao.AdminDAO;
import com.daily.vo.CategoryVO;
import com.daily.vo.GoodsVO;
import com.daily.vo.GoodsViewVO;
import com.daily.vo.MemberVO;
import com.daily.vo.OrderListVO;
import com.daily.vo.OrderVO;
import com.daily.vo.ReplyListVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	AdminDAO dao;
	
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}
	
	@Override
	public List<MemberVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		return dao.goodslist();
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		dao.goodsModify(vo);
	}

	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		dao.goodsDelete(gdsNum);
	}

	@Override
	public List<OrderVO> orderList() throws Exception {
		return dao.orderList();
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}

	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		dao.changeStock(goods);
	}

	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return dao.allReply();
	}

	@Override
	public void deleteReply(int repNum) throws Exception {
		dao.deleteReply(repNum);
	}
	
	
	
	
	
	
}
