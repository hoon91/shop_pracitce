package com.daily.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daily.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void signup(MemberVO vo) throws Exception {
		sqlSession.insert("memberMapper.insert", vo);
	}

	@Override
	public MemberVO read(String userid) throws Exception {
		return sqlSession.selectOne("memberMapper.read", userid);
	}

	@Override
	public int idCheck(String userid) throws Exception {
		MemberVO vo = sqlSession.selectOne("memberMapper.read", userid);
		
		if(vo != null) {
			return 1;
		} else {
			return 0;
		} /* userid로 검색해서 DB에 저장된 내용이 있으면 1, 없으면 0 반환 */

	}

	@Override
	public void update(MemberVO vo) throws Exception {
		sqlSession.update("memberMapper.update", vo);
	}

	@Override
	public void delete(MemberVO vo) throws Exception {
		sqlSession.delete("memberMapper.delete", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sqlSession.selectOne("memberMapper.login", vo);
	}

	
	
	
}
