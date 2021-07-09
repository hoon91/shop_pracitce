package com.daily.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		HttpSession session = request.getSession();
		Object login = session.getAttribute("login");

		if (login != null) {
			session.removeAttribute("login");
		} 
		return true; 
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		Object login = modelAndView.getModel().get("login");
		
		if (login != null) {	
			session.setAttribute("login", login);
			String dest = (String)session.getAttribute("dest");
			if (dest != null) {
				response.sendRedirect(dest);
			} else {
				response.sendRedirect("/");
			}
		} else {
			response.sendRedirect("/member/login");
		}	
	}




}
