package com.daily.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daily.vo.CategoryVO;
import com.daily.vo.GoodsVO;
import com.daily.vo.GoodsViewVO;
import com.daily.vo.MemberVO;
import com.daily.vo.OrderListVO;
import com.daily.vo.OrderVO;
import com.daily.vo.ReplyListVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sql;

	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList("adminMapper.category");
	}
	
	@Override
	public List<MemberVO> list() throws Exception {
		return sql.selectList("adminMapper.list");
	}

	@Override
	public void register(GoodsVO vo) throws Exception {
		sql.insert("adminMapper.register", vo);
	}

	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		return sql.selectList("adminMapper.goodslist");
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne("adminMapper.goodsView", gdsNum);
	}

	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		sql.update("adminMapper.goodsModify", vo);
	}

	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		sql.delete("adminMapper.goodsDelete", gdsNum);
	}

	@Override
	public List<OrderVO> orderList() throws Exception {
		return sql.selectList("adminMapper.orderList");
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList("adminMapper.orderView", order);
	}

	@Override
	public void delivery(OrderVO order) throws Exception {
		sql.update("adminMapper.delivery", order);
	}

	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		sql.update("adminMapper.changeStock", goods);
	}

	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return sql.selectList("adminMapper.allReply");
	}

	@Override
	public void deleteReply(int repNum) throws Exception {
		sql.delete("adminMapper.deleteReply", repNum);
	}
}
