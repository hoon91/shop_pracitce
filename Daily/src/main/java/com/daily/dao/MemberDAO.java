package com.daily.dao;

import java.util.List;

import com.daily.vo.MemberVO;

public interface MemberDAO {
	
	public void signup(MemberVO vo) throws Exception;
	
	public MemberVO read(String userid) throws Exception;
	
	public int idCheck(String userid) throws Exception;
	
	public void update(MemberVO vo) throws Exception;
	
	public void delete(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	
	
	
	
	
}
