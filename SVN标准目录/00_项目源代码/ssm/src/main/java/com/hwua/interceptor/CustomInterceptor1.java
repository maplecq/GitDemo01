package com.hwua.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 自定义拦截器
 * @ClassName:  CustomInterceptor1   
 * @Description:TODO(这里用一句话描述这个类的作用)   
 * @author: maple
 * @date:   2018年11月22日 下午3:58:09   
 *     
 * @Copyright: 2018 www.hwua.com Inc. All rights reserved. 
 * 注意：本内容仅限于海文科信息技术股份有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class CustomInterceptor1 implements HandlerInterceptor {
	/**
	 * controller执行前调用此方法
	 * 返回true表示继续执行，返回false中止执行
	 * 这里可以加入登录校验、权限拦截等
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("------CustomInterceptor1 ...preHandle...");
		return true;
	}
	/**
	 * controller执行后但未返回视图前调用此方法
	 * 这里可在返回用户前对模型数据进行加工处理，比如这里加入公用信息以便页面显示
	 */
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("------CustomInterceptor1 ...postHandle...");
		
	}
	/**
	 * controller执行后且视图返回后调用此方法
	 * 这里可得到执行controller时的异常信息
	 * 这里可记录操作日志，资源清理等
	 */
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("------CustomInterceptor1 ...afterCompletion...");
		
	}

}
