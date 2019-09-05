package com.lnp.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lnp.entity.UserInformation;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//拦截器
public class SysInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserInformation user = (UserInformation)session.getAttribute("userSession");
		//BackendUser bUser = (BackendUser)session.getAttribute(Constants.USER_SESSION);
		if(null!=user) {
			return true;
			
		}
		response.sendRedirect(request.getContextPath()+"/user/GetToken");
		return false;
	}
	
}
