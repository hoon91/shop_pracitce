package com.daily.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.daily.dao.MemberDAO;
import com.daily.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO memberDAO;

	@Override
	public void signup(MemberVO vo) throws Exception {
		memberDAO.signup(vo);
	}

	@Override
	public MemberVO read(String userid) throws Exception {
		return memberDAO.read(userid);
	}

	@Override
	public int idCheck(String userid) throws Exception {
		return memberDAO.idCheck(userid);
	}

	@Override
	public MemberVO updateUI(String userid) throws Exception {
		return memberDAO.read(userid);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		memberDAO.update(vo);
	}

	@Override
	public void delete(MemberVO vo) throws Exception {
		memberDAO.delete(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return memberDAO.login(vo);
	}

	
	
	
}
