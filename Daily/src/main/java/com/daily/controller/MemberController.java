package com.daily.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.daily.service.MemberService;
import com.daily.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup() {
		return "member/signup";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(MemberVO vo, @ModelAttribute("detailAddress") String detailAddress) throws Exception {
		
		String address= vo.getUseraddress() + " " + detailAddress;
		
		if (detailAddress == null) {
			address = vo.getUseraddress();
		}
		
		vo.setUseraddress(address);	

		memberService.signup(vo);
		
		return "redirect:/member/read/" + vo.getUserid();
	}
	
	
	@RequestMapping(value = "/read/{userid}", method = RequestMethod.GET)
	public String read(@PathVariable("userid") String userid, Model model) throws Exception {
		
		MemberVO vo = memberService.read(userid);
		model.addAttribute("userInfo", vo);
		
		return "member/read";

	}
	
	@ResponseBody /* return되는 값은 view의 주소가 아닌 데이터임을 나타내는 어노테이션 */
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(MemberVO vo) throws Exception {
		
		String userid = vo.getUserid();
		int result = memberService.idCheck(userid);
		/* 만약, DB에 ID가 존재하면 1을, 존재하지 않으면 0을 return 할 것임 */
		return result;
	}
	
	@RequestMapping(value = "/update/{userid}", method = RequestMethod.GET)
	public String update(@PathVariable("userid") String userid, Model model) throws Exception {
		
		MemberVO vo = memberService.updateUI(userid);
		model.addAttribute("userInfo", vo);
		
		return "member/update";
	}


	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(MemberVO vo, @ModelAttribute("detailAddress") String detailAddress) throws Exception {
		/* detailAddress : 상세주소 받아오기 */
    	String adderss = vo.getUseraddress() + " " + detailAddress;
		
		if (detailAddress == null) {
			adderss = vo.getUseraddress();
		}
		
		vo.setUseraddress(adderss);		

        memberService.update(vo);
		
		ModelAndView mav = new ModelAndView();

		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/member/read/" + vo.getUserid());
		redirectView.setExposeModelAttributes(false);

		mav.setView(redirectView);

		return mav;
		
	}
	
	
	@RequestMapping(value="/delete/{userid}", method=RequestMethod.GET)
	public String delete(@PathVariable("userid") String userid, Model model) throws Exception {
		
		MemberVO vo = memberService.read(userid);
		model.addAttribute("userInfo", vo);
		
		return "member/delete";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(MemberVO vo) throws Exception {
		
		memberService.delete(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST) 
	public String loginPost(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		MemberVO member = memberService.login(vo);
		HttpSession session = request.getSession();
	
		
		if(member != null) {
			session.setAttribute("member", member);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/login";
		}
		
		return "redirect:/";
		
	}

	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.sendRedirect("/");

	}

	
	
}
