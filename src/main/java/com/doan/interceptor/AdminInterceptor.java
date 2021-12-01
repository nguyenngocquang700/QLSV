package com.doan.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.doan.entity.Nhanvien;

@Transactional
public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext context;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle");
		HttpSession httpSession = request.getSession();
		if(httpSession.getAttribute("account") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		Nhanvien account = (Nhanvien) httpSession.getAttribute("account");
		Session session = factory.openSession();
		Nhanvien nv = (Nhanvien) session.get(Nhanvien.class, account.getManv());
		if(nv.getMatkhau() != account.getMatkhau()) return true;
		response.sendRedirect(request.getContextPath() + "/login");
		return false;
	}
}
