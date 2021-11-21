//package com.doan.interceptor;
//
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//@Transactional
//public class AdminInterceptor extends HandlerInterceptorAdapter {
//
//	@Autowired
//	SessionFactory factory;
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		System.out.println("preHandle");
//
//		/*
//		 * UserEntity account = checkCookie(request);
//		 * 
//		 * if (account == null) { return true; } else { Session session =
//		 * factory.getCurrentSession(); account = (UserEntity)
//		 * session.get(UserEntity.class, account.getUsername()); if
//		 * (account.getRole().getMaRole().equals("0")) { return false; } else if
//		 * (account.getRole().getMaRole().equals("1")) { request.setAttribute("admin",
//		 * "admin"); } } System.out.println(account); return true;
//		 */
//
//		HttpSession session = request.getSession();
//		Object temp = session.getAttribute("role") ;
//		if (temp == null || temp.equals("")) {
//			
//			response.sendRedirect(request.getContextPath() + "/login");
//			return false;
//		} else {
////			Session session2 = factory.getCurrentSession();
//			//UserEntity account = (UserEntity) session.getAttribute("username");
//			//UserEntity account = (UserEntity) session2.get(UserEntity.class, temp);
////			if (account.getRole().getMaRole().equals("1")) {
////				response.sendRedirect(request.getContextPath() + "/admin");
////				return true;
////			} else if (account.getRole().getMaRole().equals("0")) {
////				response.sendRedirect(request.getContextPath() + "/login");
////				return false;
////			}
//			if (temp.equals(1) ) {
////				response.sendRedirect(request.getContextPath() + "/admin");
//				return true;
//			} else /* if (temp.equals(3)) */ {
////				response.sendRedirect(request.getContextPath() + "/login");
//				response.sendError(404);
//				return false;
//			}
//			//return true;
//		}
//
//	}
//
//	/*
//	 * UserEntity checkCookie(HttpServletRequest request) { try { Cookie[] cookies =
//	 * request.getCookies(); UserEntity account = null; String username = "", passwd
//	 * = ""; for (Cookie cookie : cookies) { if
//	 * (cookie.getName().equalsIgnoreCase("username")) { username =
//	 * cookie.getValue(); } if (cookie.getName().equalsIgnoreCase("password")) {
//	 * passwd = cookie.getValue(); } } if (!username.isEmpty() && !passwd.isEmpty())
//	 * { account = new UserEntity(username, passwd); } return account; } catch
//	 * (Exception e) { // TODO: handle exception return null; } }
//	 */
//
//	/*
//	 * @Override public void postHandle(HttpServletRequest request,
//	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
//	 * throws Exception { // TODO Auto-generated method stub
//	 * super.postHandle(request, response, handler, modelAndView); }
//	 * 
//	 * @Override public void afterCompletion(HttpServletRequest request,
//	 * HttpServletResponse response, Object handler, Exception ex) throws Exception
//	 * { // TODO Auto-generated method stub super.afterCompletion(request, response,
//	 * handler, ex); }
//	 */
//}
