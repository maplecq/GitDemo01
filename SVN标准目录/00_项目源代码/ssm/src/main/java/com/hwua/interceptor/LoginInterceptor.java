package com.hwua.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录权限拦截器
 * 
 * @ClassName: LoginInterceptor
 * @Description:TODO(这里用一句话描述这个类的作用)
 * @author: maple
 * @date: 2018年11月22日 下午4:38:20
 * 
 * @Copyright: 2018 www.hwua.com Inc. All rights reserved.
 *             注意：本内容仅限于海文科信息技术股份有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class LoginInterceptor implements HandlerInterceptor {
	// 执行Controller之前
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 如果是登录页面则放行
		if (request.getRequestURI().indexOf("demo/doLogin.action") > 0) {
			return true;
		}
		HttpSession session = request.getSession();
		// 如果用户已登录也放行
		if (session.getAttribute("usersInfo") != null) {
			return true;
		}
		// 用户没有到登录页面
		String path=request.getContextPath();
		response.sendRedirect(path + "/login.jsp");
		return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
